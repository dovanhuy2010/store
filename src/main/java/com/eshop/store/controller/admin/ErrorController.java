package com.eshop.store.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String error403(){
        return "/error/403";
    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String error404(){
        return "/error/404";
    }
}
