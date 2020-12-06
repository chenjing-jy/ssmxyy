<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <style>
        #selectBtn {
            margin-top: 2px;
            padding-left: 10px;
            padding-right: 10px;
            color: white;
            background-color: #33cccc;
            border: none;
        }

        #selectBtn:hover {
            background-color: #3fd5ff;
        }
    </style>
    <style>
        .noOperation:hover{
            cursor: not-allowed;

        }
        #spanFirst {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;
        !important;
            background-color: #33cccc;
        }

        #spanFirst:hover {
            background-color: #3fd5ff;
        }

        #spanNext {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;
        !important;
            background-color: #33cccc;
        }

        #spanNext:hover {
            background-color: #3fd5ff;
        }

        #spanPre {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;
        !important;
            background-color: #33cccc;
        }

        #spanPre:hover {
            background-color: #3fd5ff;
        }

        #spanLast {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;
        !important;
            background-color: #33cccc;
        }

        #spanLast:hover {
            background-color: #3fd5ff;
        }

        .bedOut {
            width: 1063px;
            height: 332px;
            border: 1px solid #33cccc;
        }

        .middleTotle {
            padding: 8px 1px 8px 1px;
            float: left;
            width: 263px;
            height: 148px;
            text-align: center;
            vertical-align: middle;
        }

        .bedMiddle1 {
            text-align: center;
            line-height: 35px;
            margin: 0 auto;
            width: 230px;
            height: 35px;
            border: 1px solid #33cccc;
            display: inline-block;
        }

        .bingfang {
            line-height: 35px;
            font-size: 16px;
            font-weight: bold;
            color: #707070;
            letter-spacing: 10px;
        }

        .bedMiddle {
            width: 230px;
            height: 113px;
            border: 1px solid #33cccc;
            display: inline-block;
        }

        .bedInside {
            float: left;
            margin-left: 2px;
            margin-top: 2px;
            padding: 1px 1px 1px 1px;
            width: 70px;
            height: 105px;
            border: 1px solid #33cccc;
            text-align: center;
            line-height: 113px;
        }

        .bingchuang {
            line-height: 113px;
        }

        .bedInside1 {
            float: left;
            width: 86.3px;
            height: 113px;
        }
    </style>
    <link rel="stylesheet" href="../font-awesome-4.7.0/css/font-awesome.min.css"/>
    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>��������</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

</head>


<body>

<form name="form" action="<%=request.getContextPath()%>/bingchuang/listpage" method="post">
    <table class="border" width="98%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
            <td height="565" align="center" valign="top" class="bg_low">
                <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" valign="middle" class="bgtop"><font color=""><b>�����б�</b></font>
                            ����<input type="text" name="bc" value="">


                            ״̬<input type="text" name="zt" value="">
                            ˵��<input type="text" name="sm" value="">

                            <input id="selectBtn" type="submit" value="��ѯ"></td>
                    </tr>

                    <c:if test="${fn:length(list)==24}">
                        <div class="bedOut">

                            <c:forEach begin="2" end="24" step="3" varStatus="Status">
                                <div class="middleTotle">
                                    <div class="bedMiddle1">
                                    <span class="bingfang"><fmt:formatNumber value="${(Status.index+1)/3}"
                                                                             minFractionDigits="0"/>�Ų���</span>
                                    </div>
                                    <div class="bedMiddle">
                                        <c:forEach begin="${Status.index-2}" end="${Status.index}" items="${list}"
                                                   var="mymap" varStatus="Status1">
                                            <div class="bedInside">
                                                <c:choose>
                                                    <c:when test="${mymap.zt eq '����'}">
                                                        <a class="bingchuang" title="�ô�λ�ѱ�ռ��"
                                                           style="color: red;font-size: 30px"
                                                           href="<%= request.getContextPath()%>/bingchuang/detail?keyid=${mymap.bcid}">${mymap.bc}</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="bingchuang" title="�ô�λ����"
                                                           style="text-decoration:none; color: green;font-size: 30px"
                                                           href="<%= request.getContextPath()%>/bingchuang/detail?keyid=${mymap.bcid}">${mymap.bc}</a>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </c:if>

                </table>
                <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">


                    <tr align="center" bgcolor="#ebf0f7">
                        <td>���</td>

                        <td width="9%" height="25"><strong>����</strong></td>

                        <td width="9%" height="25"><strong>״̬</strong></td>

                        <td width="9%" height="25"><strong>˵��</strong></td>

                        <th>����</th>
                    </tr>
                    <TBODY id="table2">

                    <c:forEach items="${list}" var="mymap" varStatus="status">
                        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"'
                            onmouseout='this.style.background="#FFFFFF"'>
                            <td align="center" height="28">${status.count}</td>

                            <td align="center" height="28">${mymap.bc}</td>
                            <td align="center" height="28">${mymap.zt}</td>
                            <td align="center" height="28">${mymap.sm}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${mymap.zt eq '����'}">
                                        <del style="color: #868686" title="�ò�������ʹ�ã�����ɾ��" class="noOperation">ɾ��</del>|
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<%= request.getContextPath()%>/bingchuang/del?keyid=${mymap.bcid}"
                                           onClick="javascript:if(confirm('�Ƿ�ɾ��')){return true;} else{return false;}">ɾ��</a>|
                                    </c:otherwise>
                                </c:choose>
                                <a href="<%= request.getContextPath()%>/bingchuang/modifypage?keyid=${mymap.bcid}">�޸�</a>|<a
                                        href="<%= request.getContextPath()%>/bingchuang/detail?keyid=${mymap.bcid}">����</a>
                            </td>


                        </tr>

                    </c:forEach>


                    </TBODY>
                </TABLE>

                <span id="spanFirst">��һҳ</span> <span id="spanPre">��һҳ</span> <span id="spanNext">��һҳ</span> <span
                    id="spanLast">���һҳ</span> ��<span id="spanPageNum"></span>ҳ/��<span id="spanTotalPage"></span>ҳ
            </td>
        </tr>
    </table>
    </DIV>


    </div>
