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
    <title>请假管理</title>
    <script src="<%=request.getContextPath()%>/js/date.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.bt.value == "") {
                alert("标题不能为空");
                return false;
            }

            if (form.nr.value == "") {
                alert("内容不能为空");
                return false;
            }

            if (form.qjsj.value == "") {
                alert("请假时间不能为空");
                return false;
            }

            if (form.kssj.value == "") {
                alert("开始时间不能为空");
                return false;
            }

            if (form.jssj.value == "") {
                alert("结束时间不能为空");
                return false;
            }

            if (form.zt.value == "") {
                alert("状态不能为空");
                return false;
            }

            if (form.yh.value == "") {
                alert("用户不能为空");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/qingjia/add";
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
                    <TD height=30>请假添加</TD>
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
                    <td align=right width=30% height=30>标题:</td>
                    <td><input type="text" name="bt" placeholder="输入标题" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>内容:</td>
                    <td>
                        <textarea rows="5" cols="80" name="nr" placeholder="输入内容"></textarea>
                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>申请提交时间:</td>
                    <td><input readonly type="text" name="qjsj" placeholder="输入请假时间" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=StaticMethod.getStringDate()%>"/><i>
                        <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>开始时间:</td>
                    <td><input type="text" name="kssj" placeholder="输入开始时间" onclick="new Calendar().show(this);"
                               class="input" style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font
                            color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>结束时间:</td>
                    <td><input type="text" name="jssj" placeholder="输入结束时间" onclick="new Calendar().show(this);"
                               class="input" style="FONT-SIZE: 12px; WIDTH: 300px" value=""/><i> <font
                            color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>状态:</td>
                    <td><input readonly type="text" name="zt" placeholder="输入状态" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="申请"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>申请用户:</td>
                    <td><input readonly type="text" name="yh" placeholder="输入用户" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="<%=session.getAttribute("yhm")%>"/><i> <font
                            color="red">*</font> </i></td>

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

