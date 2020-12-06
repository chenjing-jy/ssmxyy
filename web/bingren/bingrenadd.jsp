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
    <title>病人管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.xm.value == "") {
                alert("姓名不能为空");
                return false;
            }

            if (form.nl.value == "") {
                alert("年龄不能为空");
                return false;
            }

            if (form.xb.value == "") {
                alert("性别不能为空");
                return false;
            }

            if (form.sm.value == "") {
                alert("说明不能为空");
                return false;
            }

            if (form.djsj.value == "") {
                alert("登记时间不能为空");
                return false;
            }

            if (form.xy.value == "") {
                alert("学院不能为空");
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
                    <TD height=30>病人添加</TD>
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
                    <td align=right width=30% height=30>姓名:</td>
                    <td><input type="text" name="xm" placeholder="输入姓名" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>学院:</td>
                    <td>
                        <select name="xy" class="selctBeau">
                            <option value="数学与计算机科学学院">数学与计算机科学学院</option>
                            <option value="法学院">法学院</option>
                            <option value="管理学院">管理学院</option>
                            <option value="新闻传播学院">新闻传播学院</option>
                            <option value="土木工程学院">土木工程学院</option>
                            <option value="体育学院">体育学院</option>
                            <option value="外国语学院">外国语学院</option>
                            <option value="化工学院">化工学院</option>
                            <option value="经济学院">经济学院</option>
                            <option value="生命科学与工程学院">生命科学与工程学院</option>
                            <option value="医学部">医学部</option>
                            <option value="音乐学院">音乐学院</option>
                        </select>


                        <i> <font color="red">*</font> </i></td>
                </tr>
                <tr>
                    <td align=right width=30% height=30>年龄:</td>
                    <td><input type="text" name="nl" placeholder="输入年龄" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>性别:</td>
                    <td>
                        <select name="xb" class="selctBeau1">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>


                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td>
                        <textarea rows="5" cols="80" name="sm" placeholder="输入说明"></textarea>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>登记时间:</td>
                    <td><input readonly type="text" name="djsj" placeholder="输入登记时间" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=StaticMethod.getStringDate()%>"/><i>
                        <font color="red">*</font> </i></td>

                </tr>
                </TBODY>
            </TABLE>
        </div>
        <DIV class=adminsubmit><input type="button" value="保存" name="B1" class="button" style="width:60px"
                                      onclick="checkDo()"/>
            &nbsp;&nbsp;
            <input type="reset" value="取消" style="width:60px" name="chanel" class="button"/>
        </div>
    </div>
</form>


${msg}


</body>
</html>