</form>
<script>
    var theTable = document.getElementById("table2");
    var totalPage = document.getElementById("spanTotalPage");
    var pageNum = document.getElementById("spanPageNum");


    var spanPre = document.getElementById("spanPre");
    var spanNext = document.getElementById("spanNext");
    var spanFirst = document.getElementById("spanFirst");
    var spanLast = document.getElementById("spanLast");


    var numberRowsInTable = theTable.rows.length;
    var pageSize = 10;
    var page = 1;


    //��һҳ
    function next() {


        hideTable();


        currentRow = pageSize * page;
        maxRow = currentRow + pageSize;
        if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
        for (var i = currentRow; i < maxRow; i++) {
            theTable.rows[i].style.display = '';
        }
        page++;


        if (maxRow == numberRowsInTable) {
            nextText();
            lastText();
        }
        showPage();
        preLink();
        firstLink();
    }


    //��һҳ
    function pre() {


        hideTable();


        page--;


        currentRow = pageSize * page;
        maxRow = currentRow - pageSize;
        if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
        for (var i = maxRow; i < currentRow; i++) {
            theTable.rows[i].style.display = '';
        }


        if (maxRow == 0) {
            preText();
            firstText();
        }
        showPage();
        nextLink();
        lastLink();
    }


    //��һҳ
    function first() {
        hideTable();
        page = 1;
        for (var i = 0; i < pageSize; i++) {
            theTable.rows[i].style.display = '';
        }
        showPage();


        preText();
        nextLink();
        lastLink();
    }


    //���һҳ
    function last() {
        hideTable();
        page = pageCount();
        currentRow = pageSize * (page - 1);
        for (var i = currentRow; i < numberRowsInTable; i++) {
            theTable.rows[i].style.display = '';
        }
        showPage();


        preLink();
        nextText();
        firstLink();
    }


    function hideTable() {
        for (var i = 0; i < numberRowsInTable; i++) {
            theTable.rows[i].style.display = 'none';
        }
    }


    function showPage() {
        pageNum.innerHTML = page;
    }


    //�ܹ�ҳ��
    function pageCount() {
        var count = 0;
        if (numberRowsInTable % pageSize != 0) count = 1;
        return parseInt(numberRowsInTable / pageSize) + count;
    }


    //��ʾ����
    function preLink() {
        spanPre.innerHTML = "<a style='color: white;' href='javascript:pre();'>��һҳ</a>";
    }

    function preText() {
        spanPre.innerHTML = "��һҳ";
    }


    function nextLink() {
        spanNext.innerHTML = "<a style='color: white;' href='javascript:next();'>��һҳ</a>";
    }

    function nextText() {
        spanNext.innerHTML = "��һҳ";
    }


    function firstLink() {
        spanFirst.innerHTML = "<a style='color: white;' href='javascript:first();'>��һҳ</a>";
    }

    function firstText() {
        spanFirst.innerHTML = "��һҳ";
    }


    function lastLink() {
        spanLast.innerHTML = "<a style='color: white;' href='javascript:last();'>���һҳ</a>";
    }

    function lastText() {
        spanLast.innerHTML = "���һҳ";
    }


    //���ر��
    function hide() {
        for (var i = pageSize; i < numberRowsInTable; i++) {
            theTable.rows[i].style.display = 'none';
        }


        totalPage.innerHTML = pageCount();
        pageNum.innerHTML = '1';


        nextLink();
        lastLink();
    }


    hide();
</script>

${msg}


</body>

</html>
