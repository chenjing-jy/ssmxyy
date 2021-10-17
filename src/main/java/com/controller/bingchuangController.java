package com.controller;

import com.service.bingchuangService;
import com.service.yzqdService;
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
 病床Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/bingchuang")
public class bingchuangController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */


    @Resource
    private bingchuangService bingchuangservice;

    @Resource
    private yzqdService yzqdservice;

    @RequestMapping(value = "/addpage")
    public String addpage(bingchuang bean, HttpServletRequest request) {
        /**
         病床添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "bingchuang/bingchuangadd";
    }

    @RequestMapping(value = "/add")
    public String add(bingchuang bean, HttpServletRequest request) {
        /**
         病床添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量

        String bcid = (String) request.getParameter("bcid");//病床编号

        String bc = (String) request.getParameter("bc");//病床

        String zt = (String) request.getParameter("zt");//状态

        String sm = (String) request.getParameter("sm");//说明
        DBO db = new DBO();
        String sql = "";
        ResultSet rs = null;
        int num = 0;
        try {
            sql = "select count(1) as num from bingchuang where bc='" + bc + "'";

            rs = db.query(sql);
            if (rs.next()) {
                num = rs.getInt("num");
            }
            if (num > 0) {
                request.setAttribute("msg", "<script>alert('添加失败、病床号重复了');</script>");//操作提示
            } else {
                bingchuangservice.add(bean);//调用添加方法
                System.out.println("add");
                request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
            }
        } catch (Exception e) {
            e.printStackTrace();
            ;
        } finally {
            db.close();
        }

        return "bingchuang/bingchuangadd";
    }


    /**
     * 删除 病床
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        bingchuangservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询bingchuang信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String bcid = (String) request.getParameter("bcid");//病床编号
        if (bcid != null && !bcid.equals("")) {
            map1.put("bcid", bcid);//病床编号
        }
        String bc = (String) request.getParameter("bc");//病床
        if (bc != null && !bc.equals("")) {
            map1.put("bc", bc);//病床
        }
        // 1
        String zt = (String) request.getParameter("zt");//状态
        if (zt != null && !zt.equals("")) {
            map1.put("zt", zt);//状态
        }
        String sm = (String) request.getParameter("sm");//说明
        if (sm != null && !sm.equals("")) {
            map1.put("sm", sm);//说明
        }

        list = bingchuangservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());
        map.put("list", list);//传递参数
        return "bingchuang/bingchuanglist";
    }

    /**
     * 病床详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        bingchuang bean = new bingchuang();//初始化对象
        bean = bingchuangservice.getbingchuangByID(Integer.parseInt(keyid));//根据id返回 bingchuang对象数据


        request.setAttribute("bcid", bean.getBcid());//病床编号

        request.setAttribute("bc", bean.getBc());//病床

        request.setAttribute("zt", bean.getZt());//状态

        request.setAttribute("sm", bean.getSm());//说明

//        查询病人
        String br = yzqdservice.selectBybc(Integer.parseInt(bean.getBc()));

        request.setAttribute("br",br);

        return "bingchuang/bingchuangdetail";
    }

    /**
     * 进入bingchuang修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        bingchuang bean = new bingchuang();//初始化对象
        bean = bingchuangservice.getbingchuangByID(Integer.parseInt(keyid));//根据id返回 bingchuang对象数据


        request.setAttribute("bcid", bean.getBcid());//病床编号

        request.setAttribute("bc", bean.getBc());//病床

        request.setAttribute("zt", bean.getZt());//状态

        request.setAttribute("sm", bean.getSm());//说明


        return "bingchuang/bingchuangmodify";
    }

    /**
     * 修改病床信息
     */
    @RequestMapping(value = "/update")
    public String update(bingchuang bean, HttpServletRequest request, Map<String, Object> map1) {


        String bcid = (String) request.getParameter("bcid");//病床编号

        String bc = (String) request.getParameter("bc");//病床

        String zt = (String) request.getParameter("zt");//状态

        String sm = (String) request.getParameter("sm");//说明


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        bingchuangservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }

    /**
     * 检测重复病床号
     */
    @RequestMapping(value = "/noRepeat")
    @ResponseBody
    public void noRepeat(HttpServletRequest request, HttpServletResponse response,PrintWriter out){
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<Map> list = new ArrayList<Map>();
        String bc = request.getParameter("bc");
        System.out.println(bc);
        list = bingchuangservice.noRepeat(bc);
        System.out.println("list长度"+list.size());
        if (list.size()>0){
            out.print(false);
        }else{
            out.print(true);
        }
    }
}
