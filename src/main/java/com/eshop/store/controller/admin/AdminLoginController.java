package com.eshop.store.controller.admin;

import com.eshop.store.dto.UserDto;
import com.eshop.store.service.EmailService;
import com.eshop.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;
import java.util.UUID;

@Controller
public class AdminLoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    @RequestMapping(value = "_admin/login", method = RequestMethod.GET)
    public String homePage(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.isEmpty()) {
            if (message.equals("timeout")) {
                model.addAttribute("message", "Time out");
            }
            if (message.equals("max_session")) {
                model.addAttribute("message", "This accout has been login from another device!");
            }
            if (message.equals("logout")) {
                model.addAttribute("message", "Logout!");
            }
            if (message.equals("error")) {
                model.addAttribute("message", "Login Failed!");
            }
        }
        return "admin/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "admin/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ResponseEntity<UserDto> registerAccount(@RequestBody UserDto userDto, RedirectAttributes model) {

        userService.saveUser(userDto, UserService.DEACTIVE);
        return new ResponseEntity<>(userDto, HttpStatus.CREATED);
    }

    @RequestMapping(value = "verify/{code}")
    // đánh dấu đường dẫn của web
    public String accountVerification(RedirectAttributes model, @PathVariable String code) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        // viết hàm lưu vào db
        userService.activeAcc(code);
        model.addFlashAttribute("message", "Xác nhận đăng ký tài khoản thành công");
        return "redirect:/_admin/login";// đọc text từ file jsp và render ra html
    }


    //lỗi
    @RequestMapping(value = "/forgot-Password", method = RequestMethod.GET)
    public String forgotPasswordForm(Model model) {
        return "admin/user/forgot-password";
    }

    @RequestMapping(value = "/forgot-Password/{email}", method = RequestMethod.GET)
    public ModelAndView forgotPassword(@PathVariable("email") String email) {
        ModelAndView modelAndView = new ModelAndView();
        UserDto userDto = userService.findByEmail(email);
        userService.saveUser(userDto,userService.DEACTIVE);
        modelAndView.addObject("email",email);
        return modelAndView;
    }


    //
    @RequestMapping(value = "/forgot-password/{id}/{email}")
    public String resetPasswordForm(@PathVariable Integer id, @PathVariable String email, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("email", email);
        return "admin/user/forgot-password";
    }


    @RequestMapping(value = "/verify/{id}/{code}", method = RequestMethod.POST)
    public String resetPassword(@PathVariable("id") Integer id, @PathVariable("code") String code, @RequestBody String passWord, Model model) {
        UserDto userDto = userService.findById(id);
        userDto.setPassword(passWord);
        userService.saveUser(userDto);
        return "redirect:/_admin/login";
    }

//      page-auth-reset-password-v1.html
//    Forgot Password? => Forgot Password page => be gửi xác nhận và chuyển về trang login
//    link xác nhận được gửi đến mail, kèm trang thay đổi password => be thay đổi pass và chuyển về trang login
}
