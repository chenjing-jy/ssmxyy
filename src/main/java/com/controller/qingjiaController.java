package com.controller;

import com.service.qingjiaService;
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
 请假Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/qingjia")
public class qingjiaController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */


    @Resource
    private qingjiaService qingjiaservice;
    @RequestMapping(value = "/addpage")
    public String addpage(qingjia bean, HttpServletRequest request) {
        /**
         请假添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "qingjia/qingjiaadd";
    }

    @RequestMapping(value = "/add")
    public String add(qingjia bean, HttpServletRequest request) {
        /**
         请假添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String qjid = (String) request.getParameter("qjid");//请假编号

        String bt = (String) request.getParameter("bt");//标题

        String nr = (String) request.getParameter("nr");//内容

        String qjsj = (String) request.getParameter("qjsj");//请假时间

        String kssj = (String) request.getParameter("kssj");//开始时间

        String jssj = (String) request.getParameter("jssj");//结束时间

        String zt = (String) request.getParameter("zt");//状态

        String yh = (String) request.getParameter("yh");//用户


        qingjiaservice.add(bean);//调用添加方法
        System.out.println("add");
        request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
        return "qingjia/qingjiaadd";
    }


    /**
     * 删除 请假
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        qingjiaservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询qingjia信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String qjid = (String) request.getParameter("qjid");//请假编号
        if (qjid != null && !qjid.equals("")) {
            map1.put("qjid", qjid);//请假编号
        }
        String bt = (String) request.getParameter("bt");//标题
        if (bt != null && !bt.equals("")) {
            map1.put("bt", bt);//标题
        }
        String nr = (String) request.getParameter("nr");//内容
        if (nr != null && !nr.equals("")) {
            map1.put("nr", nr);//内容
        }
        String qjsj = (String) request.getParameter("qjsj");//请假时间
        if (qjsj != null && !qjsj.equals("")) {
            map1.put("qjsj", qjsj);//请假时间
        }
        String kssj = (String) request.getParameter("kssj");//开始时间
        if (kssj != null && !kssj.equals("")) {
            map1.put("kssj", kssj);//开始时间
        }
        String jssj = (String) request.getParameter("jssj");//结束时间
        if (jssj != null && !jssj.equals("")) {
            map1.put("jssj", jssj);//结束时间
        }
        String zt = (String) request.getParameter("zt");//状态
        if (zt != null && !zt.equals("")) {
            map1.put("zt", zt);//状态
        }
        String yh = (String) request.getParameter("yh");//用户
        if (yh != null && !yh.equals("")) {
            map1.put("yh", yh);//用户
        }

        list = qingjiaservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "qingjia/qingjialist";
    }

    /**
     * 查询qingjia信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/list")
    public String list(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String qjid = (String) request.getParameter("qjid");//请假编号
        if (qjid != null && !qjid.equals("")) {
            map1.put("qjid", qjid);//请假编号
        }
        String bt = (String) request.getParameter("bt");//标题
        if (bt != null && !bt.equals("")) {
            map1.put("bt", bt);//标题
        }
        String nr = (String) request.getParameter("nr");//内容
        if (nr != null && !nr.equals("")) {
            map1.put("nr", nr);//内容
        }
        String qjsj = (String) request.getParameter("qjsj");//请假时间
        if (qjsj != null && !qjsj.equals("")) {
            map1.put("qjsj", qjsj);//请假时间
        }
        String kssj = (String) request.getParameter("kssj");//开始时间
        if (kssj != null && !kssj.equals("")) {
            map1.put("kssj", kssj);//开始时间
        }
        String jssj = (String) request.getParameter("jssj");//结束时间
        if (jssj != null && !jssj.equals("")) {
            map1.put("jssj", jssj);//结束时间
        }
        String zt = (String) request.getParameter("zt");//状态
        if (zt != null && !zt.equals("")) {
            map1.put("zt", zt);//状态
        }
        String yh = (String) request.getParameter("yh");//用户
        if (request.getSession().getAttribute("yhm") != null) {
            map1.put("yh", request.getSession().getAttribute("yhm"));//用户
        }

        list = qingjiaservice.getAll(map1);//传入 方法参数 返回结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "qingjia/list";
    }

    /**
     * 请假详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        qingjia bean = new qingjia();//初始化对象
        bean = qingjiaservice.getqingjiaByID(Integer.parseInt(keyid));//根据id返回 qingjia对象数据


        request.setAttribute("qjid", bean.getQjid());//请假编号

        request.setAttribute("bt", bean.getBt());//标题

        request.setAttribute("nr", bean.getNr());//内容

        request.setAttribute("qjsj", bean.getQjsj());//请假时间

        request.setAttribute("kssj", bean.getKssj());//开始时间

        request.setAttribute("jssj", bean.getJssj());//结束时间

        request.setAttribute("zt", bean.getZt());//状态

        request.setAttribute("yh", bean.getYh());//用户


        return "qingjia/qingjiadetail";
    }

    /**
     * 进入qingjia修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        qingjia bean = new qingjia();//初始化对象
        bean = qingjiaservice.getqingjiaByID(Integer.parseInt(keyid));//根据id返回 qingjia对象数据


        request.setAttribute("qjid", bean.getQjid());//请假编号

        request.setAttribute("bt", bean.getBt());//标题

        request.setAttribute("nr", bean.getNr());//内容

        request.setAttribute("qjsj", bean.getQjsj());//请假时间

        request.setAttribute("kssj", bean.getKssj());//开始时间

        request.setAttribute("jssj", bean.getJssj());//结束时间

        request.setAttribute("zt", bean.getZt());//状态

        request.setAttribute("yh", bean.getYh());//用户


        return "qingjia/qingjiamodify";
    }

    /**
     * 修改请假信息
     */
    @RequestMapping(value = "/update")
    public String update(qingjia bean, HttpServletRequest request, Map<String, Object> map1) {


        String qjid = (String) request.getParameter("qjid");//请假编号

        String bt = (String) request.getParameter("bt");//标题

        String nr = (String) request.getParameter("nr");//内容

        String qjsj = (String) request.getParameter("qjsj");//请假时间

        String kssj = (String) request.getParameter("kssj");//开始时间

        String jssj = (String) request.getParameter("jssj");//结束时间

        String zt = (String) request.getParameter("zt");//状态

        String yh = (String) request.getParameter("yh");//用户


        request.setAttribute("msg", "<script>alert('操作成功');</script>");
        qingjiaservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }

}
