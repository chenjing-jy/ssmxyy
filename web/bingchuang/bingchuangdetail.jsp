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
                document.getElementById("cdd").innerHTML= "<a href=\"${pageContext.request.contextPath}/bingren/detail1?xm="+xm+"\" class=\"detailBtn\">�˽ⲡ������</a>"
            }else{
                document.getElementById("cdd").innerHTML= "�ò�����δ���ҽ����"
                document.getElementById("cdd").style.color="red";
            }
        }


    </script>


    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>��������</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

<body>


<form name="form" action="<%=request.getContextPath()%>/bingchuang/listpage" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>�����鿴</TD>
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
                    <td align=right width=30% height=30>����:</td>
                    <td>${bc}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>״̬:</td>
                    <td>${zt}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>˵��:</td>
                    <td>${sm}</td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <c:choose>
                        <c:when test="${br == '' || br == null}">
                            <td>��</td>
                        </c:when>
                        <c:otherwise>


                            <td><span id="getXMInfo">${br}</span>&nbsp;&nbsp;&nbsp;
                                <span id="cdd"><a href="" class="detailBtn">�˽ⲡ������</a></span>
                            </td>


                        </c:otherwise>
                    </c:choose>


                </tr>
                </TBODY>
            </TABLE>
        </div>
        <input type="hidden" name="bcid" value="${bcid}">
        <DIV class=adminsubmit>
            <input type="submit" value="����" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}

</body>
</html>

