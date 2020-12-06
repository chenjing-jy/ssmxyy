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
            width: 70px;
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
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>��ٹ���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.bt.value == "") {
                alert("���ⲻ��Ϊ��");
                return false;
            }

            if (form.nr.value == "") {
                alert("���ݲ���Ϊ��");
                return false;
            }

            if (form.qjsj.value == "") {
                alert("���ʱ�䲻��Ϊ��");
                return false;
            }

            if (form.kssj.value == "") {
                alert("��ʼʱ�䲻��Ϊ��");
                return false;
            }

            if (form.jssj.value == "") {
                alert("����ʱ�䲻��Ϊ��");
                return false;
            }

            if (form.zt.value == "") {
                alert("״̬����Ϊ��");
                return false;
            }

            if (form.yh.value == "") {
                alert("�û�����Ϊ��");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/qingjia/update";
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
                    <TD height=30>����޸�</TD>
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
                    <td><input readonly class="wszz" type="text" name="bt" placeholder="�������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${bt}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td>
                        <textarea readonly class="wszz" rows="5" cols="80" name="nr" placeholder="��������">${nr}</textarea>
                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�����ύʱ��:</td>
                    <td><input readonly class="wszz" type="text" name="qjsj" placeholder="�������ʱ��" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${qjsj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>��ʼʱ��:</td>
                    <td><input readonly class="wszz" type="text" name="kssj" placeholder="���뿪ʼʱ��" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${kssj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����ʱ��:</td>
                    <td><input readonly class="wszz" type="text" name="jssj" placeholder="�������ʱ��" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${jssj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>״̬:</td>
                    <td>
                        <select name="zt" class="selctBeau">
                            <option value="ͬ��">ͬ��</option>
                            <option value="��ͬ��">��ͬ��</option>
                        </select>
                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�����û�:</td>
                    <td><input readonly class="wszz" type="text" name="yh" placeholder="�����û�" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${yh}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <input type="hidden" name="qjid" value="${qjid}">
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

