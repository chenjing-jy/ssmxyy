package com.controller;

import com.service.wupinService;
import com.util.DBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.*;
import com.dao.*;
import org.springframework.web.bind.annotation.ResponseBody;

/***
 物品Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/wupin")
public class wupinController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */


    @Resource
    private wupinService wupinservice;

    @RequestMapping(value = "/addpage")
    public String addpage(wupin bean, HttpServletRequest request) {
        /**
         物品添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "wupin/wupinadd";
    }

    @RequestMapping(value = "/add")
    public String add(wupin bean, HttpServletRequest request) {
        /**
         物品添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String wpid = (String) request.getParameter("wpid");//物品编号

        String wp = (String) request.getParameter("wp");//物品

        String sm = (String) request.getParameter("sm");//说明

        String sl = (String) request.getParameter("sl");//数量

        String cj = (String) request.getParameter("cj");//厂家

        String gg = (String) request.getParameter("gg");//规格


        DBO db = new DBO();
        ResultSet rs = null;
        String sql = "";
        int num = 0;
        try {
            sql = "select count(1) as num from wupin where wp='" + wp + "'";
            rs = db.query(sql);
            if (rs.next()) {
                num = rs.getInt("num");
            }
            if (num > 0) {
                request.setAttribute("msg", "<script>alert('添加失败,物品名称重复');</script>");//操作提示
            } else {
                wupinservice.add(bean);//调用添加方法
                System.out.println("add");
                request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
            }
        } catch (Exception e) {
            e.printStackTrace();
            ;
        }


        return "wupin/wupinadd";
    }


    @RequestMapping(value = "/ruku")
    public String ruku(wupin bean, HttpServletRequest request) {
        /**
         物品添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String wp = (String) request.getParameter("wp");//物品


        String sl = (String) request.getParameter("sl");//数量


        DBO db = new DBO();
        ResultSet rs = null;
        String sql = "";
        int num = Integer.parseInt(sl);
        try {
            sql = "update wupin set sl=sl+" + num + " where wpid='" + wp + "'";
            System.out.println(sql);
            db.update(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }

        request.setAttribute("msg", "<script>alert('入库成功');</script>");//操作提示

        return "wupin/ruku";
    }

    /**
     * 删除 物品
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        wupinservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询wupin信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String wpid = (String) request.getParameter("wpid");//物品编号
        if (wpid != null && !wpid.equals("")) {
            map1.put("wpid", wpid);//物品编号
        }
        String wp = (String) request.getParameter("wp");//物品
        if (wp != null && !wp.equals("")) {
            map1.put("wp", wp);//物品
        }
        String sm = (String) request.getParameter("sm");//说明
        if (sm != null && !sm.equals("")) {
            map1.put("sm", sm);//说明
        }
        String sl = (String) request.getParameter("sl");//数量
        if (sl != null && !sl.equals("")) {
            map1.put("sl", sl);//数量
        }
        String cj = (String) request.getParameter("cj");//厂家
        if (cj != null && !cj.equals("")) {
            map1.put("cj", cj);//厂家
        }
        String gg = (String) request.getParameter("gg");//规格
        if (gg != null && !gg.equals("")) {
            map1.put("gg", gg);//规格
        }

        list = wupinservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "wupin/wupinlist";
    }

    /**
     * 物品详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        wupin bean = new wupin();//初始化对象
        bean = wupinservice.getwupinByID(Integer.parseInt(keyid));//根据id返回 wupin对象数据


        request.setAttribute("wpid", bean.getWpid());//物品编号

        request.setAttribute("wp", bean.getWp());//物品

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("sl", bean.getSl());//数量

        request.setAttribute("cj", bean.getCj());//厂家

        request.setAttribute("gg", bean.getGg());//规格


        return "wupin/wupindetail";
    }

    /**
     * 进入wupin修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        wupin bean = new wupin();//初始化对象
        bean = wupinservice.getwupinByID(Integer.parseInt(keyid));//根据id返回 wupin对象数据


        request.setAttribute("wpid", bean.getWpid());//物品编号

        request.setAttribute("wp", bean.getWp());//物品

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("sl", bean.getSl());//数量

        request.setAttribute("cj", bean.getCj());//厂家

        request.setAttribute("gg", bean.getGg());//规格


        return "wupin/wupinmodify";
    }

    /**
     * 修改物品信息
     */
    @RequestMapping(value = "/update")
    public String update(wupin bean, HttpServletRequest request, Map<String, Object> map1) {


        String wpid = (String) request.getParameter("wpid");//物品编号

        String wp = (String) request.getParameter("wp");//物品

        String sm = (String) request.getParameter("sm");//说明

        String sl = (String) request.getParameter("sl");//数量

        String cj = (String) request.getParameter("cj");//厂家

        String gg = (String) request.getParameter("gg");//规格


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        wupinservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }
    /**
     * 检测重复物品名称
     */
    @RequestMapping(value = "/noRepeat")
    @ResponseBody
    public void noRepeat(HttpServletRequest request, HttpServletResponse response, PrintWriter out){
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<Map> list = new ArrayList<Map>();
        String wp = request.getParameter("wp");
        System.out.println(wp);
        list = wupinservice.noRepeat(wp);
        System.out.println("list长度"+list.size());
        if (list.size()>0){
            out.print(false);
        }else{
            out.print(true);
        }
    }

}
