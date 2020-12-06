package com.controller;

import com.service.glyService;
import com.service.hushiService;
import com.service.yishengService;
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
 管理员Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/gly")
public class glyController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */
    @Resource
    private hushiService hushiservice;

    @Resource
    private yishengService yishengservice;

    @Resource
    private glyService glyservice;

    @Resource
    private yzqdDao yzqddao;
    @RequestMapping(value = "/addpage")
    public String addpage(gly bean, HttpServletRequest request) {
        /**
         管理员添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        System.out.println("addPageok");
        return "gly/glyadd";
    }

    @RequestMapping(value = "/add")
    public String add(gly bean, HttpServletRequest request) {
        /**
         管理员添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String glyid = (String) request.getParameter("glyid");//管理员编号

        String yhm = (String) request.getParameter("yhm");//用户名

        String mm = (String) request.getParameter("mm");//密码

        String xm = (String) request.getParameter("xm");//姓名


        DBO db = new DBO();
        ResultSet rs = null;
        String sql = "";
        int num = 0;
        try {
            sql = "select count(1) as num from gly where yhm='" + yhm + "'";
            rs = db.query(sql);
            if (rs.next()) {
                num = rs.getInt("num");
            }
            if (num > 0) {
                request.setAttribute("msg", "<script>alert('添加失败、用户名重复');</script>");//操作提示
            } else {
                glyservice.add(bean);//调用添加方法
                System.out.println("add");
                request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }


        return "gly/glyadd";
    }


    /**
     * 删除 管理员
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        glyservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询gly信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String glyid = (String) request.getParameter("glyid");//管理员编号
        if (glyid != null && !glyid.equals("")) {
            map1.put("glyid", glyid);//管理员编号
        }
        String yhm = (String) request.getParameter("yhm");//用户名
        if (yhm != null && !yhm.equals("")) {
            map1.put("yhm", yhm);//用户名
        }
        String mm = (String) request.getParameter("mm");//密码
        if (mm != null && !mm.equals("")) {
            map1.put("mm", mm);//密码
        }
        String xm = (String) request.getParameter("xm");//姓名
        if (xm != null && !xm.equals("")) {
            map1.put("xm", xm);//姓名
        }

        list = glyservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "gly/glylist";
    }

    /**
     * 管理员详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        gly bean = new gly();//初始化对象
        bean = glyservice.getglyByID(Integer.parseInt(keyid));//根据id返回 gly对象数据


        request.setAttribute("glyid", bean.getGlyid());//管理员编号

        request.setAttribute("yhm", bean.getYhm());//用户名

        request.setAttribute("mm", bean.getMm());//密码

        request.setAttribute("xm", bean.getXm());//姓名


        return "gly/glydetail";
    }

    /**
     * 进入gly修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        gly bean = new gly();//初始化对象
        bean = glyservice.getglyByID(Integer.parseInt(keyid));//根据id返回 gly对象数据


        request.setAttribute("glyid", bean.getGlyid());//管理员编号

        request.setAttribute("yhm", bean.getYhm());//用户名

        request.setAttribute("mm", bean.getMm());//密码

        request.setAttribute("xm", bean.getXm());//姓名


        return "gly/glymodify";
    }

    /**
     * 进入gly修改页面
     **/
    @RequestMapping(value = "/modpage")
    public String modpage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getSession().getAttribute("id");//request 方式获得主键id
        gly bean = new gly();//初始化对象
        bean = glyservice.getglyByID(Integer.parseInt(keyid));//根据id返回 gly对象数据


        request.setAttribute("glyid", bean.getGlyid());//管理员编号

        request.setAttribute("yhm", bean.getYhm());//用户名

        request.setAttribute("mm", bean.getMm());//密码

        request.setAttribute("xm", bean.getXm());//姓名


        return "gly/modify";
    }

    /**
     * 修改管理员信息
     */
    @RequestMapping(value = "/upd")
    public String upd(gly bean, HttpServletRequest request, Map<String, Object> map1) {


        String glyid = (String) request.getParameter("glyid");//管理员编号

        String yhm = (String) request.getParameter("yhm");//用户名

        String mm = (String) request.getParameter("mm");//密码

        String xm = (String) request.getParameter("xm");//姓名

        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        glyservice.update(bean);//执行update 方法
        return modpage(map1, request);
    }

    /**
     * 修改管理员信息
     */
    @RequestMapping(value = "/update")
    public String update(gly bean, HttpServletRequest request, Map<String, Object> map1) {


        String glyid = (String) request.getParameter("glyid");//管理员编号

        String yhm = (String) request.getParameter("yhm");//用户名

        String mm = (String) request.getParameter("mm");//密码

        String xm = (String) request.getParameter("xm");//姓名


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        glyservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }

    /**
     * 检测重复账号
     */
    @RequestMapping(value = "/noRepeat")
    @ResponseBody
    public void noRepeat(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<Map> list = new ArrayList<Map>();
        List<Map> list1 = new ArrayList<Map>();
        List<Map> list2 = new ArrayList<Map>();


        String yhm = request.getParameter("yhm");
        System.out.println(yhm);
        list = hushiservice.noRepeat(yhm);
        list1 = glyservice.noRepeat(yhm);
        list2 = yishengservice.noRepeat(yhm);
        System.out.println("list长度" + list.size());
        if (list.size() > 0 || list1.size() > 0 || list2.size() > 0) {
            out.print(false);
        } else {
            out.print(true);
        }
    }

}
