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
        #zzdzz1,#zzdzz2:hover{
            cursor:not-allowed;
        }
        .wszz:hover{
            cursor: not-allowed;
        }
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>�嵥��ϸ����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.qd.value == "") {
                alert("�嵥����Ϊ��");
                return false;
            }

            if (form.lx.value == "") {
                alert("���Ͳ���Ϊ��");
                return false;
            }

            if (form.sm.value == "") {
                alert("˵������Ϊ��");
                return false;
            }

            if (form.sl.value == "") {
                alert("��������Ϊ��");
                return false;
            }

            if (form.yf.value == "") {
                alert("�÷�����Ϊ��");
                return false;
            }

            if (form.djsj.value == "") {
                alert("�Ǽ�ʱ�䲻��Ϊ��");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/qdmx/update";
            form.submit();
        }
    </script>

<body>


<form name="form" action="" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>�嵥��ϸ�޸�</TD>
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
                    <td align=right width=30% height=30>�嵥:</td>
                    <td><input title="�˲������ݲ����޸ģ�����Ҫ������ɾ�����������ϸ��Ϣ" readonly type="text" name="qd" placeholder="�����嵥" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${qd}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input title="�˲������ݲ����޸ģ�����Ҫ������ɾ�����������ϸ��Ϣ" readonly type="text" name="lx" placeholder="��������" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${lx}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>˵��:</td>
                    <td><input title="�˲������ݲ����޸ģ�����Ҫ������ɾ�����������ϸ��Ϣ" readonly id="zzdzz1" type="text" name="sm" placeholder="����˵��" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${sm}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input title="�˲������ݲ����޸ģ�����Ҫ������ɾ�����������ϸ��Ϣ" readonly id="zzdzz2" type="text" name="sl" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${sl}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�÷�:</td>
                    <td><input type="text" name="yf" placeholder="�����÷�" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${yf}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�Ǽ�ʱ��:</td>
                    <td><input readonly type="text" name="djsj" placeholder="����Ǽ�ʱ��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${djsj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <input type="hidden" name="qdmxid" value="${qdmxid}">
                </TBODY>
            </TABLE>
        </div>
        <DIV class=adminsubmit><input type="button" value="����" name="B1" class="button" style="width:60px"
                                      onclick="checkDo()"/>
            &nbsp;&nbsp;
            <input type="reset" value="ȡ��" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}


</body>
</html>

