<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String lx = (String) request.getParameter("lx");
    String sql = "";
    ResultSet rs = null;
    DBO db = new DBO();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
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
    <title>����ʱ�䰲�Ź���</title>
    <script src="<%=request.getContextPath()%>/js/date.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.rq.value == "") {
                alert("���ڲ���Ϊ��");
                return false;
            }

            if (form.yh.value == "") {
                alert("�û�����Ϊ��");
                return false;
            }

            if (form.lx.value == "") {
                alert("���Ͳ���Ϊ��");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/gzsjap/add";
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
                    <TD height=30>����ʱ�䰲�����</TD>
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
                    <td><input type="text" name="rq" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="" onclick="new Calendar().show(this);"/><i>
                        <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�û�:</td>
                    <td>
                        <select name="yh" class="selctBeau">
                            <%
                                if (lx.equals("ҽ��")) {
                                    sql = "select * from yisheng";
                                } else {
                                    sql = "select * from hushi";
                                }
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("yhm")%>"><%=rs.getString("xm")%>
                            </option>
                            <% }%>

                        </select>
                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input type="text" name="lx" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=lx%>"/><i> <font color="red">*</font>
                    </i></td>

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

<% db.close();%>
</body>
</html>

