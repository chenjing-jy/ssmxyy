<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String sql = "";
    ResultSet rs = null;
    DBO db = new DBO();
    sql = "select * from yzqd where br='"+request.getAttribute("xm")+"'";
    rs = db.query(sql);
    rs.last();
    int row = rs.getRow();
    request.setAttribute("row",row);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <script>
        window.onload=function () {
            var xm1= document.getElementById("getXMInfo").innerHTML
            var xm = encodeURI(xm1)
            var row = ${row};
            if (row > 0){
                document.getElementById("cdd").innerHTML= "<a href=\"${pageContext.request.contextPath}/yzqd/detail1?xm="+xm+"\" class=\"detailBtn\">了解医嘱详情</a>"
            }else{
                document.getElementById("cdd").innerHTML= "该病人暂未添加医嘱！"
                document.getElementById("cdd").style.color="red";
            }
        }


    </script>
    <style>
        .detailBtn {
            border: none;
            text-align: center;
            line-height: 20px;
            padding: 7px 20px 7px 20px;
            color: white;
            background-color: #33cccc;
        }

        .detailBtn:hover {
            background-color: #3fd5ff;
        }
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>病人管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

<body>


<form name="form">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>病人查看</TD>
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
                    <td align=right width=30% height=30>姓名:</td>
                    <td id="getXm"><span id="getXMInfo">${xm}</span>&nbsp;&nbsp;&nbsp;
                        <span id="cdd"><a href="" class="detailBtn">了解医嘱详情</a></span>
                    </td>
                </tr>
                <tr>
                    <td align=right width=30% height=30>学院:</td>
                    <td>${xy}</td>
                </tr>
                <tr>
                    <td align=right width=30% height=30>年龄:</td>
                    <td>${nl}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>性别:</td>
                    <td>${xb}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td>${sm}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>登记时间:</td>
                    <td>${djsj}</td>

                </tr>
                </TBODY>
            </TABLE>
        </div>
        <input type="hidden" name="brid" value="${brid}">
        <DIV class=adminsubmit>
            <input onclick="javaScript:history.go(-1);" type="button" value="返回" style="width:60px" name="chanel"
                   class="button"/>
        </div>
    </div>
</form>


${msg}

</body>
</html>

