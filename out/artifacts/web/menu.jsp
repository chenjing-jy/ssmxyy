<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*" %>
<%
    request.setCharacterEncoding("gb2312");
    String qx = "";
    if (session.getAttribute("qx") != null) {
        qx = (String) session.getAttribute("qx");
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <link href="css/css_menu.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <title>无标题文档</title>

    <script language="javascript">


        function getObject(objectId) {
            if (document.getElementById && document.getElementById(objectId)) {
                // W3C DOM
                return document.getElementById(objectId);
            } else if (document.all && document.all(objectId)) {
                // MSIE 4 DOM
                return document.all(objectId);
            } else if (document.layers && document.layers[objectId]) {
                // NN 4 DOM.. note: this won't find nested layers
                return document.layers[objectId];
            } else {
                return false;
            }
        }

        function showHide(objname) {
            var obj = getObject(objname);
            if (obj.style.display == "none") {
                obj.style.display = "block";
            } else {
                obj.style.display = "none";
            }
        }
    </script>
</head>
<base target="main"/>
<body>
<div class="infobox">


</div>
<div class="menu">


    <%
        if (qx.equals("管理员")) {
    %>
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items1');" target="_self">管理员管理</a></dt>
        <dd id="items1" style="display:none;">
            <ul>

                <c:if test="${yhm  eq 'admin'}">
                    <li><a href='gly/addpage' target='main'>添加管理员</a></li>
                </c:if>
                <li><a href='gly/listpage' target='main'>管理员列表</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items2');" target="_self">医生管理</a></dt>
        <dd id="items2" style="display:none;">
            <ul>

                <li><a href='yisheng/addpage' target='main'>添加医生</a></li>
                <li><a href='yisheng/listpage' target='main'>医生列表</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items3');" target="_self">护士管理</a></dt>
        <dd id="items3" style="display:none;">
            <ul>

                <li><a href='hushi/addpage' target='main'>添加护士</a></li>
                <li><a href='hushi/listpage' target='main'>护士列表</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <% }%>
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items4');" target="_self">公告管理</a></dt>
        <dd id="items4" style="display:none;">
            <ul>

                <%
                    if (qx.equals("管理员")) {
                %>
                <li><a href='gonggao/addpage' target='main'>添加公告</a></li>
                <li><a href='gonggao/listpage' target='main'>公告列表</a></li>
                <% }%>
                <li><a href='gonggao/list' target='main'>公告浏览</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items5');" target="_self">新闻管理</a></dt>
        <dd id="items5" style="display:none;">
            <ul>
                <%
                    if (qx.equals("管理员")) {
                %>
                <li><a href='xinwen/addpage' target='main'>添加新闻</a></li>
                <li><a href='xinwen/listpage' target='main'>新闻列表</a></li>
                <% }%>
                <li><a href='xinwen/list' target='main'>新闻浏览</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items6');" target="_self">病人管理</a></dt>
        <dd id="items6" style="display:none;">
            <ul>
                <%
                    if (qx.equals("护士")) {
                %>
                <li><a href='bingren/addpage' target='main'>添加病人</a></li>
                <% }%>
                <li><a href='bingren/listpage' target='main'>病人列表</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items7');" target="_self">请假管理</a></dt>
        <dd id="items7" style="display:none;">
            <ul>
                <%
                    if (!qx.equals("管理员")) {
                %>
                <li><a href='qingjia/addpage' target='main'>添加请假</a></li>
                <li><a href='qingjia/list' target='main'>我的请假</a></li>
                <% } else {%>
                <li><a href='qingjia/listpage' target='main'>请假列表</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items8');" target="_self">物品管理</a></dt>
        <dd id="items8" style="display:none;">
            <ul>
                <%
                    if (qx.equals("管理员")) {
                %>
                <li><a href='wupin/addpage' target='main'>添加物品</a></li>
                <% }%>
                <li><a href='wupin/listpage' target='main'>物品列表</a></li>
                <%
                    if (qx.equals("管理员")) {
                %>
                <li><a href='wupin/ruku.jsp' target='main'>入库物品</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items9');" target="_self">病床管理</a></dt>
        <dd id="items9" style="display:none;">
            <ul>
                <%
                    if (qx.equals("管理员")) {
                %>
                <li><a href='bingchuang/addpage' target='main'>添加病床</a></li>
                <% }%>
                <li><a href='bingchuang/listpage' target='main'>病床列表</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items10');" target="_self">工作时间安排管理</a></dt>
        <dd id="items10" style="display:none;">
            <ul>
                <%
                    if (qx.equals("管理员")) {
                %>
                <li><a href='gzsjap/add.jsp' target='main'>添加工作时间安排</a></li>
                <li><a href='gzsjap/listpage' target='main'>工作时间安排列表</a></li>
                <% } else {%>
                <li><a href='gzsjap/list' target='main'>我的工作安排</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items11');" target="_self">医嘱清单管理</a></dt>
        <dd id="items11" style="display:none;">
            <ul>
                <%
                    if (qx.equals("医生")) {
                %>
                <li><a href='yzqd/addpage' target='main'>添加医嘱清单</a></li>
                <li><a href='yzqd/listpage' target='main'>医嘱清单列表</a></li>
                <% } else {%>
                <li><a href='yzqd/listpage' target='main'>医嘱清单列表</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items12');" target="_self">清单明细管理</a></dt>
        <dd id="items12" style="display:none;">
            <ul>
                <%
                    if (qx.equals("医生")) {
                %>
                <li><a href='qdmx/add.jsp' target='main'>添加清单明细</a></li>
                <li><a href='qdmx/listpage' target='main'>清单明细列表</a></li>
                <% } else {%>
                <li><a href='qdmx/listpage' target='main'>清单明细列表</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items13');" target="_self">个人信息</a></dt>
        <dd id="items13" style="display:none;">
            <ul>
                <%
                    if (qx.equals("管理员")) {
                %>
                <li><a href='gly/modpage' target='main'>个人信息</a></li>
                <% }%>
                <%
                    if (qx.equals("护士")) {
                %>
                <li><a href='hushi/modpage' target='main'>个人信息</a></li>
                <% }%>
                <%
                    if (qx.equals("医生")) {
                %>
                <li><a href='yisheng/modpage' target='main'>个人信息</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

</div>
</body>
</html>
