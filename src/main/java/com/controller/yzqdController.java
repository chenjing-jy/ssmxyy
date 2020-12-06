package com.controller;

import com.service.qdmxService;
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
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.*;
import com.dao.*;
import org.springframework.web.bind.annotation.ResponseBody;

/***
 医嘱清单Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/yzqd")
public class yzqdController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */

    @Resource
    private qdmxService qdmxservice;

    @Resource
    private yzqdService yzqdservice;

    @RequestMapping(value = "/addpage")
    public String addpage(yzqd bean, HttpServletRequest request) {
        /**
         医嘱清单添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        return "yzqd/yzqdadd";
    }

    @RequestMapping(value = "/add")
    public String add(yzqd bean, HttpServletRequest request) {
        /**
         医嘱清单添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String yzqdid = (String) request.getParameter("yzqdid");//医嘱清单编号

        String dh = (String) request.getParameter("dh");//单号

        String br = (String) request.getParameter("br");//病人

        String sm = (String) request.getParameter("sm");//说明

        String djr = (String) request.getParameter("djr");//登记人

        String ys = (String) request.getParameter("ys");//医生

        String bc = (String) request.getParameter("bc");//病床

        String rysj = (String) request.getParameter("rysj");//入院时间

        String zt = (String) request.getParameter("zt");//状态

        String sql = "";
        ResultSet rs = null;
        DBO db = new DBO();


        try {
            sql = "update bingchuang set zt='在用' where bc='" + bc + "'";
            db.update(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }

        yzqdservice.add(bean);//调用添加方法
        System.out.println("add");
        request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
        return "yzqd/yzqdadd";
    }


    /**
     * 删除 医嘱清单
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        String dh = yzqdservice.findDeldh(id);
        System.out.println(dh);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        yzqdservice.delete(id);//调用 删除方法
        if (dh != null){
            qdmxservice.deletedh(dh);
        }
        return listpage(map, request);
    }

    /**
     * 查询yzqd信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String yzqdid = (String) request.getParameter("yzqdid");//医嘱清单编号
        if (yzqdid != null && !yzqdid.equals("")) {
            map1.put("yzqdid", yzqdid);//医嘱清单编号
        }
        String dh = (String) request.getParameter("dh");//单号
        if (dh != null && !dh.equals("")) {
            map1.put("dh", dh);//单号
        }
        String br = (String) request.getParameter("br");//病人
        if (br != null && !br.equals("")) {
            map1.put("br", br);//病人
        }
        String sm = (String) request.getParameter("sm");//说明
        if (sm != null && !sm.equals("")) {
            map1.put("sm", sm);//说明
        }
        String djr = (String) request.getParameter("djr");//登记人
        if (djr != null && !djr.equals("")) {
            map1.put("djr", djr);//登记人
        }
        String ys = (String) request.getParameter("ys");//医生
        if (ys != null && !ys.equals("")) {
            map1.put("ys", ys);//医生
        }
        String bc = (String) request.getParameter("bc");//病床
        if (bc != null && !bc.equals("")) {
            map1.put("bc", bc);//病床
        }
        String rysj = (String) request.getParameter("rysj");//入院时间
        if (rysj != null && !rysj.equals("")) {
            map1.put("rysj", rysj);//入院时间
        }
        String zt = (String) request.getParameter("zt");//状态
        if (zt != null && !zt.equals("")) {
            map1.put("zt", zt);//状态
        }

        list = yzqdservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "yzqd/yzqdlist";
    }

    /**
     * 医嘱清单详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        yzqd bean = new yzqd();//初始化对象
        bean = yzqdservice.getyzqdByID(Integer.parseInt(keyid));//根据id返回 yzqd对象数据


        request.setAttribute("yzqdid", bean.getYzqdid());//医嘱清单编号

        request.setAttribute("dh", bean.getDh());//单号

        request.setAttribute("br", bean.getBr());//病人

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("djr", bean.getDjr());//登记人

        request.setAttribute("ys", bean.getYs());//医生

        request.setAttribute("bc", bean.getBc());//病床

        request.setAttribute("rysj", bean.getRysj());//入院时间

        request.setAttribute("zt", bean.getZt());//状态


        return "yzqd/yzqddetail";
    }
    /**
     * 医嘱清单详情信息
     */
    @RequestMapping(value = "/detail1")
    public String detail1(Map<String, Object> map, HttpServletRequest request) {

        String xm = (String) request.getParameter("xm");//request 方式获得姓名
        yzqd bean = new yzqd();//初始化对象
        System.out.println("xm============"+xm);
        bean = yzqdservice.getyzqdByXm(xm);//根据id返回 yzqd对象数据

        request.setAttribute("yzqdid", bean.getYzqdid());//医嘱清单编号

        request.setAttribute("dh", bean.getDh());//单号

        request.setAttribute("br", bean.getBr());//病人

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("djr", bean.getDjr());//登记人

        request.setAttribute("ys", bean.getYs());//医生

        request.setAttribute("bc", bean.getBc());//病床

        request.setAttribute("rysj", bean.getRysj());//入院时间

        request.setAttribute("zt", bean.getZt());//状态


        return "yzqd/yzqddetail";
    }

    /**
     * 进入yzqd修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        yzqd bean = new yzqd();//初始化对象
        bean = yzqdservice.getyzqdByID(Integer.parseInt(keyid));//根据id返回 yzqd对象数据


        request.setAttribute("yzqdid", bean.getYzqdid());//医嘱清单编号

        request.setAttribute("dh", bean.getDh());//单号

        request.setAttribute("br", bean.getBr());//病人

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("djr", bean.getDjr());//登记人

        request.setAttribute("ys", bean.getYs());//医生

        request.setAttribute("bc", bean.getBc());//病床

        request.setAttribute("rysj", bean.getRysj());//入院时间

        request.setAttribute("zt", bean.getZt());//状态


        return "yzqd/yzqdmodify";
    }

    /**
     * 修改医嘱清单信息
     */
    @RequestMapping(value = "/update")
    public String update(yzqd bean, HttpServletRequest request, Map<String, Object> map1) {


        String yzqdid = (String) request.getParameter("yzqdid");//医嘱清单编号

        String dh = (String) request.getParameter("dh");//单号

        String br = (String) request.getParameter("br");//病人

        String sm = (String) request.getParameter("sm");//说明

        String djr = (String) request.getParameter("djr");//登记人

        String ys = (String) request.getParameter("ys");//医生

        String bc = (String) request.getParameter("bc");//病床

        String rysj = (String) request.getParameter("rysj");//入院时间

        String zt = (String) request.getParameter("zt");//状态
        DBO db = new DBO();
        String sql = "";
        ResultSet rs = null;
        try {
            if (zt.equals("出院")) {
                sql = "update bingchuang set zt='正常' where bc='" + bc + "'";
                db.update(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }


        request.setAttribute("msg", "<script>alert('操作成功');</script>");
        yzqdservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }

    /**
     * 查询是否有相同病人的单号
     */

    @RequestMapping(value = "/noRepeat")
    @ResponseBody
    public void noRepeat(HttpServletRequest request, HttpServletResponse response, PrintWriter out){
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<Map> list = new ArrayList<>();
        String xm1 = request.getParameter("xm");
        list  = yzqdservice.noRepeat(xm1);
        if (list != null && list.size()>0){
            out.print(false);
        }else{
            out.print(true);
        }
    }
}
