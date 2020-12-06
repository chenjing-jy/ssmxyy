package com.controller;

import com.service.gonggaoService;
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
 公告Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/gonggao")
public class gonggaoController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */


    @Resource
    private gonggaoService gonggaoservice;

    @RequestMapping(value = "/addpage")
    public String addpage(gonggao bean, HttpServletRequest request) {
        /**
         公告添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "gonggao/gonggaoadd";
    }

    @RequestMapping(value = "/add")
    public String add(gonggao bean, HttpServletRequest request) {
        /**
         公告添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String ggid = (String) request.getParameter("ggid");//公告编号

        String bt = (String) request.getParameter("bt");//标题

        String nr = (String) request.getParameter("nr");//内容

        String fbsj = (String) request.getParameter("fbsj");//发布时间


        gonggaoservice.add(bean);//调用添加方法
        System.out.println("add");
        request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
        return "gonggao/gonggaoadd";
    }


    /**
     * 删除 公告
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        gonggaoservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询gonggao信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String ggid = (String) request.getParameter("ggid");//公告编号
        if (ggid != null && !ggid.equals("")) {
            map1.put("ggid", ggid);//公告编号
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

        list = gonggaoservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "gonggao/gonggaolist";
    }


    /**
     * 查询gonggao信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/list")
    public String list(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String ggid = (String) request.getParameter("ggid");//公告编号
        if (ggid != null && !ggid.equals("")) {
            map1.put("ggid", ggid);//公告编号
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

        list = gonggaoservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "gonggao/list";
    }

    /**
     * 公告详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        gonggao bean = new gonggao();//初始化对象
        bean = gonggaoservice.getgonggaoByID(Integer.parseInt(keyid));//根据id返回 gonggao对象数据


        request.setAttribute("ggid", bean.getGgid());//公告编号

        request.setAttribute("bt", bean.getBt());//标题

        request.setAttribute("nr", bean.getNr());//内容

        request.setAttribute("fbsj", bean.getFbsj());//发布时间


        return "gonggao/gonggaodetail";
    }

    /**
     * 进入gonggao修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        gonggao bean = new gonggao();//初始化对象
        bean = gonggaoservice.getgonggaoByID(Integer.parseInt(keyid));//根据id返回 gonggao对象数据


        request.setAttribute("ggid", bean.getGgid());//公告编号

        request.setAttribute("bt", bean.getBt());//标题

        request.setAttribute("nr", bean.getNr());//内容

        request.setAttribute("fbsj", bean.getFbsj());//发布时间


        return "gonggao/gonggaomodify";
    }

    /**
     * 修改公告信息
     */
    @RequestMapping(value = "/update")
    public String update(gonggao bean, HttpServletRequest request, Map<String, Object> map1) {


        String ggid = (String) request.getParameter("ggid");//公告编号

        String bt = (String) request.getParameter("bt");//标题

        String nr = (String) request.getParameter("nr");//内容

        String fbsj = (String) request.getParameter("fbsj");//发布时间


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        gonggaoservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }


}
