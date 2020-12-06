<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String sql = "";
    ResultSet rs = null;
    DBO db = new DBO();
    String lx = (String) request.getParameter("lx");
    String qd = (String) request.getParameter("qd");
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
            width: 310px;
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


            form.action = "<%=request.getContextPath()%>/qdmx/add";
            form.submit();
        }

        window.onload=function(){
            var obj=document.getElementById("choiceNum");
            for(i=0;i<obj.length;i++){
                if(obj[i].selected==true){
                    var num = obj[i].innerHTML
                    var num1 = num.replace(/[^0-9]/ig,"");
                    document.getElementById("noticeInfo").innerHTML = num1
                    //�ؼ���ͨ��option�����innerText���Ի�ȡ��ѡ���ı�
                }
            }
        }
        function showNum() {
            var obj=document.getElementById("choiceNum");
            for(i=0;i<obj.length;i++){
                if(obj[i].selected==true){
                    var num = obj[i].innerHTML
                    var num1 = num.replace(/[^0-9]/ig,"");
                    document.getElementById("noticeInfo").innerHTML = num1
                         //�ؼ���ͨ��option�����innerText���Ի�ȡ��ѡ���ı�
                }
            }
        }
        
        function checkNum() {
            var num = document.getElementById("noticeInfo").innerHTML
            var num1 = parseInt(num+"")
            if (document.getElementById("innerNum").value > num1) {
                document.getElementById("noticeError").innerHTML = "��治�㣡"
                document.getElementById("noticeError").style.color = "red";
            }else{
                document.getElementById("noticeError").innerHTML = "�����㣬ʹ�ú�ʣ�ࣺ" +(num1-document.getElementById("innerNum").value)
                document.getElementById("noticeError").style.color = "green";
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
                    <TD height=30>�嵥��ϸ���</TD>
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
                    <td><input readonly type="text" name="qd" placeholder="�����嵥" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=qd%>"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input readonly type="text" name="lx" placeholder="��������" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=lx%>"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>˵��:</td>
                    <td>
                        <%

                            if (lx.equals("��Ʒ")) {
                        %>

                        <select id="choiceNum" name="sm" onchange="showNum()" class="selctBeau">
                            <%
                                sql = "select * from wupin ";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>

                            <option value="<%=rs.getString("wp")%>"><%=rs.getString("wp")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               ��棺<%=rs.getString("sl")%>
                            </option>


                            <% }%>

                        </select>
                        <i> <font color="red">*</font> </i>
                        <span style="color: red;" id="noticeError"></span>
                        <% } else {%>

                        <input type="text" name="sm" placeholder="����˵��" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/>
                        <i> <font color="red">*</font> </i>
                        <% }%>


                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input onkeyup="checkNum()" id="innerNum" type="number" name="sl" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="1"
                               onKeyUp="this.value=this.value.replace(/\D/g,'')"/><i> <font color="red">*</font> </i>
                        <%

                            if (lx.equals("��Ʒ")) {
                        %>
                        <span style="color: red;">��棺</span><span id="noticeInfo" style="color: red;"></span>
                        <%} %>



                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�÷�:</td>
                    <td><input type="text" name="yf" placeholder="�����÷�" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

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
<%
    db.close();
%>

