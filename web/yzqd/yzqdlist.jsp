<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String sql = "";
    ResultSet rs = null;
    DBO db = new DBO();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    </style>
    <style>
        .noDel:hover {
            cursor: not-allowed;
        }

    </style>

    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>ҽ���嵥����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

</head>


<body>

<form name="form" action="<%=request.getContextPath()%>/yzqd/listpage" method="post">
    <table class="border" width="98%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
            <td height="565" align="center" valign="top" class="bg_low">
                <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" valign="middle" class="bgtop"><font color=""><b>ҽ���嵥�б�</b></font>
                            ����<input type="text" name="dh" value="">


                            ����<input type="text" name="br" value="">

                            <input id="selectBtn" type="submit" value="��ѯ"></td>
                    </tr>
                </table>
                <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">


                    <tr align="center" bgcolor="#ebf0f7">
                        <td>���</td>

                        <td width="9%" height="25"><strong>����</strong></td>

                        <td width="9%" height="25"><strong>����</strong></td>


                        <td width="9%" height="25"><strong>�Ǽ���</strong></td>

                        <td width="9%" height="25"><strong>ҽ��</strong></td>

                        <td width="9%" height="25"><strong>����</strong></td>

                        <td width="9%" height="25"><strong>��Ժʱ��</strong></td>

                        <td width="9%" height="25"><strong>״̬</strong></td>

                        <th>����</th>
                    </tr>
                    <TBODY id="table2">

                    <c:forEach items="${list}" var="mymap" varStatus="status">
                        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"'
                            onmouseout='this.style.background="#FFFFFF"'>
                            <td align="center" height="28">${status.count}</td>

                            <td align="center" height="28">${mymap.dh}</td>
                            <td align="center" height="28">${mymap.br}</td>


                            <c:set var="cxdjr" value="${mymap.djr}" scope="request"></c:set>
                            <%
                                String djr = request.getAttribute("cxdjr") + "";
                                sql = "select xm from yisheng where yhm='" + djr + "'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %>
                            </td>
                            <% }%>
                            <%
                                String djr1 = request.getAttribute("cxdjr") + "";
                                sql = "select xm from hushi where yhm='" + djr1 + "'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %>
                            </td>
                            <% }%>
                            <%
                                String djr2 = request.getAttribute("cxdjr") + "";
                                sql = "select xm from gly where yhm='" + djr2 + "'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %>
                            </td>
                            <% }%>


                            <c:set var="cxys" value="${mymap.ys}" scope="request"></c:set>
                            <%
                                String ys = request.getAttribute("cxys") + "";
                                sql = "select xm from yisheng where yhm='" + ys + "'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %>
                            </td>
                            <% }%>
                            <%
                                String ys1 = request.getAttribute("cxys") + "";
                                sql = "select xm from hushi where yhm='" + ys1 + "'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %>
                            </td>
                            <% }%>
                            <%
                                String ys2 = request.getAttribute("cxys") + "";
                                sql = "select xm from gly where yhm='" + ys2 + "'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %>
                            </td>
                            <% }%>


                            <td align="center" height="28">${mymap.bc}</td>
                            <td align="center" height="28">${mymap.rysj}</td>
                            <td align="center" height="28">${mymap.zt}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${mymap.zt=='��ס'}">
                                        <del title="������δ��Ժ������ɾ����" style="color: #868686" class="noDel">ɾ��</del>
                                        |
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<%= request.getContextPath()%>/yzqd/del?keyid=${mymap.yzqdid}"
                                           onClick="javascript:if(confirm('�Ƿ�ɾ��')){return true;} else{return false;}">ɾ��</a>|
                                    </c:otherwise>
                                </c:choose>

                                <c:if test="${mymap.zt=='��ס'}">

                                    <a href="<%= request.getContextPath()%>/yzqd/modifypage?keyid=${mymap.yzqdid}">��Ժ�Ǽ�</a>|
                                </c:if>
                                <a href="<%= request.getContextPath()%>/yzqd/detail?keyid=${mymap.yzqdid}">����</a></td>


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
