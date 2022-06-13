package com.eshop.store.controller.admin;

import com.eshop.store.dto.UserDto;
import com.eshop.store.service.RedisService;
import com.eshop.store.service.UserService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
public class RedisController {

    private final RedisService redisService;

    private final UserService userService;

    private final Logger logger = LogManager.getLogger(RedisController.class);

    @RequestMapping(value = "/admin/redis/setUesr", method = RequestMethod.POST)
    public ResponseEntity<Boolean> setInforUaer(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sessionId = session.getId();//id
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String email = authentication.getName();
            UserDto userDto =(UserDto) userService.findByEmail(email).getData();
            redisService.set(sessionId,userDto);
            logger.info("Save user redis sessionId: {} ", sessionId);
            return new ResponseEntity<>(true, HttpStatus.OK);
        } else {
            logger.info("Error save user redis sessionId: {} ", sessionId);
            return new ResponseEntity<>(false, HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/admin/redis/getUser", method = RequestMethod.GET)
    public ResponseEntity<UserDto> getUserByKey(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sessionId = session.getId();//id
        logger.info("Get User by id : {} ", sessionId);
        return new ResponseEntity<>(redisService.get(sessionId), HttpStatus.OK);
    }

    @RequestMapping(value = "/admin/redis-check-key", method = RequestMethod.GET)
    public ResponseEntity<Boolean> checkKeyRedis(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sessionId = session.getId();//id
        logger.info("Check key exist: {} ", redisService.checkRedis(sessionId));
        return new ResponseEntity<>(redisService.checkRedis(sessionId), HttpStatus.OK);
    }
}
