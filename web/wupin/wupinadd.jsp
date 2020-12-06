<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>


    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>物品管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.wp.value == "") {
                alert("物品不能为空");
                return false;
            }

            if (form.sm.value == "") {
                alert("说明不能为空");
                return false;
            }

            if (form.sl.value == "") {
                alert("数量不能为空");
                return false;
            }

            if (form.cj.value == "") {
                alert("厂家不能为空");
                return false;
            }

            if (form.gg.value == "") {
                alert("规格不能为空");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/wupin/add";
            form.submit();
        }
        function checkRe() {
            var wp1 = document.getElementById("noOpe").value
            wp = encodeURI(wp1)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange=function () {
                if (xhr.readyState==4){
                    if (xhr.status==200){
                        var msg = document.getElementById("noticeMsg")
                        if (xhr.responseText == "true"){
                            msg.innerHTML = "此物品尚未添加"
                            msg.style.color="green"
                            document.getElementById("noSub").style.visibility="visible"
                        }else{
                            msg.innerHTML = "此物品已经存在"
                            msg.style.color="red"
                            document.getElementById("noSub").style.visibility="hidden"
                        }
                    }
                }
            }
            xhr.open("GET","${pageContext.request.contextPath}/wupin/noRepeat?wp="+wp)
            xhr.send()
        }
    </script>

<body>

<form name="form" action="" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>物品添加</TD>
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
                    <td align=right width=30% height=30>物品:</td>
                    <td><input onkeyup="checkRe()" id="noOpe" type="text" name="wp" placeholder="输入物品" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i>
                        <span id="noticeMsg"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td><input type="text" name="sm" placeholder="输入说明" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>数量:</td>
                    <td><input type="text" name="sl" placeholder="输入数量" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""
                               onKeyUp="this.value=this.value.replace(/\D/g,'')"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>厂家:</td>
                    <td><input type="text" name="cj" placeholder="输入厂家" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>规格:</td>
                    <td><input type="text" name="gg" placeholder="输入规格" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                </TBODY>
            </TABLE>
        </div>
        <DIV class=adminsubmit><input id="noSub" type="button" value="保存" name="B1" class="button" style="width:60px"
                                      onclick="checkDo()"/>
            &nbsp;&nbsp;
            <input type="reset" value="取消" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}


</body>
</html>

