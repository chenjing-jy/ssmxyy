package com.controller;

import com.service.qdmxService;
import com.util.DBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.*;
import com.dao.*;

/***
 清单明细Conroller 控制类方法
 */

@Controller
@RequestMapping(value = "/qdmx")
public class qdmxController {
    /**
     * 自动注入业务逻辑层，注入方式使用了注解自动注入
     */


    @Resource
    private qdmxService qdmxservice;
    @RequestMapping(value = "/addpage")
    public String addpage(qdmx bean, HttpServletRequest request) {
        /**
         清单明细添加页面
         */

        Map<String, Object> map = new HashMap<String, Object>();

        System.out.println("addPageok");
        return "qdmx/qdmxadd";
    }

    @RequestMapping(value = "/add")
    public String add(qdmx bean, HttpServletRequest request) {
        /**
         清单明细添加处理方法
         **/
        Map<String, Object> map = new HashMap<String, Object>();//初始变量


        String qdmxid = (String) request.getParameter("qdmxid");//清单明细编号

        String qd = (String) request.getParameter("qd");//清单

        String lx = (String) request.getParameter("lx");//类型

        String sm = (String) request.getParameter("sm");//说明

        String sl = (String) request.getParameter("sl");//数量

        String yf = (String) request.getParameter("yf");//用法

        String djsj = (String) request.getParameter("djsj");//登记时间

        if (lx.equals("物品")) {
            DBO db = new DBO();
            int num = 0;
            ResultSet rs = null;
            String sql = "";
            try {

                sql = "select * from wupin where wp='" + sm + "'";
                rs = db.query(sql);
                if (rs.next()) {
                    num = rs.getInt("sl");
                }
                if (num < Integer.parseInt(sl)) {
                    request.setAttribute("msg", "<script>alert('添加失败、物品库存数量不足');</script>");//操作提示

                } else {
                    sql = "update wupin set sl=sl-" + sl + " where wp='" + sm + "'";
                    db.update(sql);
                    qdmxservice.add(bean);//调用添加方法
                    System.out.println("add");
                    request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
                }

            } catch (Exception e) {
                e.printStackTrace();
                ;
            } finally {
                db.close();
            }

        } else {
            qdmxservice.add(bean);//调用添加方法
            System.out.println("add");
            request.setAttribute("msg", "<script>alert('添加成功');</script>");//操作提示
        }


        return "qdmx/add";
    }


    /**
     * 删除 清单明细
     */
    @RequestMapping(value = "/del")
    public String del(HttpServletRequest request, Map<String, Object> map) {

        //	Map<String,Object> map= new HashMap<String,Object>();//初始化对象
        String a = (String) request.getParameter("keyid");//request 方式获得主键id
        int id = Integer.parseInt(a);
        request.setAttribute("msg", "<script>alert('删除成功');</script>");
        qdmxservice.delete(id);//调用 删除方法
        return listpage(map, request);
    }

    /**
     * 查询qdmx信息 返回list结果 前台获取
     */
    @RequestMapping(value = "/listpage")
    public String listpage(Map<String, Object> map, HttpServletRequest request) {
        List<Map> list = new ArrayList<Map>();//初始化对象
        Map map1 = new HashMap();


        String qdmxid = (String) request.getParameter("qdmxid");//清单明细编号
        if (qdmxid != null && !qdmxid.equals("")) {
            map1.put("qdmxid", qdmxid);//清单明细编号
        }
        String qd = (String) request.getParameter("qd");//清单
        if (qd != null && !qd.equals("")) {
            map1.put("qd", qd);//清单
        }
        String lx = (String) request.getParameter("lx");//类型
        if (lx != null && !lx.equals("")) {
            map1.put("lx", lx);//类型
        }
        String sm = (String) request.getParameter("sm");//说明
        if (sm != null && !sm.equals("")) {
            map1.put("sm", sm);//说明
        }
        String sl = (String) request.getParameter("sl");//数量
        if (sl != null && !sl.equals("")) {
            map1.put("sl", sl);//数量
        }
        String yf = (String) request.getParameter("yf");//用法
        if (yf != null && !yf.equals("")) {
            map1.put("yf", yf);//用法
        }
        String djsj = (String) request.getParameter("djsj");//登记时间
        if (djsj != null && !djsj.equals("")) {
            map1.put("djsj", djsj);//登记时间
        }

        list = qdmxservice.getAll(map1);//传入 方法参数 返回gly结果集
        System.out.println("listsize=" + list.size());

        map.put("list", list);//传递参数
        return "qdmx/qdmxlist";
    }

    /**
     * 清单明细详情信息
     */
    @RequestMapping(value = "/detail")
    public String detail(Map<String, Object> map, HttpServletRequest request) {

        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        qdmx bean = new qdmx();//初始化对象
        bean = qdmxservice.getqdmxByID(Integer.parseInt(keyid));//根据id返回 qdmx对象数据


        request.setAttribute("qdmxid", bean.getQdmxid());//清单明细编号

        request.setAttribute("qd", bean.getQd());//清单

        request.setAttribute("lx", bean.getLx());//类型

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("sl", bean.getSl());//数量

        request.setAttribute("yf", bean.getYf());//用法

        request.setAttribute("djsj", bean.getDjsj());//登记时间


        return "qdmx/qdmxdetail";
    }

    /**
     * 进入qdmx修改页面
     **/
    @RequestMapping(value = "/modifypage")
    public String modifypage(Map<String, Object> map, HttpServletRequest request) {
        String keyid = (String) request.getParameter("keyid");//request 方式获得主键id
        qdmx bean = new qdmx();//初始化对象
        bean = qdmxservice.getqdmxByID(Integer.parseInt(keyid));//根据id返回 qdmx对象数据


        request.setAttribute("qdmxid", bean.getQdmxid());//清单明细编号

        request.setAttribute("qd", bean.getQd());//清单

        request.setAttribute("lx", bean.getLx());//类型

        request.setAttribute("sm", bean.getSm());//说明

        request.setAttribute("sl", bean.getSl());//数量

        request.setAttribute("yf", bean.getYf());//用法

        request.setAttribute("djsj", bean.getDjsj());//登记时间


        return "qdmx/qdmxmodify";
    }

    /**
     * 修改清单明细信息
     */
    @RequestMapping(value = "/update")
    public String update(qdmx bean, HttpServletRequest request, Map<String, Object> map1) {


        String qdmxid = (String) request.getParameter("qdmxid");//清单明细编号

        String qd = (String) request.getParameter("qd");//清单

        String lx = (String) request.getParameter("lx");//类型

        String sm = (String) request.getParameter("sm");//说明

        String sl = (String) request.getParameter("sl");//数量

        String yf = (String) request.getParameter("yf");//用法

        String djsj = (String) request.getParameter("djsj");//登记时间


        request.setAttribute("msg", "<script>alert('修改成功');</script>");
        qdmxservice.update(bean);//执行update 方法
        return listpage(map1, request);
    }

}
