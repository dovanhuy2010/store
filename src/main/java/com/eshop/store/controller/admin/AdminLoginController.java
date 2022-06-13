package com.eshop.store.controller.admin;

import com.eshop.store.dto.DataRes;
import com.eshop.store.dto.UserDto;
import com.eshop.store.dto.UserRoleDto;
import com.eshop.store.service.UserRoleService;
import com.eshop.store.service.UserService;
import com.eshop.store.utils.Const;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("_admin")
public class AdminLoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRoleService userRoleService;

    // FIXME Please return message code in FE not BE.
    @GetMapping(value = "login")
    public String homePage(@RequestParam(required = false) String message, final Model model) {
        if (!StringUtils.isEmpty(message)) {
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
    public String redirectRegisterPage(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "admin/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ResponseEntity<DataRes> registerUser(@RequestBody UserDto userDto) {
        String pass = passwordEncoder.encode(userDto.getPassword());
        userDto.setPassword(pass);
        DataRes dataRes = userService.saveUser(userDto, Const.UserMethod.REGISTER);
        if (Const.DataRes.SUCCESS.getCode() == dataRes.getCode()) {
            return new ResponseEntity<>(dataRes, HttpStatus.CREATED);
        }
        return new ResponseEntity<>(dataRes, HttpStatus.BAD_REQUEST);
    }

    //active account
    @RequestMapping(value = "verify/{code}")
    // đánh dấu đường dẫn của web
    public String accountVerification(@PathVariable String code, Model model) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        // viết hàm lưu vào db
        DataRes dataRes = userService.confirmCode(code);

        model.addAttribute("dataRes",dataRes);
        if(Const.DataRes.SUCCESS.getCode() == dataRes.getCode()){
            List<UserRoleDto> userRoleDtos = new ArrayList<>();
            UserRoleDto userRoleDto = new UserRoleDto();
            userRoleDto.setRoleId(Const.ROLE_OTHER);
            userRoleDtos.add(userRoleDto);
            userRoleService.saveUserRole(userRoleDtos,(int)dataRes.getData());
        }
        return "redirect:/_admin/login";// đọc text từ file jsp và render ra html
    }


    @RequestMapping(value = "/forgot-Password", method = RequestMethod.GET)
    public String getForgotPasswordForm() {
        return "admin/user/forgot-password";
    }

//    @RequestMapping(value = "/forgot-password/{email}", method = RequestMethod.GET)
//    public ModelAndView forgotPassword(@PathVariable("email") String email) {
//        ModelAndView modelAndView = new ModelAndView();
//        DataRes dataRes = userService.forgotPassword(email);
//        modelAndView.addObject("dataRes", dataRes);
//        return modelAndView;
//    }

    @RequestMapping(value = "/forgot-password/{email}", method = RequestMethod.GET)
    public ResponseEntity<DataRes> verifyEmail(@PathVariable("email") String email) {
        DataRes dataRes = userService.confirmEmail(email);
        return new ResponseEntity<>(dataRes, HttpStatus.OK);
    }

    @RequestMapping(value = "/forgot-password/code/{code}", method = RequestMethod.GET)
    public ResponseEntity<DataRes> verifyCode(@PathVariable("code") String code) {
        DataRes dataRes = userService.confirmCode(code);
        return new ResponseEntity<>(dataRes, HttpStatus.OK);
    }

    @RequestMapping(value = "/forgot-password/{email}",method = RequestMethod.PUT)
    public ResponseEntity<DataRes> updatePassword(@PathVariable("email") String email,@RequestBody String password){
        String encodePassword = passwordEncoder.encode(password);
        DataRes dataRes = userService.forgotPassword(email,encodePassword);
        return new ResponseEntity<>(dataRes,HttpStatus.OK);
    }
}
