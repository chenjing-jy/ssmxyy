<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
    request.setCharacterEncoding("gb2312");
    DBO db= new DBO();
    String sql="";
    ResultSet rs=null;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <style>
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
            width: 100px;
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
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css" />
    <title>�嵥��ϸ����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script language="javascript">
        function checkDo(){


            if(form.lx.value==""){
                alert("���Ͳ���Ϊ��");
                return false;
            }
            if (form.qd.value=="" || form.qd.value == null){
                alert("Ŀǰ���޿�ִ���嵥")
                return false;
            }


            form.action="<%=request.getContextPath()%>/qdmx/qdmxadd.jsp";
            form.submit();
        }

    </script>

<body >

<form name="form" action="" method="post" onsubmit="return toValid()">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>�嵥��ϸ���</TD>
                    <TD align=right colSpan=2>&nbsp;</TD>
                </TR></TBODY></TABLE></DIV>
        <div class=tablezone>
            <div class=noticediv id=notice></div>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
                <TBODY>

                <tr>
                    <td align=right width=30% height=30>�嵥:</td>
                    <td >
                        <select name="qd" class="selctBeau">
                        <%
                        sql="select * from yzqd where zt='��ס'";
                        rs=db.query(sql);
                        while(rs.next()){
                        %>
                            <option id="nochoice" value="<%=rs.getString("dh")%>"><%=rs.getString("br")%>[<%=rs.getString("dh")%>]</option>
                            <% }%>
                        </select>

                        <i>	 <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td >
                        <select name="lx" class="selctBeau1">
                            <option value="��Ʒ">��Ʒ</option>
                            <option value="������Ŀ">������Ŀ</option>
                        </select>
                        <i>	 <font color="red">*</font> </i></td>

                </tr>

                </TBODY></TABLE>
        </div>
        <DIV class=adminsubmit> <input type="button" value="����" name="B1" class="button" style="width:60px" onclick="checkDo()"  />
            &nbsp;&nbsp;
            <input type="reset" value="ȡ��" style="width:60px" name="chanel" class="button" />
        </div>
    </div>
</form>

${msg}


</body>
</html>

