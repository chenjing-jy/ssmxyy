<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.util.DBO" %>
<%
    DBO db = new DBO();
    request.setCharacterEncoding("gb2312");
    String yhm = (String) request.getParameter("yhm");
    String mm = (String) request.getParameter("mm");
    String qx = (String) request.getParameter("qx");

    String sql = "";

    if (qx.equals("����Ա")) {
        sql = "select * from gly where yhm='" + yhm + "' and mm='" + mm + "' ";
    }

    if (qx.equals("ҽ��")) {
        sql = "select * from yisheng where yhm='" + yhm + "' and mm='" + mm + "' ";
    }

    if (qx.equals("��ʿ")) {
        sql = "select * from hushi where yhm='" + yhm + "' and mm='" + mm + "' ";
    }


    db.open();
    ResultSet rs = db.query(sql);
    out.println("<script>");
    if (rs.next()) {
        if (qx.equals("����Ա")) {
            session.setAttribute("id", rs.getString("glyid"));
            session.setAttribute("xm", rs.getString("xm"));
        }

        if (qx.equals("ҽ��")) {
            session.setAttribute("id", rs.getString("ysid"));
            session.setAttribute("xm", rs.getString("xm"));
        }

        if (qx.equals("��ʿ")) {
            session.setAttribute("id", rs.getString("hsid"));
            session.setAttribute("xm", rs.getString("xm"));
        }

        if (session.getAttribute("yhm")!= null && session.getAttribute("yhm").equals(rs.getString("yhm"))){
            out.println("alert('��ǰ�˺��ѵ�¼�������ظ���¼');");
            out.println("window.location='login.jsp'");
        }else{
            session.setAttribute("yhm", rs.getString("yhm"));
            session.setAttribute("mm", rs.getString("mm"));
            session.setAttribute("qx", qx);
            out.println("alert('��¼�ɹ�');");
            out.println("window.location='index.jsp'");
        }
    } else {
        out.println("alert('�û��������������');");
        out.println("window.location='login.jsp'");
    }
    out.println("</script>");
%>
