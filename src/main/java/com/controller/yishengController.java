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
 医生Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/yisheng")
public class yishengController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */
    @Resource
    private glyService glyservice;

    @Resource
    private hushiService hushiservice;

    @Resource
    private yishengService yishengservice;

    @RequestMapping(value = "/addpage")
    public String addpage(yisheng bean, HttpServletRequest request) {
        /**
         医生添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "yisheng/yishengadd";
    }

    @RequestMapping(value = "/add")
    public String add(yisheng bean, HttpServletRequest request) {
        /**
         医生添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String ysid = (String) request.getParameter("ysid");//医生编号

        String yhm = (String) request.getParameter("yhm");//用户名

        String mm = (String) request.getParameter("mm");//密码

        String xm = (String) request.getParameter("xm");//姓名

        String lxdh = (String) request.getParameter("lxdh");//联系电话

        String lxdz = (String) request.getParameter("lxdz");//联系地址

        String ks = (String) request.getParameter("ks");//科室


        DBO db = new DBO();
        ResultSet rs = null;
        String sql = "";
        int num = 0;
        try {
            sql = "select count(1) as num from yisheng where yhm='" + yhm + "'";
            rs = db.query(sql);
            if (rs.next()) {
                num = rs.getInt("num");
            }
            if (num > 0) {
                request.setAttribute("msg", "<script>alert('添加失败、用户名重复');</script>");//操作提示
            } else {
                yishengservice.add(bean);//调用添加方法
                System.out.println("add");
                request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }


        //  request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
        return "yisheng/yishengadd";
    }


    /**
     * 删除 医生
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        yishengservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询yisheng信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String ysid = (String) request.getParameter("ysid");//医生编号
        if (ysid != null && !ysid.equals("")) {
            map1.put("ysid", ysid);//医生编号
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
        String lxdh = (String) request.getParameter("lxdh");//联系电话
        if (lxdh != null && !lxdh.equals("")) {
            map1.put("lxdh", lxdh);//联系电话
        }
        String lxdz = (String) request.getParameter("lxdz");//联系地址
        if (lxdz != null && !lxdz.equals("")) {
            map1.put("lxdz", lxdz);//联系地址
        }
        String ks = (String) request.getParameter("ks");//科室
        if (ks != null && !ks.equals("")) {
            map1.put("ks", ks);//科室
        }

        list = yishengservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "yisheng/yishenglist";
    }

    /**
     * 医生详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        yisheng bean = new yisheng();//初始化对象
        bean = yishengservice.getyishengByID(Integer.parseInt(keyid));//根据id返回 yisheng对象数据


        request.setAttribute("ysid", bean.getYsid());//医生编号

        request.setAttribute("yhm", bean.getYhm());//用户名

        request.setAttribute("mm", bean.getMm());//密码

        request.setAttribute("xm", bean.getXm());//姓名

        request.setAttribute("lxdh", bean.getLxdh());//联系电话

        request.setAttribute("lxdz", bean.getLxdz());//联系地址

        request.setAttribute("ks", bean.getKs());//科室


        return "yisheng/yishengdetail";
    }

    /**
     * 进入yisheng修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        yisheng bean = new yisheng();//初始化对象
        bean = yishengservice.getyishengByID(Integer.parseInt(keyid));//根据id返回 yisheng对象数据


        request.setAttribute("ysid", bean.getYsid());//医生编号

        request.setAttribute("yhm", bean.getYhm());//用户名

        request.setAttribute("mm", bean.getMm());//密码

        request.setAttribute("xm", bean.getXm());//姓名

        request.setAttribute("lxdh", bean.getLxdh());//联系电话

        request.setAttribute("lxdz", bean.getLxdz());//联系地址

        request.setAttribute("ks", bean.getKs());//科室


        return "yisheng/yishengmodify";
    }

    /**
     * 进入yisheng修改页面
     **/
    @RequestMapping(value = "/modpage")
    public String modpage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getSession().getAttribute("id");//request 方式获得主键id
        yisheng bean = new yisheng();//初始化对象
        bean = yishengservice.getyishengByID(Integer.parseInt(keyid));//根据id返回 yisheng对象数据


        request.setAttribute("ysid", bean.getYsid());//医生编号

        request.setAttribute("yhm", bean.getYhm());//用户名

        request.setAttribute("mm", bean.getMm());//密码

        request.setAttribute("xm", bean.getXm());//姓名

        request.setAttribute("lxdh", bean.getLxdh());//联系电话

        request.setAttribute("lxdz", bean.getLxdz());//联系地址

        request.setAttribute("ks", bean.getKs());//科室


        return "yisheng/modify";
    }

    /**
     * 修改医生信息
     */
    @RequestMapping(value = "/upd")
    public String upd(yisheng bean, HttpServletRequest request, Map<String, Object> map1) {


        String ysid = (String) request.getParameter("ysid");//医生编号

        String yhm = (String) request.getParameter("yhm");//用户名

        String mm = (String) request.getParameter("mm");//密码

        String xm = (String) request.getParameter("xm");//姓名

        String lxdh = (String) request.getParameter("lxdh");//联系电话

        String lxdz = (String) request.getParameter("lxdz");//联系地址

        String ks = (String) request.getParameter("ks");//科室


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        yishengservice.update(bean);//执行update 方法
        return modpage(map1, request);
    }

    /**
     * 修改医生信息
     */
    @RequestMapping(value = "/update")
    public String update(yisheng bean, HttpServletRequest request, Map<String, Object> map1) {


        String ysid = (String) request.getParameter("ysid");//医生编号

        String yhm = (String) request.getParameter("yhm");//用户名

        String mm = (String) request.getParameter("mm");//密码

        String xm = (String) request.getParameter("xm");//姓名

        String lxdh = (String) request.getParameter("lxdh");//联系电话

        String lxdz = (String) request.getParameter("lxdz");//联系地址

        String ks = (String) request.getParameter("ks");//科室


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        yishengservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }

    /**
     * 检测重复账号
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
        List<Map> list1 = new ArrayList<Map>();
        List<Map> list2 = new ArrayList<Map>();


        String yhm = request.getParameter("yhm");
        System.out.println(yhm);
        list = yishengservice.noRepeat(yhm);
        list1 = hushiservice.noRepeat(yhm);
        list2 = glyservice.noRepeat(yhm);
        if (list.size()>0 || list1.size()>0 || list2.size()>0){
            out.print(false);
        }else{
            out.print(true);
        }
    }
}
