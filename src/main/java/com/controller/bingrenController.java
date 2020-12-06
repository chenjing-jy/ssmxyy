package com.controller;

import com.service.bingrenService;
import com.service.yzqdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import com.model.*;
import com.dao.*;
import org.springframework.web.bind.annotation.ResponseBody;

/***
 病人Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/bingren")
public class bingrenController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */
    @Resource
    private yzqdService yzqdservice;

    @Resource
    private bingrenService bingrenservice;

    @RequestMapping(value = "/addpage")
    public String addpage(bingren bean, HttpServletRequest request) {
        /**
         病人添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        System.out.println("addPageok");
        return "bingren/bingrenadd";
    }

    @RequestMapping(value = "/add")
    public String add(bingren bean, HttpServletRequest request) {
        /**
         病人添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String brid = (String) request.getParameter("brid");//病人编号

        String xm = (String) request.getParameter("xm");//姓名

        System.out.println("原xm============"+xm);

        List<Map> list = new ArrayList<>();

        list = bingrenservice.noXMRepeat(xm);

        System.out.println("listsize====="+list.size());

        if (list.size() != 0){
            Date date = new Date();
            SimpleDateFormat sdf =  new SimpleDateFormat("yyyyMMdd HH:mm:ss");
            String time = sdf.format(date);

            xm = xm+"("+time+")";
            bean.setXm(xm);
        }

        System.out.println("最后xm==========="+xm);

        String nl = (String) request.getParameter("nl");//年龄

        String xb = (String) request.getParameter("xb");//性别

        String sm = (String) request.getParameter("sm");//说明

        String djsj = (String) request.getParameter("djsj");//登记时间

        String xy = (String) request.getParameter("xy");//学院

        bingrenservice.add(bean);//调用添加方法
        System.out.println("add");
        request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
        return "bingren/bingrenadd";
    }


    /**
     * 删除 病人
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);

//        1.根据id查找出名字
        String name = bingrenservice.selectxmByid(id);
        System.out.println(name);
//        2.根据名字查找是否有未出院的医嘱
        List<Map> list = new ArrayList<>();
        list = yzqdservice.noDelInHos(name);
        System.out.println("删除病人list长度:"+list.size());
        if (list.size()>0){
            request.setAttribute("msg", "<script>alert('删除失败，该病人还未出院！');</script>");
        }else{
            request.setAttribute("msg", "<script>alert('删除成功');</script>");
            bingrenservice.delete(id);//调用 删除方法
        }
        return listpage(map, request);
    }

    /**
     * 查询bingren信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String brid = (String) request.getParameter("brid");//病人编号
        if (brid != null && !brid.equals("")) {
            map1.put("brid", brid);//病人编号
        }
        String xm = (String) request.getParameter("xm");//姓名
        if (xm != null && !xm.equals("")) {
            map1.put("xm", xm);//姓名
        }
        String nl = (String) request.getParameter("nl");//年龄
        if (nl != null && !nl.equals("")) {
            map1.put("nl", nl);//年龄
        }
        String xb = (String) request.getParameter("xb");//性别
        if (xb != null && !xb.equals("")) {
            map1.put("xb", xb);//性别
        }
        String sm = (String) request.getParameter("sm");//说明
        if (sm != null && !sm.equals("")) {
            map1.put("sm", sm);//说明
        }
        String djsj = (String) request.getParameter("djsj");//登记时间
        if (djsj != null && !djsj.equals("")) {
            map1.put("djsj", djsj);//登记时间
        }
        String xy = (String) request.getParameter("xy");//学院
        if (xy != null && !xy.equals("")) {
            map1.put("xy", xy);//登记时间
        }

        list = bingrenservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数


        return "bingren/bingrenlist";
    }

    /**
     * 病人详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        bingren bean = new bingren();//初始化对象
        bean = bingrenservice.getbingrenByID(Integer.parseInt(keyid));//根据id返回 bingren对象数据


        request.setAttribute("brid", bean.getBrid());//病人编号

        request.setAttribute("xm", bean.getXm());//姓名

        request.setAttribute("nl", bean.getNl());//年龄

        request.setAttribute("xb", bean.getXb());//性别

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("djsj", bean.getDjsj());//登记时间

        request.setAttribute("xy", bean.getXy());//学院

        return "bingren/bingrendetail";
    }
    /**
     * 病人详情信息
     */
    @RequestMapping(value = "/detail1")
    public String detail1(Map<String, Object> map, HttpServletRequest request) {

        String xm = (String) request.getParameter("xm");//request 方式获得姓名
        bingren bean = new bingren();//初始化对象
        bean = bingrenservice.getbingrenByXm(xm);//根据姓名返回 bingren对象数据

        request.setAttribute("brid", bean.getBrid());//病人编号

        request.setAttribute("xm", bean.getXm());//姓名

        request.setAttribute("nl", bean.getNl());//年龄

        request.setAttribute("xb", bean.getXb());//性别

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("djsj", bean.getDjsj());//登记时间

        request.setAttribute("xy", bean.getXy());//学院

        return "bingren/bingrendetail";
    }

    /**
     * 进入bingren修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        bingren bean = new bingren();//初始化对象
        bean = bingrenservice.getbingrenByID(Integer.parseInt(keyid));//根据id返回 bingren对象数据


        request.setAttribute("brid", bean.getBrid());//病人编号

        request.setAttribute("xm", bean.getXm());//姓名

        request.setAttribute("nl", bean.getNl());//年龄

        request.setAttribute("xb", bean.getXb());//性别

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("djsj", bean.getDjsj());//登记时间

        request.setAttribute("xy", bean.getXy());//学院


        return "bingren/bingrenmodify";
    }

    /**
     * 修改病人信息
     */
    @RequestMapping(value = "/update")
    public String update(bingren bean, HttpServletRequest request, Map<String, Object> map1) {


        String brid = (String) request.getParameter("brid");//病人编号

        String xm1 = bingrenservice.selectByxm(Integer.parseInt(brid));

        String xm = (String) request.getParameter("xm");//姓名

        String nl = (String) request.getParameter("nl");//年龄

        String xb = (String) request.getParameter("xb");//性别

        String sm = (String) request.getParameter("sm");//说明

        String djsj = (String) request.getParameter("djsj");//登记时间

        String xy = (String) request.getParameter("xy");//学院


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        bingrenservice.update(bean);//执行update 方法

        List<Map> list = new ArrayList<Map>();
        list = yzqdservice.selectyzqd(xm1);
        System.out.println(xm+"的医嘱共有"+list.size()+"个");
        String dh = null;
        if (list.size()>0){

            Iterator it = list.iterator();
            //判断是否有下一个元素
            while (it.hasNext()) {
                Map i = (Map) it.next();
                dh = (String) i.get("dh");
                System.out.println(i.get("dh"));
            }
        }

        yzqd p = new yzqd();
        p.setBr(xm);
        p.setDh(dh);
        yzqdservice.updateyzqdxm(p);

        return listpage(map1, request);
    }

    /**
     * 检测重复账号
     */
    @RequestMapping(value = "/noRepeatXm")
    @ResponseBody
    public void noRepeatXm(HttpServletRequest request, HttpServletResponse response, PrintWriter out){
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<Map> list = new ArrayList<Map>();

        String xm = request.getParameter("xm");

        list = bingrenservice.noXMRepeat(xm);

        System.out.println("list长度：====="+list.size());

        if (list.size()>0){
            out.print(false);
        }else{
            out.print(true);
        }
    }
}
