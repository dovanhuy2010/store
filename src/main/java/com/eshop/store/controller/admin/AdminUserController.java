package com.eshop.store.controller.admin;

import com.eshop.store.dto.DataRes;
import com.eshop.store.dto.UserDto;
import com.eshop.store.dto.UserRoleDto;
import com.eshop.store.service.RoleService;
import com.eshop.store.service.UserRoleService;
import com.eshop.store.service.UserService;
import com.eshop.store.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping(value = "admin")
@PreAuthorize("hasAuthority('ROLE_ADMIN') and isAuthenticated()")
public class AdminUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String getAllUser(Model model) {
        model.addAttribute("data", userService.findAll());
        model.addAttribute("");
        return "admin/user/user";
    }

    @RequestMapping(value = "/user/create", method = RequestMethod.GET)
    public String getPageAddUser(Model model) {
        Set<UserRoleDto> userRoles = new HashSet<>();
        model.addAttribute("listRole", roleService.findAll());
        model.addAttribute("action", "Create");
        model.addAttribute("user", new UserDto());
        model.addAttribute("userRoles", userRoles);
        return "admin/user/create";
    }

    @RequestMapping(value = "/user/save", method = RequestMethod.POST)
    public ResponseEntity<DataRes> createUser(@RequestBody UserDto userDto, RedirectAttributes redirect) {
        String pass = passwordEncoder.encode(userDto.getPassword());
        userDto.setPassword(pass);
        DataRes dataRes = userService.saveUser(userDto, Const.UserMethod.SAVE);
        redirect.addFlashAttribute("successMessage", "Create user successfully!");
        return new ResponseEntity<>(dataRes, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/user/update/{id}", method = RequestMethod.GET)
    public String getUserById(@PathVariable("id") Integer id, Model model) {
        UserDto userDto = userService.findById(id);
        model.addAttribute("listRole", roleService.findAll());
        model.addAttribute("userRole",userRoleService.finByUserId(id));
        model.addAttribute("action", "Edit");
        model.addAttribute("user", userDto);

        return "admin/user/create";
    }

    @RequestMapping(value = "user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<UserDto> updateUsers(@RequestBody UserDto userDto) {
        String pass = passwordEncoder.encode(userDto.getPassword());
        userDto.setPassword(pass);
        userService.updateUser(userDto);
        return new ResponseEntity<>(userDto, HttpStatus.CREATED);
    }

    @RequestMapping(value = "user/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Integer id, RedirectAttributes redirect) {
        userService.deleteById(id);
        redirect.addFlashAttribute("successMessage", "Deleted user successfully!");
        return "redirect:/admin/user";
    }

}
