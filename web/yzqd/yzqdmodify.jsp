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


            form.action = "<%=request.getContextPath()%>/yzqd/update";
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
                    <TD height=30>医嘱清单修改</TD>
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
                    <td align=right width=30% height=30>单号:</td>
                    <td><input readonly type="text" name="dh" placeholder="输入单号" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${dh}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>病人:</td>
                    <td><input readonly type="text" name="br" placeholder="输入病人" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${br}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>说明:</td>
                    <td>
                        <textarea rows="5" cols="80" name="sm" placeholder="输入说明">${sm}</textarea>

                        <i> <font color="red">*</font> </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>登记人:</td>
                    <td><input readonly type="text" name="djr" placeholder="输入登记人" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${djr}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>医生:</td>
                    <td><input readonly type="text" name="ys" placeholder="输入医生" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${ys}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>病床:</td>
                    <td><input readonly type="text" name="bc" placeholder="输入病床" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${bc}"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>入院时间:</td>
                    <td><input readonly type="text" name="rysj" placeholder="输入入院时间" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="${rysj}"/><i> <font color="red">*</font>
                    </i></td>

                </tr>
                <tr>
                    <td align=right width=30% height=30>状态:</td>
                    <td><input readonly type="text" name="zt" placeholder="输入状态" class="input wszz"
                               style="FONT-SIZE: 12px; WIDTH: 300px" value="出院"/><i> <font color="red">*</font> </i>
                    </td>

                </tr>
                <input type="hidden" name="yzqdid" value="${yzqdid}">
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

