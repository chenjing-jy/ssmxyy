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
    <title>医嘱清单管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.dh.value == "") {
                alert("单号不能为空");
                return false;
            }

            if (form.br.value == "") {
                alert("病人不能为空");
                return false;
            }

            if (form.sm.value == "") {
                alert("说明不能为空");
                return false;
            }

            if (form.djr.value == "") {
                alert("登记人不能为空");
                return false;
            }

            if (form.ys.value == "") {
                alert("医生不能为空");
                return false;
            }

            if (form.bc.value == "") {
                alert("病床不能为空");
                return false;
            }

            if (form.rysj.value == "") {
                alert("入院时间不能为空");
                return false;
            }

            if (form.zt.value == "") {
                alert("状态不能为空");
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
                            msg.innerHTML = "该病人可添加医嘱"
                            msg.style.color = "green"
                            document.getElementById("noSub").style.visibility = "visible"
                        } else {
                            msg.innerHTML = "该病人已存在医嘱单号，请删除后再进行添加操作！"
                            msg.style.color = "red"
                            document.getElementById("noSub").style.visibility = "hidden"
                        }
                    }
                }
            }
            xhr.open("GET", "${pageContext.request.contextPath}/yzqd/noRepeat?xm=" + xm)
            xhr.send()

            document.getElementById("cdd").innerHTML= "<a href=\"${pageContext.request.contextPath}/bingren/detail1?xm="+xm+"\" class=\"detailBtn\">了解病人详情</a>"
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
                            msg.innerHTML = "该病人可添加医嘱"
                            msg.style.color = "green"
                            document.getElementById("noSub").style.visibility = "visible"
                        } else {
                            msg.innerHTML = "该病人已存在医嘱单号，请删除后再进行添加操作！"
                            msg.style.color = "red"
                            document.getElementById("noSub").style.visibility = "hidden"
                        }
                    }
                }
            }
            xhr.open("GET", "${pageContext.request.contextPath}/yzqd/noRepeat?xm=" + xm)
            xhr.send()

            document.getElementById("cdd").innerHTML= "<a href=\"${pageContext.request.contextPath}/bingren/detail1?xm="+xm+"\" class=\"detailBtn\">了解病人详情</a>"



        }
    </script>

<body>

<form name="form" action="" method="post">
    <div class=formzone>
        <DIV class=searchzone>

            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=30>医嘱清单添加</TD>
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
                    <td align=right width=30% height=30>单号:</td>
                    <td><input type="text" name="dh" placeholder="输入单号" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=ddid%>"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>病人:</td>
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


                        <span id="cdd"><a href="" class="detailBtn">了解病人详情</a></span>


                        <span id="noticeMsg"></span>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td>
                        <textarea rows="5" cols="80" name="sm" placeholder="输入说明"></textarea>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>登记人:</td>
                    <td><input readonly type="text" name="djr" placeholder="输入登记人" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=session.getAttribute("yhm")%>"/><i> <font
                            color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>医生:</td>
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
                    <td align=right width=30% height=30>病床:</td>
                    <td>
                        <select name="bc" class="selctBeau">
                            <option value="">未选择</option>
                            <%
                                sql = "select * from bingchuang where zt='正常'";
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
                    <td align=right width=30% height=30>入院时间:</td>
                    <td><input readonly type="text" name="rysj" placeholder="输入入院时间" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=StaticMethod.getStringDate()%>"/><i>
                        <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>状态:</td>
                    <td><input readonly type="text" name="zt" placeholder="输入状态" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="入住"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                </TBODY>
            </TABLE>
        </div>
        <DIV class=adminsubmit><input id="noSub" type="button" value="保存" name="B1" class="button"
                                      style="width:60px" onclick="checkDo()"/>
            &nbsp;&nbsp;
            <input type="reset" value="取消" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}

<% db.close();%>
</body>
</html>

