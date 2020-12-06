package com.controller;

import com.Basetest.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class BingChuangTest extends BaseTest{
    @Autowired
    bingchuangController bcc;

    @Autowired
    private HttpServletRequest request;

    @Test
    public void getTest(){
        Map<String,Object> map = new HashMap<>();
        bcc.listpage(map,request);
    }
}
