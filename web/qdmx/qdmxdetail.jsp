<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>


<LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css" />
<title>清单明细管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<body >



<form name="form" action="<%=request.getContextPath()%>/qdmx/listpage" method="post" >
<div class=formzone>
<DIV class=searchzone>

<TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD height=30>清单明细查看</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=right width=30% height=30>清单:</td>
     <td >${qd}</td>
	 
	 </tr>
         <tr>
     <td align=right width=30% height=30>类型:</td>
     <td >${lx}</td>
	 
	 </tr>
         <tr>
     <td align=right width=30% height=30>说明:</td>
     <td >${sm}</td>
	 
	 </tr>
         <tr>
     <td align=right width=30% height=30>数量:</td>
     <td >${sl}</td>
	 
	 </tr>
         <tr>
     <td align=right width=30% height=30>用法:</td>
     <td >${yf}</td>
	 
	 </tr>
         <tr>
     <td align=right width=30% height=30>登记时间:</td>
     <td >${djsj}</td>
	 
	 </tr>
</TBODY></TABLE>
</div>    <input type="hidden" name="qdmxid" value="${qdmxid}">
<DIV class=adminsubmit> 
                      <input type="submit" value="返回" style="width:60px" name="chanel" class="button" />
</div>
</div>
</form>



${msg}

</body>
</html>

