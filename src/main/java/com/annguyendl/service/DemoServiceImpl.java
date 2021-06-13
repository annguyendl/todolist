package com.annguyendl.service;

import org.springframework.stereotype.Service;

@Service
public class DemoServiceImpl implements DemoService{
    @Override
    public String getHelloMessage(String user) {
        return "My name is " + user;
    }

    @Override
    public String getWelcomeMassase() {
        return "Welcome to my first SpringMVC Web Application!";
    }
}
