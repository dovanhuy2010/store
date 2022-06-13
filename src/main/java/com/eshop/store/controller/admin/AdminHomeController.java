package com.eshop.store.controller.admin;

import com.eshop.store.dto.UserDto;
import com.eshop.store.service.RedisService;
import com.eshop.store.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@PreAuthorize("isAuthenticated()")
public class AdminHomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private RedisService redisService;

    @RequestMapping(value = {"/admin/home", "/admin"}, method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String sessionId = session.getId();//id
        ObjectMapper mapper = new ObjectMapper();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = "";
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            email = authentication.getName();
        }
        UserDto userDto = (UserDto) userService.findByEmail(email).getData();

        model.addAttribute("userDto", userDto);
        model.addAttribute("testSession",sessionId);
//        try {
//            redisService.set(sessionId,mapper.writeValueAsString(userDto));
//        }catch (Exception e){
//            e.printStackTrace();
//        }
        return "admin/index";
    }


}
