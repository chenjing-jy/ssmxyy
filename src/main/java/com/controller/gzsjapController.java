package com.controller;

import com.service.gzsjapService;
import com.util.DBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.*;
import com.dao.*;

/***
 工作时间安排Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/gzsjap")
public class gzsjapController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */


    @Resource
    private gzsjapService gzsjapservice;

    @RequestMapping(value = "/addpage")
    public String addpage(gzsjap bean, HttpServletRequest request) {
        /**
         工作时间安排添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "gzsjap/gzsjapadd";
    }

    @RequestMapping(value = "/add")
    public String add(gzsjap bean, HttpServletRequest request) {
        /**
         工作时间安排添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String gzsjapid = (String) request.getParameter("gzsjapid");//工作时间安排编号

        String rq = (String) request.getParameter("rq");//日期

        String yh = (String) request.getParameter("yh");//用户

        String lx = (String) request.getParameter("lx");//类型
        DBO db = new DBO();
        String sql = "";
        ResultSet rs = null;

        int num = 0;
        try {
            sql = "select count(1) as num from gzsjap where rq='" + rq + "' and yh='" + yh + "' and lx='" + lx + "'";
            rs = db.query(sql);
            if (rs.next()) {
                num = rs.getInt("num");
            }
            if (num > 0) {
                request.setAttribute("msg", "<script>alert('添加失败、数据重复');</script>");//操作提示
            } else {

                gzsjapservice.add(bean);//调用添加方法
                System.out.println("add");
                request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
            }

        } catch (Exception e) {
            e.printStackTrace();
            ;
        }


        return "gzsjap/add";
    }


    /**
     * 删除 工作时间安排
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        gzsjapservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询gzsjap信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String gzsjapid = (String) request.getParameter("gzsjapid");//工作时间安排编号
        if (gzsjapid != null && !gzsjapid.equals("")) {
            map1.put("gzsjapid", gzsjapid);//工作时间安排编号
        }
        String rq = (String) request.getParameter("rq");//日期
        if (rq != null && !rq.equals("")) {
            map1.put("rq", rq);//日期
        }
        String yh = (String) request.getParameter("yh");//用户
        if (yh != null && !yh.equals("")) {
            map1.put("yh", yh);//用户
        }
        String lx = (String) request.getParameter("lx");//类型
        if (lx != null && !lx.equals("")) {
            map1.put("lx", lx);//类型
        }

        list = gzsjapservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "gzsjap/gzsjaplist";
    }


    /**
     * 查询gzsjap信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/list")
    public String list(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String gzsjapid = (String) request.getParameter("gzsjapid");//工作时间安排编号
        if (gzsjapid != null && !gzsjapid.equals("")) {
            map1.put("gzsjapid", gzsjapid);//工作时间安排编号
        }
        String rq = (String) request.getParameter("rq");//日期
        if (rq != null && !rq.equals("")) {
            map1.put("rq", rq);//日期
        }
        String yh = (String) request.getParameter("yh");//用户
        if (request.getSession().getAttribute("yhm") != null) {
            map1.put("yh", request.getSession().getAttribute("yhm"));//用户
        }
        String lx = (String) request.getParameter("lx");//类型
        if (lx != null && !lx.equals("")) {
            map1.put("lx", lx);//类型
        }

        list = gzsjapservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "gzsjap/list";
    }

    /**
     * 工作时间安排详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        gzsjap bean = new gzsjap();//初始化对象
        bean = gzsjapservice.getgzsjapByID(Integer.parseInt(keyid));//根据id返回 gzsjap对象数据


        request.setAttribute("gzsjapid", bean.getGzsjapid());//工作时间安排编号

        request.setAttribute("rq", bean.getRq());//日期

        request.setAttribute("yh", bean.getYh());//用户

        request.setAttribute("lx", bean.getLx());//类型


        return "gzsjap/gzsjapdetail";
    }

    /**
     * 进入gzsjap修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        gzsjap bean = new gzsjap();//初始化对象
        bean = gzsjapservice.getgzsjapByID(Integer.parseInt(keyid));//根据id返回 gzsjap对象数据


        request.setAttribute("gzsjapid", bean.getGzsjapid());//工作时间安排编号

        request.setAttribute("rq", bean.getRq());//日期

        request.setAttribute("yh", bean.getYh());//用户

        request.setAttribute("lx", bean.getLx());//类型


        return "gzsjap/gzsjapmodify";
    }

    /**
     * 修改工作时间安排信息
     */
    @RequestMapping(value = "/update")
    public String update(gzsjap bean, HttpServletRequest request, Map<String, Object> map1) {


        String gzsjapid = (String) request.getParameter("gzsjapid");//工作时间安排编号

        String rq = (String) request.getParameter("rq");//日期

        String yh = (String) request.getParameter("yh");//用户

        String lx = (String) request.getParameter("lx");//类型


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        gzsjapservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }


}
