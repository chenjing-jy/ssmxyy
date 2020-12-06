<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.util.DBO" %>
<%
    DBO db = new DBO();
    request.setCharacterEncoding("gb2312");
    String yhm = (String) request.getParameter("yhm");
    String mm = (String) request.getParameter("mm");
    String qx = (String) request.getParameter("qx");

    String sql = "";

    if (qx.equals("管理员")) {
        sql = "select * from gly where yhm='" + yhm + "' and mm='" + mm + "' ";
    }

    if (qx.equals("医生")) {
        sql = "select * from yisheng where yhm='" + yhm + "' and mm='" + mm + "' ";
    }

    if (qx.equals("护士")) {
        sql = "select * from hushi where yhm='" + yhm + "' and mm='" + mm + "' ";
    }


    db.open();
    ResultSet rs = db.query(sql);
    out.println("<script>");
    if (rs.next()) {
        if (qx.equals("管理员")) {
            session.setAttribute("id", rs.getString("glyid"));
            session.setAttribute("xm", rs.getString("xm"));
        }

        if (qx.equals("医生")) {
            session.setAttribute("id", rs.getString("ysid"));
            session.setAttribute("xm", rs.getString("xm"));
        }

        if (qx.equals("护士")) {
            session.setAttribute("id", rs.getString("hsid"));
            session.setAttribute("xm", rs.getString("xm"));
        }

        if (session.getAttribute("yhm")!= null && session.getAttribute("yhm").equals(rs.getString("yhm"))){
            out.println("alert('当前账号已登录！不能重复登录');");
            out.println("window.location='login.jsp'");
        }else{
            session.setAttribute("yhm", rs.getString("yhm"));
            session.setAttribute("mm", rs.getString("mm"));
            session.setAttribute("qx", qx);
            out.println("alert('登录成功');");
            out.println("window.location='index.jsp'");
        }
    } else {
        out.println("alert('用户名或者密码错误');");
        out.println("window.location='login.jsp'");
    }
    out.println("</script>");
%>
