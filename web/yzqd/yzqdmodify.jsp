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
        .wszz:hover{
            cursor: not-allowed;
        }
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>ҽ���嵥����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.dh.value == "") {
                alert("���Ų���Ϊ��");
                return false;
            }

            if (form.br.value == "") {
                alert("���˲���Ϊ��");
                return false;
            }

            if (form.sm.value == "") {
                alert("˵������Ϊ��");
                return false;
            }

            if (form.djr.value == "") {
                alert("�Ǽ��˲���Ϊ��");
                return false;
            }

            if (form.ys.value == "") {
                alert("ҽ������Ϊ��");
                return false;
            }

            if (form.bc.value == "") {
                alert("��������Ϊ��");
                return false;
            }

            if (form.rysj.value == "") {
                alert("��Ժʱ�䲻��Ϊ��");
                return false;
            }

            if (form.zt.value == "") {
                alert("״̬����Ϊ��");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/yzqd/update";
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
                    <TD height=30>ҽ���嵥�޸�</TD>
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
                    <td><input readonly type="text" name="dh" placeholder="���뵥��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${dh}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input readonly type="text" name="br" placeholder="���벡��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${br}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>˵��:</td>
                    <td>
                        <textarea rows="5" cols="80" name="sm" placeholder="����˵��">${sm}</textarea>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�Ǽ���:</td>
                    <td><input readonly type="text" name="djr" placeholder="����Ǽ���" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${djr}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>ҽ��:</td>
                    <td><input readonly type="text" name="ys" placeholder="����ҽ��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${ys}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input readonly type="text" name="bc" placeholder="���벡��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${bc}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>��Ժʱ��:</td>
                    <td><input readonly type="text" name="rysj" placeholder="������Ժʱ��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${rysj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>״̬:</td>
                    <td><input readonly type="text" name="zt" placeholder="����״̬" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="��Ժ"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <input type="hidden" name="yzqdid" value="${yzqdid}">
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

