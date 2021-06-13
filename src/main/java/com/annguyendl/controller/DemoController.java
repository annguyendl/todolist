package com.annguyendl.controller;

import com.annguyendl.service.DemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class DemoController {
    //== fields ==
    private final DemoService demoService;

    //== constructor ==
    @Autowired
    public DemoController(DemoService demoService) {
        this.demoService = demoService;
    }

    //== request methods ==
    // http://localhost:8080/todo-list/hello
    @ResponseBody
    @GetMapping("/hello")
    public String hello() {
        return "Hello world!";
    }

    // http://localhost:8080/todo-list/welcome
    // http://localhost:8080/todo-list/welcome?user=An%20Nguyen
    @GetMapping("welcome")
    public String welcome(@RequestParam(value = "user", required = false) String user, Model model) {
        if (user == null) {
            model.addAttribute("helloMessage", demoService.getHelloMessage("AnNguyenDL"));
        } else {
            model.addAttribute("helloMessage", demoService.getHelloMessage(user));
        }
        log.debug("Model = {}", model);
        // /WEB-INF/view/welcome.jsp
        return "welcome";
    }

    //== modal attributes ==
    @ModelAttribute("welcomeMessage")
    public String welcomeMessage() {
        log.debug("welcomeMessage() loaded.");
        return demoService.getWelcomeMassase();
    }
}
