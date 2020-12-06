<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
    #noOpration:hover{
        cursor: not-allowed;
    }

</style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>病床管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.bc.value == "") {
                alert("病床不能为空");
                return false;
            }

            if (form.zt.value == "") {
                alert("状态不能为空");
                return false;
            }

            if (form.sm.value == "") {
                alert("说明不能为空");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/bingchuang/update";
            form.submit();
        }
        function checkRe() {
            var num1 = document.getElementById("noOpe").value
            var num = encodeURI(num1)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange=function () {
                if (xhr.readyState==4){
                    if (xhr.status==200){
                        var msg = document.getElementById("noticeMsg")
                        if (xhr.responseText == "true" && num1 <= 24){
                            msg.innerHTML = "该病床号可用"
                            msg.style.color="green"
                            document.getElementById("noSub").style.visibility="visible"
                        }else if (xhr.responseText == "false") {
                            msg.innerHTML = "该病床号已被占用"
                            msg.style.color="red"
                            document.getElementById("noSub").style.visibility="hidden"
                        }else if (num1 > 24) {
                            msg.innerHTML = "病房位置不足，病床无法修改"
                            msg.style.color="red"
                            document.getElementById("noSub").style.visibility="hidden"
                        }
                    }
                }
            }
            xhr.open("GET","${pageContext.request.contextPath}/bingchuang/noRepeat?bc="+num)
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
                    <TD height=30>病床修改</TD>
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
                    <td><input onkeyup="checkRe()" id="noOpe" type="text" name="bc" placeholder="输入病床" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${bc}"/><i> <font color="red">*</font> </i>
                        <span id="noticeMsg"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>状态:</td>
                    <td><input title="修改病床占用状态请移步医嘱清单处进行操作" id="noOpration" readonly type="text" name="zt" placeholder="输入状态" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${zt}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td><input type="text" name="sm" placeholder="输入说明" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${sm}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <input type="hidden" name="bcid" value="${bcid}">
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

