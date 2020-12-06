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
        .selctBeau{
            width: 200px;
            height: 23px;
            line-height: 23px;
            text-align: center;
            border-radius: 10px;
            text-align-last:center;
            color: #656565;
        }
        .selctBeau:focus{
            border: 1px solid #ffc019;
            outline: none;
        }
        .selctBeau:hover{
            border: 1px solid #ffc019;
            outline: none;
        }
        .selctBeau1{
            width: 50px;
            height: 23px;
            line-height: 23px;
            text-align: center;
            border-radius: 10px;
            text-align-last:center;
            color: #656565;
        }
        .selctBeau1:focus{
            border: 1px solid #ffc019;
            outline: none;
        }
        .selctBeau1:hover{
            border: 1px solid #ffc019;
            outline: none;
        }
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>���˹���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.xm.value == "") {
                alert("��������Ϊ��");
                return false;
            }

            if (form.nl.value == "") {
                alert("���䲻��Ϊ��");
                return false;
            }

            if (form.xb.value == "") {
                alert("�Ա���Ϊ��");
                return false;
            }

            if (form.sm.value == "") {
                alert("˵������Ϊ��");
                return false;
            }

            if (form.djsj.value == "") {
                alert("�Ǽ�ʱ�䲻��Ϊ��");
                return false;
            }

            if (form.xy.value == "") {
                alert("ѧԺ����Ϊ��");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/bingren/add";
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
                    <TD height=30>�������</TD>
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
                    <td><input type="text" name="xm" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>ѧԺ:</td>
                    <td>
                        <select name="xy" class="selctBeau">
                            <option value="��ѧ��������ѧѧԺ">��ѧ��������ѧѧԺ</option>
                            <option value="��ѧԺ">��ѧԺ</option>
                            <option value="����ѧԺ">����ѧԺ</option>
                            <option value="���Ŵ���ѧԺ">���Ŵ���ѧԺ</option>
                            <option value="��ľ����ѧԺ">��ľ����ѧԺ</option>
                            <option value="����ѧԺ">����ѧԺ</option>
                            <option value="�����ѧԺ">�����ѧԺ</option>
                            <option value="����ѧԺ">����ѧԺ</option>
                            <option value="����ѧԺ">����ѧԺ</option>
                            <option value="������ѧ�빤��ѧԺ">������ѧ�빤��ѧԺ</option>
                            <option value="ҽѧ��">ҽѧ��</option>
                            <option value="����ѧԺ">����ѧԺ</option>
                        </select>


                        <i> <font color="red">*</font> </i></td>
                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input type="text" name="nl" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�Ա�:</td>
                    <td>
                        <select name="xb" class="selctBeau1">
                            <option value="��">��</option>
                            <option value="Ů">Ů</option>
                        </select>


                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>˵��:</td>
                    <td>
                        <textarea rows="5" cols="80" name="sm" placeholder="����˵��"></textarea>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�Ǽ�ʱ��:</td>
                    <td><input readonly type="text" name="djsj" placeholder="����Ǽ�ʱ��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=StaticMethod.getStringDate()%>"/><i>
                        <font color="red">*</font> </i></td>

                </tr>
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

