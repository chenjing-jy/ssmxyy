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
        #zzdzz1,#zzdzz2:hover{
            cursor:not-allowed;
        }
        .wszz:hover{
            cursor: not-allowed;
        }
    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>清单明细管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <script language="javascript">
        function checkDo() {
            if (form.qd.value == "") {
                alert("清单不能为空");
                return false;
            }

            if (form.lx.value == "") {
                alert("类型不能为空");
                return false;
            }

            if (form.sm.value == "") {
                alert("说明不能为空");
                return false;
            }

            if (form.sl.value == "") {
                alert("数量不能为空");
                return false;
            }

            if (form.yf.value == "") {
                alert("用法不能为空");
                return false;
            }

            if (form.djsj.value == "") {
                alert("登记时间不能为空");
                return false;
            }


            form.action = "<%=request.getContextPath()%>/qdmx/update";
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
                    <TD height=30>清单明细修改</TD>
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
                    <td align=right width=30% height=30>清单:</td>
                    <td><input title="此部分内容不可修改，若需要更新请删除重新添加明细信息" readonly type="text" name="qd" placeholder="输入清单" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${qd}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>类型:</td>
                    <td><input title="此部分内容不可修改，若需要更新请删除重新添加明细信息" readonly type="text" name="lx" placeholder="输入类型" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${lx}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td><input title="此部分内容不可修改，若需要更新请删除重新添加明细信息" readonly id="zzdzz1" type="text" name="sm" placeholder="输入说明" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${sm}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>数量:</td>
                    <td><input title="此部分内容不可修改，若需要更新请删除重新添加明细信息" readonly id="zzdzz2" type="text" name="sl" placeholder="输入数量" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${sl}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>用法:</td>
                    <td><input type="text" name="yf" placeholder="输入用法" class="input"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${yf}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>登记时间:</td>
                    <td><input readonly type="text" name="djsj" placeholder="输入登记时间" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${djsj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <input type="hidden" name="qdmxid" value="${qdmxid}">
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

