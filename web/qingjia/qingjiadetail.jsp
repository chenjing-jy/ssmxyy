<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String sql = "";
    ResultSet rs = null;
    DBO db = new DBO();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>


    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>请假管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

<body>


<form name="form" action="<%=request.getContextPath()%>/qingjia/listpage" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>请假查看</TD>
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
                    <td align=right width=30% height=30>标题:</td>
                    <td>${bt}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>内容:</td>
                    <td>${nr}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>申请提交时间:</td>
                    <td>${qjsj}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>开始时间:</td>
                    <td>${kssj}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>结束时间:</td>
                    <td>${jssj}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>状态:</td>
                    <td>${zt}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>申请用户:</td>
                    <c:set var="cxyh" value="${yh}" scope="request"></c:set>
                    <%
                        String yh = request.getAttribute("cxyh")+"";
                        sql = "select xm from yisheng where yhm='"+yh+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>
                    <%
                        String yh1 = request.getAttribute("cxyh")+"";
                        sql = "select xm from hushi where yhm='"+yh1+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>
                    <%
                        String yh2 = request.getAttribute("cxyh")+"";
                        sql = "select xm from gly where yhm='"+yh2+"'";
                        rs = db.query(sql);
                        while (rs.next()) {
                    %>
                    <td height="28"><%=rs.getString("xm") %></td>
                    <% }%>

                </tr>
                </TBODY>
            </TABLE>
        </div>
        <input type="hidden" name="qjid" value="${qjid}">
        <DIV class=adminsubmit>
            <input type="button" value="返回" style="width:60px" name="chanel" class="button"
                   onclick="window.history.go(-1)"/>
        </div>
    </div>
</form>


${msg}

</body>
</html>

