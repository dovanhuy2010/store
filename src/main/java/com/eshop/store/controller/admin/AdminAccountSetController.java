package com.eshop.store.controller.admin;


import com.eshop.store.dto.UserDto;
import com.eshop.store.utils.*;
import com.eshop.store.service.RedisService;
import com.eshop.store.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("admin/account")
@RequiredArgsConstructor
public class AdminAccountSetController {

    private final UserService userService;

    private final PasswordEncoder passwordEncoder;

    private final RedisService redisService;

    @RequestMapping(value = "/redirect-account-page", method = RequestMethod.GET)
    public String setAccount(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sessionId = Const.ACCOUNT_INFO_PREFIX +  session.getId();
        if (!redisService.checkRedis(sessionId) ) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (!(authentication instanceof AnonymousAuthenticationToken)) {
                String email = authentication.getName();
                UserDto user = (UserDto) userService.findByEmail(email).getData();
                redisService.set(sessionId, user);
            }
        }
        UserDto userDto = redisService.get(sessionId);
        model.addAttribute("accountSet", userDto);
        return "/admin/user/account";
    }

    @RequestMapping(value = "/admin/Account-update", method = RequestMethod.PUT)
    public ResponseEntity<UserDto> updateAccount(@RequestBody UserDto userDto, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        UserDto user = redisService.get(sessionId);
        userDto.setId(user.getId());
        if (userDto.getPassword() == "") {
            userDto.setPassword(user.getPassword());
        } else {
            String password = passwordEncoder.encode(userDto.getPassword());
            userDto.setPassword(password);
        }
        userService.updateUser(userDto);
        redisService.set(sessionId, userDto);
        return new ResponseEntity<>(userDto, HttpStatus.OK);
    }

    @RequestMapping(value = "/admin/Account-check-Password", method = RequestMethod.POST)
    public ResponseEntity<Boolean> checkPassword(@RequestBody String password, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        redisService.get(sessionId).getPassword();
        return new ResponseEntity<>(passwordEncoder.matches(password, redisService.get(sessionId).getPassword()), HttpStatus.OK);
    }

}
