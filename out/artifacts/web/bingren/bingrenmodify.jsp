<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String xb = (String) request.getAttribute("xb");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
        #noOperation:hover{
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


            form.action = "<%=request.getContextPath()%>/bingren/update";
            form.submit();
        }

        function checkXm(e) {
            var xm1 = e.value;
            var xm = encodeURI(xm1)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange=function () {
                if (xhr.readyState==4){
                    if (xhr.status==200){
                        var msg = document.getElementById("noticeMsg")
                        if (xhr.responseText == "true"){
                            msg.innerHTML = "����������"
                            msg.style.color="green"
                            document.getElementById("noSub").style.visibility="visible"
                        }else{
                            msg.innerHTML = "�������Ѵ��ڣ����������������Ϣ�������֣�"
                            msg.style.color="red"
                            document.getElementById("noSub").style.visibility="hidden"
                        }
                    }
                }
            }
            xhr.open("GET","${pageContext.request.contextPath}/bingren/noRepeatXm?xm="+xm)
            xhr.send()
        }

        window.onload=function () {
            var xy = '${xy}'
            var obj = document.getElementById("xySelect");
            for (var i = 0; i < obj.length; i++) {
                var text = obj[i].value
                if (text == xy) {
                    obj[i].selected = true
                }
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
                    <TD height=30>�����޸�</TD>
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
                    <td><input onkeyup="checkXm(this)" type="text" name="xm" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${xm}"/><i> <font color="red">*</font> </i>
                        <span id="noticeMsg"></span>
                    </td>


                <tr>
                    <td align=right width=30% height=30>ѧԺ:</td>
                    <td>
                        <select name="xy" id="xySelect" class="selctBeau">
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

                </tr>
                <tr>
                    <td align=right width=30% height=30>����:</td>
                    <td><input type="text" name="nl" placeholder="��������" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${nl}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�Ա�:</td>
                    <td>
                        <select name="xb" class="selctBeau1">
                            <option value="��" <%
                                if (xb.equals("��")) out.print("selected");
                            %>>��
                            </option>
                            <option value="Ů" <%
                                if (xb.equals("Ů")) out.print("selected");
                            %>>Ů
                            </option>
                        </select>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>˵��:</td>
                    <td>
                        <textarea rows="5" cols="80" name="sm" placeholder="����˵��">${sm}</textarea>
                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>�Ǽ�ʱ��:</td>
                    <td><input id="noOperation" readonly type="text" name="djsj" placeholder="����Ǽ�ʱ��" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${djsj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <input type="hidden" name="brid" value="${brid}">
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

