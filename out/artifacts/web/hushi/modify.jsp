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
        #nowrite:hover {
            cursor: not-allowed;
        }
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>��ʿ����</title>
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

            if (form.lxdh.value == "") {
                alert("��ϵ�绰����Ϊ��");
                return false;
            }

            if (form.lxdz.value == "") {
                alert("��ϵ��ַ����Ϊ��");
                return false;
            }

            if (form.ks.value == "") {
                alert("���Ҳ���Ϊ��");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/hushi/upd";
            form.submit();
        }

        function show2() {
            document.getElementById("wszz").type = "text"
        }

        function hide2() {
            document.getElementById("wszz").type = "password"
        }
        function checkPhone(e) {
            var reg =/^1[34578]\d{9}$/;
            var phone = e.value
            if (!reg.test(phone)){
                document.getElementById("noticePhone").innerHTML="��������ȷ���ֻ��ţ�"
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
                    <TD height=30>��ʿ�޸�</TD>
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
                    <td><input title="�û��������޸ģ�" id="nowrite" type="text" name="yhm" placeholder="�����û���" readonly
                               class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${yhm}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input id="wszz" type="password" name="mm" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${mm}" onfocus="show2()"
                               onblur="hide2()"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input type="text" name="xm" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${xm}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>��ϵ�绰:</td>
                    <td><input onblur="checkPhone(this)" type="text" name="lxdh" placeholder="������ϵ�绰" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${lxdh}"/><i> <font color="red">*</font>
                    </i>
                        <span style="color: red" id="noticePhone"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>��ϵ��ַ:</td>
                    <td><input type="text" name="lxdz" placeholder="������ϵ��ַ" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${lxdz}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input type="text" name="ks" placeholder="�������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${ks}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <input type="hidden" name="hsid" value="${hsid}">
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

