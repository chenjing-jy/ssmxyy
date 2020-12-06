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
        #noOpe{
            cursor: not-allowed;
        }
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>����Ա����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.yhm.value == "") {
                alert("�û�������Ϊ��");
                return false;
            }

            if (form.mm.value == "") {
                alert("���벻��Ϊ��");
                return false;
            }

            if (form.xm.value == "") {
                alert("��������Ϊ��");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/gly/upd";
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
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var msg = document.getElementById("noticeMsg")
                        if (xhr.responseText == "true") {
                            msg.innerHTML = "���û�������"
                            msg.style.color = "green"
                            document.getElementById("noSub").style.visibility = "visible"
                        } else {
                            msg.innerHTML = "���û����ѱ�ʹ��"
                            msg.style.color = "red"
                            document.getElementById("noSub").style.visibility = "hidden"
                        }
                    }
                }
            }
            xhr.open("GET", "${pageContext.request.contextPath}/gly/noRepeat?yhm=" + yhm)
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
                    <TD height=30>����Ա�޸�</TD>
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
                    <td align=right width=30% height=30>�û���:</td>
                    <td><input title="�û��������޸�" readonly onkeyup="checkRe()" id="noOpe" type="text" name="yhm" placeholder="�����û���" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${yhm}"/><i> <font
                            color="red">*</font> </i>
                        <span id="noticeMsg"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input id="wszz" type="password" name="mm" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${mm}" onfocus="show1()"
                               onblur="hide1()"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input type="text" name="xm" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${xm}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <input type="hidden" name="glyid" value="${glyid}">
                </TBODY>
            </TABLE>
        </div>
        <DIV class=adminsubmit><input id="noSub" type="button" value="����" name="B1" class="button" style="width:60px"
                                      onclick="checkDo()"/>
            &nbsp;&nbsp;
            <input type="reset" value="ȡ��" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}


</body>
</html>

