<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    DBO db = new DBO();

%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>无标题文档</title>
    <link href="css/css_top.css" rel="stylesheet" type="text/css"/>


    <style type="text/css">
        .sitelink table {
            float: left
        }

        label {
            float: left;
            height: 20px;
            line-height: 20px; /* display:block;width:65px;*/
            border: #1684bf 1px solid;
            border-right: 0px;
        }

        .lang {
            border: #1684bf 1px solid;
            border-left: 0px;
            float: left;
            height: 22px;
            line-height: 22px
            /*BEHAVIOR: url('/css/selectBox.htc');*/
        }
        .zzdzz{
            text-align: center;
            text-decoration: none;
            padding-left: 10px;
            color: #7e7e7e;
        }
        .zzdzz:hover{
            color: red;
        }
    </style>

</head>

<body>


<h1 style="text-align: center"> 校医院管理系统 </h1>
<div class="topnav">欢迎您：<span style="color:#F00"><%=session.getAttribute("xm")%></span>
    <a class="zzdzz" href="${pageContext.request.contextPath}/logout" target="_parent">注销登录</a>
    <div class="sitenav">
        <div class="welcome">

        </div>
        <div class="resize">

        </div>
        <div class="sitelink">


        </div>
    </div>
    <div class="leftnav">
        <ul>


        </ul>
    </div>
</div>
</body>
</html>
