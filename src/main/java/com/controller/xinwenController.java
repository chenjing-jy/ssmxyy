package com.controller;

import com.service.xinwenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.*;
import com.dao.*;

/***
 新闻Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/xinwen")
public class xinwenController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */


    @Resource
    private xinwenService xinwenservice;

    @RequestMapping(value = "/addpage")
    public String addpage(xinwen bean, HttpServletRequest request) {
        /**
         新闻添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "xinwen/xinwenadd";
    }

    @RequestMapping(value = "/add")
    public String add(xinwen bean, HttpServletRequest request) {
        /**
         新闻添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String xwid = (String) request.getParameter("xwid");//新闻编号

        String bt = (String) request.getParameter("bt");//标题

        String nr = (String) request.getParameter("nr");//内容

        String fbsj = (String) request.getParameter("fbsj");//发布时间


        xinwenservice.add(bean);//调用添加方法
        System.out.println("add");
        request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
        return "xinwen/xinwenadd";
    }


    /**
     * 删除 新闻
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        xinwenservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询xinwen信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String xwid = (String) request.getParameter("xwid");//新闻编号
        if (xwid != null && !xwid.equals("")) {
            map1.put("xwid", xwid);//新闻编号
        }
        String bt = (String) request.getParameter("bt");//标题
        if (bt != null && !bt.equals("")) {
            map1.put("bt", bt);//标题
        }
        String nr = (String) request.getParameter("nr");//内容
        if (nr != null && !nr.equals("")) {
            map1.put("nr", nr);//内容
        }
        String fbsj = (String) request.getParameter("fbsj");//发布时间
        if (fbsj != null && !fbsj.equals("")) {
            map1.put("fbsj", fbsj);//发布时间
        }

        list = xinwenservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "xinwen/xinwenlist";
    }

    /**
     * 查询xinwen信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/list")
    public String list(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String xwid = (String) request.getParameter("xwid");//新闻编号
        if (xwid != null && !xwid.equals("")) {
            map1.put("xwid", xwid);//新闻编号
        }
        String bt = (String) request.getParameter("bt");//标题
        if (bt != null && !bt.equals("")) {
            map1.put("bt", bt);//标题
        }
        String nr = (String) request.getParameter("nr");//内容
        if (nr != null && !nr.equals("")) {
            map1.put("nr", nr);//内容
        }
        String fbsj = (String) request.getParameter("fbsj");//发布时间
        if (fbsj != null && !fbsj.equals("")) {
            map1.put("fbsj", fbsj);//发布时间
        }

        list = xinwenservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "xinwen/list";
    }

    /**
     * 新闻详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        xinwen bean = new xinwen();//初始化对象
        bean = xinwenservice.getxinwenByID(Integer.parseInt(keyid));//根据id返回 xinwen对象数据


        request.setAttribute("xwid", bean.getXwid());//新闻编号

        request.setAttribute("bt", bean.getBt());//标题

        request.setAttribute("nr", bean.getNr());//内容

        request.setAttribute("fbsj", bean.getFbsj());//发布时间


        return "xinwen/xinwendetail";
    }

    /**
     * 进入xinwen修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        xinwen bean = new xinwen();//初始化对象
        bean = xinwenservice.getxinwenByID(Integer.parseInt(keyid));//根据id返回 xinwen对象数据


        request.setAttribute("xwid", bean.getXwid());//新闻编号

        request.setAttribute("bt", bean.getBt());//标题

        request.setAttribute("nr", bean.getNr());//内容

        request.setAttribute("fbsj", bean.getFbsj());//发布时间


        return "xinwen/xinwenmodify";
    }

    /**
     * 修改新闻信息
     */
    @RequestMapping(value = "/update")
    public String update(xinwen bean, HttpServletRequest request, Map<String, Object> map1) {


        String xwid = (String) request.getParameter("xwid");//新闻编号

        String bt = (String) request.getParameter("bt");//标题

        String nr = (String) request.getParameter("nr");//内容

        String fbsj = (String) request.getParameter("fbsj");//发布时间


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        xinwenservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }


}
