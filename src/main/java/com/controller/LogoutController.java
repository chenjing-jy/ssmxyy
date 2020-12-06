package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LogoutController {
    @RequestMapping(value = "logout")
    public ModelAndView logout(HttpServletRequest request) {
        ModelAndView mov = new ModelAndView();
        mov.addObject("msg", "注销成功");
        mov.setViewName("login");
        request.getSession().invalidate();
        return mov;
    }
}
