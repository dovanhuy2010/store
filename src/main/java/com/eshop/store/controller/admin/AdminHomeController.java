package com.eshop.store.controller.admin;

import com.eshop.store.dto.UserDto;
import com.eshop.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@PreAuthorize("isAuthenticated()")
public class AdminHomeController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/admin/home", "/admin"}, method = RequestMethod.GET)
    public String index( Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = "";
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            email = authentication.getName();
        }
        UserDto userDto = userService.findByEmail(email);
        model.addAttribute("userDto", userDto);
        return "admin/index";
    }
}
