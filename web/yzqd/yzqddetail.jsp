<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String dh = (String) request.getAttribute("dh");
    DBO db = new DBO();
    String sql = "";
    ResultSet rs = null;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>


    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>医嘱清单管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

<body>


<form name="form">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>医嘱清单查看</TD>
                    <TD align=right colSpan=2>&nbsp;</TD>
                </TR>
                </TBODY>
            </TABLE>
        </DIV>
        <div class=tablezone>
            <div class=noticediv id=notice></div>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
                <TBODY>

                <tr>
                    <td align=right width=30% height=30>单号:</td>
                    <td>${dh}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>病人:</td>
                    <td>${br}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td>${sm}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>登记人:</td>


                    <c:set var="cxdjr" value="${djr}" scope="request"></c:set>
                    <%
                        String djr = request.getAttribute("cxdjr")+"";
                        sql = "select xm from yisheng where yhm='"+djr+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>
                    <%
                        String djr1 = request.getAttribute("cxdjr")+"";
                        sql = "select xm from hushi where yhm='"+djr1+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>
                    <%
                        String djr2 = request.getAttribute("cxdjr")+"";
                        sql = "select xm from gly where yhm='"+djr2+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>



                </tr>
                <tr>
                    <td align=right width=30% height=30>医生:</td>


                    <c:set var="cxys" value="${ys}" scope="request"></c:set>
                    <%
                        String ys = request.getAttribute("cxys")+"";
                        sql = "select xm from yisheng where yhm='"+ys+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>
                    <%
                        String ys1 = request.getAttribute("cxys")+"";
                        sql = "select xm from hushi where yhm='"+ys1+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>
                    <%
                        String ys2 = request.getAttribute("cxys")+"";
                        sql = "select xm from gly where yhm='"+ys2+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>




                </tr>
                <tr>
                    <td align=right width=30% height=30>病床:</td>
                    <td>${bc}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>入院时间:</td>
                    <td>${rysj}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>状态:</td>
                    <td>${zt}</td>

                </tr>
                </TBODY>
            </TABLE>
            <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">
                <TBODY id="table2">

                <tr align="center" bgcolor="#ebf0f7">

                    <td width="9%" height="25">类型</td>
                    <td width="9%" height="25">说明</td>
                    <td width="9%" height="25">数量</td>
                    <td width="9%" height="25">用法</td>
                    <td width="9%" height="25">登记时间</td>

                </tr>


                <%
                    sql = "select * from qdmx where qd='" + dh + "'";
                    rs = db.query(sql);

                    if (rs != null) {
                        while (rs.next()) {
                %>
                <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"'
                    onmouseout='this.style.background="#FFFFFF"'>

                    <td height="24"><%=rs.getString("lx")%>
                    </td>
                    <td height="24"><%=rs.getString("sm")%>
                    </td>
                    <td height="24"><%=rs.getString("sl")%>
                    </td>
                    <td height="24"><%=rs.getString("yf")%>
                    </td>
                    <td height="24"><%=rs.getString("djsj")%>
                    </td>

                </tr>

                <%
                        }
                    }
                %>

                </TBODY>
            </TABLE>
        </div>
        <input type="hidden" name="yzqdid" value="${yzqdid}">
        <DIV class=adminsubmit>
            <input onclick="javaScript:history.go(-1);" type="button" value="返回" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}

<%
    db.close();
%>
</body>
</html>

