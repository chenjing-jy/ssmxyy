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
    <title>医生管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.yhm.value == "") {
                alert("用户名不能为空");
                return false;
                form.yhm.focus();
            }

            if (form.mm.value == "") {
                alert("密码不能为空");
                return false;
                form.mm.focus();
            }

            if (form.xm.value == "") {
                alert("姓名不能为空");
                return false;
                form.xm.focus();
            }

            if (form.lxdh.value == "") {
                alert("联系电话不能为空");
                return false;
                form.lxdh.focus();
            }

            if (form.lxdz.value == "") {
                alert("联系地址不能为空");
                return false;
                form.lxdz.focus();
            }

            if (form.ks.value == "") {
                alert("科室不能为空");
                return false;
                form.ks.focus();
            }


            form.action = "<%=request.getContextPath()%>/yisheng/add";
            form.submit();
        }

        function show1() {
            document.getElementById("wszz").type = "text"
        }

        function hide1() {
            document.getElementById("wszz").type = "password"
        }
        function checkRe() {
            var yhm1 = document.getElementById("noOpe").value
            var yhm = encodeURI(yhm1)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange=function () {
                if (xhr.readyState==4){
                    if (xhr.status==200){
                        var msg = document.getElementById("noticeMsg")
                        if (xhr.responseText == "true"){
                            msg.innerHTML = "此用户名可用"
                            msg.style.color="green"
                            document.getElementById("noSub").style.visibility="visible"
                        }else{
                            msg.innerHTML = "此用户名已被使用"
                            msg.style.color="red"
                            document.getElementById("noSub").style.visibility="hidden"
                        }
                    }
                }
            }
            xhr.open("GET","${pageContext.request.contextPath}/yisheng/noRepeat?yhm="+yhm)
            xhr.send()
        }
        function checkPhone(e) {
            var reg =/^1[34578]\d{9}$/;
            var phone = e.value
            if (!reg.test(phone)){
                document.getElementById("noticePhone").innerHTML="请输入正确的手机号！"
                document.getElementById("noSub").style.visibility="hidden"
            } else{
                document.getElementById("noticePhone").innerHTML=""
                document.getElementById("noSub").style.visibility="visible"
            }
        }
    </script>

<body>

<form name="form" action="" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>医生添加</TD>
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
                    <td align=right width=30% height=30>用户名:</td>
                    <td><input onkeyup="checkRe()" id="noOpe"  type="text" name="yhm" placeholder="输入用户名" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i>
                        <span id="noticeMsg"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>密码:</td>
                    <td><input id="wszz" type="text" name="mm" placeholder="输入密码" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="" onfocus="show1()" onblur="hide1()"/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>姓名:</td>
                    <td><input type="text" name="xm" placeholder="输入姓名" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>联系电话:</td>
                    <td><input onblur="checkPhone(this)" type="text" name="lxdh" placeholder="输入联系电话" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i>
                        <span style="color: red" id="noticePhone"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>联系地址:</td>
                    <td><input type="text" name="lxdz" placeholder="输入联系地址" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>科室:</td>
                    <td><input type="text" name="ks" placeholder="输入科室" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                </TBODY>
            </TABLE>
        </div>
        <DIV class=adminsubmit><input id="noSub"  type="button" value="保存" name="B1" class="button" style="width:60px"
                                      onclick="checkDo()"/>
            &nbsp;&nbsp;
            <input type="reset" value="取消" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}


</body>
</html>

