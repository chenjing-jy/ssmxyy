<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String sql = "";
    ResultSet rs = null;
    DBO db = new DBO();
    sql = "select * from yzqd where br='"+request.getAttribute("br")+"'";
    rs = db.query(sql);
    rs.last();
    int row = rs.getRow();
    request.setAttribute("row",row);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
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
    <script>
        window.onload=function () {
            var xm1= document.getElementById("getXMInfo").innerHTML
            var xm = encodeURI(xm1)
            var row = ${row};
            if (row > 0){
                document.getElementById("cdd").innerHTML= "<a href=\"${pageContext.request.contextPath}/bingren/detail1?xm="+xm+"\" class=\"detailBtn\">了解病人详情</a>"
            }else{
                document.getElementById("cdd").innerHTML= "该病人暂未添加医嘱！"
                document.getElementById("cdd").style.color="red";
            }
        }


    </script>


    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>病床管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

<body>


<form name="form" action="<%=request.getContextPath()%>/bingchuang/listpage" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>病床查看</TD>
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
                    <td align=right width=30% height=30>病床:</td>
                    <td>${bc}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>状态:</td>
                    <td>${zt}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td>${sm}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>病人:</td>
                    <c:choose>
                        <c:when test="${br == '' || br == null}">
                            <td>无</td>
                        </c:when>
                        <c:otherwise>


                            <td><span id="getXMInfo">${br}</span>&nbsp;&nbsp;&nbsp;
                                <span id="cdd"><a href="" class="detailBtn">了解病人详情</a></span>
                            </td>


                        </c:otherwise>
                    </c:choose>


                </tr>
                </TBODY>
            </TABLE>
        </div>
        <input type="hidden" name="bcid" value="${bcid}">
        <DIV class=adminsubmit>
            <input type="submit" value="返回" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}

</body>
</html>

