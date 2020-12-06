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
        #selectBtn{
            margin-top: 2px;
            padding-left: 10px;
            padding-right: 10px;
            color: white;
            background-color: #33cccc;
            border:none;
        }
        #selectBtn:hover{
            background-color: #3fd5ff;
        }
    </style>
    <style>
        #spanFirst{
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;!important;
            background-color: #33cccc;
        }
        #spanFirst:hover{
            background-color: #3fd5ff;
        }
        #spanNext{
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;!important;
            background-color: #33cccc;
        }
        #spanNext:hover{
            background-color: #3fd5ff;
        }
        #spanPre{
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;!important;
            background-color: #33cccc;
        }
        #spanPre:hover{
            background-color: #3fd5ff;
        }
        #spanLast{
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px 10px 15px;
            color: white;!important;
            background-color: #33cccc;
        }
        #spanLast:hover{
            background-color: #3fd5ff;
        }
        .checkzt{
            border-radius: 15px;
            padding: 5px 10px 5px 10px;
            text-align: center;
            line-height: 20px;
            color: white;
        }
    </style>
    <script src="<%=request.getContextPath()%>/js/date.js"></script>
    <LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css"/>
    <title>请假管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>

</head>


<body>

<form name="form" action="<%=request.getContextPath()%>/qingjia/list" method="post">
    <table class="border" width="98%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
            <td height="565" align="center" valign="top" class="bg_low">
                <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" valign="middle" class="bgtop"><font color=""><b>请假列表</b></font>
                            标题<input type="text" name="bt" value="">


                            请假时间<input type="text" name="qjsj" value="" onclick="new Calendar().show(this);">

                            <input id="selectBtn" type="submit" value="查询"></td>
                    </tr>
                </table>
                <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">


                    <tr align="center" bgcolor="#ebf0f7">
                        <td>序号</td>

                        <td width="20%" height="25"><strong>标题</strong></td>


                        <td width="20%" height="25"><strong>申请提交时间</strong></td>

                        <td width="9%" height="25"><strong>开始时间</strong></td>

                        <td width="9%" height="25"><strong>结束时间</strong></td>

                        <td width="9%" height="25"><strong>状态</strong></td>

                        <td width="9%" height="25"><strong>申请用户</strong></td>

                        <th>操作</th>
                    </tr>
                    <TBODY id="table2">

                    <c:forEach items="${list}" var="mymap" varStatus="status">
                        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"'
                            onmouseout='this.style.background="#FFFFFF"'>
                            <td align="center" height="28">${status.count}</td>

                            <td align="center" height="28">${mymap.bt}</td>

                            <td align="center" height="28">${mymap.qjsj}</td>
                            <td align="center" height="28">${mymap.kssj}</td>
                            <td align="center" height="28">${mymap.jssj}</td>
                            <td align="center" height="28">
                                <c:choose>
                                    <c:when test="${mymap.zt eq '同意'}">
                                        <span class="checkzt" style="background-color: #00c400">${mymap.zt}</span>
                                    </c:when>
                                    <c:when test="${mymap.zt eq '不同意'}">
                                        <span class="checkzt" style="background-color: red">${mymap.zt}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="checkzt" style="background-color: #ffac1f">${mymap.zt}</span>
                                    </c:otherwise>
                                </c:choose>

                            </td>



                            <c:set var="cxxm" value="${mymap.yh}" scope="request"></c:set>
                            <%
                                String xm = request.getAttribute("cxxm")+"";
                                sql = "select xm from yisheng where yhm='"+xm+"'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %></td>
                            <% }%>
                            <%
                                String xm1 = request.getAttribute("cxxm")+"";
                                sql = "select xm from hushi where yhm='"+xm1+"'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %></td>
                            <% }%>
                            <%
                                String xm2 = request.getAttribute("cxxm")+"";
                                sql = "select xm from gly where yhm='"+xm2+"'";
                                rs = db.query(sql);
                                while (rs.next()) {
                            %>
                            <td align="center" height="28"><%=rs.getString("xm") %></td>
                            <% }%>




                            <td>
                                <a href="<%= request.getContextPath()%>/qingjia/detail?keyid=${mymap.qjid}">详情</a></td>


                        </tr>

                    </c:forEach>


                    </TBODY>
                </TABLE>

                <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span
                    id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
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
    var pageSize = 20;
    var page = 1;


    //下一页
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


    //上一页
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


    //第一页
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


    //最后一页
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


    //总共页数
    function pageCount() {
        var count = 0;
        if (numberRowsInTable % pageSize != 0) count = 1;
        return parseInt(numberRowsInTable / pageSize) + count;
    }


    //显示链接
    function preLink() {
        spanPre.innerHTML = "<a style='color: white;' href='javascript:pre();'>上一页</a>";
    }

    function preText() {
        spanPre.innerHTML = "上一页";
    }


    function nextLink() {
        spanNext.innerHTML = "<a style='color: white;' href='javascript:next();'>下一页</a>";
    }

    function nextText() {
        spanNext.innerHTML = "下一页";
    }


    function firstLink() {
        spanFirst.innerHTML = "<a style='color: white;' href='javascript:first();'>第一页</a>";
    }

    function firstText() {
        spanFirst.innerHTML = "第一页";
    }


    function lastLink() {
        spanLast.innerHTML = "<a style='color: white;' href='javascript:last();'>最后一页</a>";
    }

    function lastText() {
        spanLast.innerHTML = "最后一页";
    }


    //隐藏表格
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
