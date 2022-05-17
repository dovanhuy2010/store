package com.eshop.store.controller.admin;


import com.eshop.store.dto.UserDto;
import com.eshop.store.entity.User;
import com.eshop.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@PreAuthorize("isAuthenticated()")
public class AdminAccountSetController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/admin/Account-setting/{id}", method = RequestMethod.GET)
    public String setAccount(@PathVariable("id") Integer id, Model model) {
        UserDto userDto = userService.findById(id);
        model.addAttribute("accoutSet", userDto);
        return "/admin/user/account";
    }

//    @RequestMapping(value = "user/{id}", method = RequestMethod.PUT)
//    public ResponseEntity<UserDto> updateUsers(@RequestBody UserDto userDto, RedirectAttributes redirect) {
//        userService.saveUser(userDto);
//        redirect.addFlashAttribute("successMessage", "Update user successfully!");
//        return new ResponseEntity<>(userDto, HttpStatus.CREATED);
//    }


    @RequestMapping(value = "/admin/checkPassword/{id}", method = RequestMethod.POST)
    public ResponseEntity<Boolean> checkPassword(@PathVariable("id") Integer id, @RequestBody String password, Model model) {
        UserDto userDto = userService.findById(id);
        return new ResponseEntity<>(passwordEncoder.matches(password, userDto.getPassword()), HttpStatus.OK);
    }

    @RequestMapping(value = "/admin/account-update", method = RequestMethod.PUT)
    public ResponseEntity<UserDto> changeAccount(@RequestBody UserDto userDto, Model model) {
//        User user = userService.findById(userDto.getId());
        UserDto user = userService.findById(userDto.getId());

        passwordEncoder.matches(userDto.getPassword(), user.getPassword());
        return new ResponseEntity<>(userDto, HttpStatus.CREATED);
    }
}
