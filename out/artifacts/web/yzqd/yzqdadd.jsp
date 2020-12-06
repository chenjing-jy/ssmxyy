<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String sql = "";
    ResultSet rs = null;
    DBO db = new DBO();
    String yhm = "";
    if (session.getAttribute("yhm") != null) {
        yhm = (String) session.getAttribute("yhm");
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
        .wszz:hover {
            cursor: not-allowed;
        }

        .detailBtn {
            border: none;
            text-align: center;
            line-height: 20px;
            padding: 7px 20px 7px 20px;
            color: white;
            background-color: #33cccc;
        }

        .detailBtn:hover {
            background-color: #3fd5ff;
        }
        .selctBeau{
            width: 100px;
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


            form.action = "<%=request.getContextPath()%>/yzqd/add";
            form.submit();
        }

        window.onload = function () {
            var obj = document.getElementById("brSelect");
            var br1 = ""
            for (i = 0; i < obj.length; i++) {
                if (obj[i].selected == true) {
                    br1 = obj[i].value
                }
            }
            var xm = encodeURI(br1)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var msg = document.getElementById("noticeMsg")
                        if (xhr.responseText == "true") {
                            msg.innerHTML = "�ò��˿����ҽ��"
                            msg.style.color = "green"
                            document.getElementById("noSub").style.visibility = "visible"
                        } else {
                            msg.innerHTML = "�ò����Ѵ���ҽ�����ţ���ɾ�����ٽ�����Ӳ�����"
                            msg.style.color = "red"
                            document.getElementById("noSub").style.visibility = "hidden"
                        }
                    }
                }
            }
            xhr.open("GET", "${pageContext.request.contextPath}/yzqd/noRepeat?xm=" + xm)
            xhr.send()

            document.getElementById("cdd").innerHTML= "<a href=\"${pageContext.request.contextPath}/bingren/detail1?xm="+xm+"\" class=\"detailBtn\">�˽ⲡ������</a>"
        }

        function checkBr() {
            var obj = document.getElementById("brSelect");
            var br1 = ""
            for (i = 0; i < obj.length; i++) {
                if (obj[i].selected == true) {
                    br1 = obj[i].value
                }
            }
            var xm = encodeURI(br1)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var msg = document.getElementById("noticeMsg")
                        if (xhr.responseText == "true") {
                            msg.innerHTML = "�ò��˿����ҽ��"
                            msg.style.color = "green"
                            document.getElementById("noSub").style.visibility = "visible"
                        } else {
                            msg.innerHTML = "�ò����Ѵ���ҽ�����ţ���ɾ�����ٽ�����Ӳ�����"
                            msg.style.color = "red"
                            document.getElementById("noSub").style.visibility = "hidden"
                        }
                    }
                }
            }
            xhr.open("GET", "${pageContext.request.contextPath}/yzqd/noRepeat?xm=" + xm)
            xhr.send()

            document.getElementById("cdd").innerHTML= "<a href=\"${pageContext.request.contextPath}/bingren/detail1?xm="+xm+"\" class=\"detailBtn\">�˽ⲡ������</a>"



        }
    </script>

<body>

<form name="form" action="" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>ҽ���嵥���</TD>
                    <TD align=right colSpan=2>&nbsp;</TD>
                </TR>
                </TBODY>
            </TABLE>
        </DIV>
        <div class=tablezone>
            <div class=noticediv id=notice></div>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
                <TBODY>
                <%
                    java.util.Date now = new java.util.Date();
                    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmssssss");
                    //  System.out.print(formatter.format(now));
                    String ddid = "" + formatter.format(now);
                %>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input type="text" name="dh" placeholder="���뵥��" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=ddid%>"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td>
                        <select onchange="checkBr()" id="brSelect" name="br" class="selctBeau">
                            <%
                                sql = "select xm from bingren";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("xm")%>"><%=rs.getString("xm")%>
                            </option>
                            <% }%>

                        </select>
                        <i> <font color="red">*</font> </i>


                        <span id="cdd"><a href="" class="detailBtn">�˽ⲡ������</a></span>


                        <span id="noticeMsg"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>˵��:</td>
                    <td>
                        <textarea rows="5" cols="80" name="sm" placeholder="����˵��"></textarea>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�Ǽ���:</td>
                    <td><input readonly type="text" name="djr" placeholder="����Ǽ���" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=session.getAttribute("yhm")%>"/><i> <font
                            color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>ҽ��:</td>
                    <td>
                        <select name="ys" class="selctBeau">
                            <%
                                sql = "select * from yisheng ";

                                rs = db.query(sql);

                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("yhm")%>" <%
                                if (rs.getString("yhm").equals(yhm)) out.println("selected");%>><%=rs.getString("xm")%>
                            </option>
                            <% }%>
                        </select>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td>
                        <select name="bc" class="selctBeau">
                            <option value="">δѡ��</option>
                            <%
                                sql = "select * from bingchuang where zt='����'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("bc")%>"><%=rs.getString("bc")%>
                            </option>
                            <% }%>
                        </select>
                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>��Ժʱ��:</td>
                    <td><input readonly type="text" name="rysj" placeholder="������Ժʱ��" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=StaticMethod.getStringDate()%>"/><i>
                        <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>״̬:</td>
                    <td><input readonly type="text" name="zt" placeholder="����״̬" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="��ס"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                </TBODY>
            </TABLE>
        </div>
        <DIV class=adminsubmit><input id="noSub" type="button" value="����" name="B1" class="button"
                                      style="width:60px" onclick="checkDo()"/>
            &nbsp;&nbsp;
            <input type="reset" value="ȡ��" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}

<% db.close();%>
</body>
</html>

