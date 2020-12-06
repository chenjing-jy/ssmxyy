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
    <title>�ޱ����ĵ�</title>

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
        if (qx.equals("����Ա")) {
    %>
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items1');" target="_self">����Ա����</a></dt>
        <dd id="items1" style="display:none;">
            <ul>

                <c:if test="${yhm  eq 'admin'}">
                    <li><a href='gly/addpage' target='main'>��ӹ���Ա</a></li>
                </c:if>
                <li><a href='gly/listpage' target='main'>����Ա�б�</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items2');" target="_self">ҽ������</a></dt>
        <dd id="items2" style="display:none;">
            <ul>

                <li><a href='yisheng/addpage' target='main'>���ҽ��</a></li>
                <li><a href='yisheng/listpage' target='main'>ҽ���б�</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items3');" target="_self">��ʿ����</a></dt>
        <dd id="items3" style="display:none;">
            <ul>

                <li><a href='hushi/addpage' target='main'>��ӻ�ʿ</a></li>
                <li><a href='hushi/listpage' target='main'>��ʿ�б�</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <% }%>
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items4');" target="_self">�������</a></dt>
        <dd id="items4" style="display:none;">
            <ul>

                <%
                    if (qx.equals("����Ա")) {
                %>
                <li><a href='gonggao/addpage' target='main'>��ӹ���</a></li>
                <li><a href='gonggao/listpage' target='main'>�����б�</a></li>
                <% }%>
                <li><a href='gonggao/list' target='main'>�������</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items5');" target="_self">���Ź���</a></dt>
        <dd id="items5" style="display:none;">
            <ul>
                <%
                    if (qx.equals("����Ա")) {
                %>
                <li><a href='xinwen/addpage' target='main'>�������</a></li>
                <li><a href='xinwen/listpage' target='main'>�����б�</a></li>
                <% }%>
                <li><a href='xinwen/list' target='main'>�������</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items6');" target="_self">���˹���</a></dt>
        <dd id="items6" style="display:none;">
            <ul>
                <%
                    if (qx.equals("��ʿ")) {
                %>
                <li><a href='bingren/addpage' target='main'>��Ӳ���</a></li>
                <% }%>
                <li><a href='bingren/listpage' target='main'>�����б�</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items7');" target="_self">��ٹ���</a></dt>
        <dd id="items7" style="display:none;">
            <ul>
                <%
                    if (!qx.equals("����Ա")) {
                %>
                <li><a href='qingjia/addpage' target='main'>������</a></li>
                <li><a href='qingjia/list' target='main'>�ҵ����</a></li>
                <% } else {%>
                <li><a href='qingjia/listpage' target='main'>����б�</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items8');" target="_self">��Ʒ����</a></dt>
        <dd id="items8" style="display:none;">
            <ul>
                <%
                    if (qx.equals("����Ա")) {
                %>
                <li><a href='wupin/addpage' target='main'>�����Ʒ</a></li>
                <% }%>
                <li><a href='wupin/listpage' target='main'>��Ʒ�б�</a></li>
                <%
                    if (qx.equals("����Ա")) {
                %>
                <li><a href='wupin/ruku.jsp' target='main'>�����Ʒ</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items9');" target="_self">��������</a></dt>
        <dd id="items9" style="display:none;">
            <ul>
                <%
                    if (qx.equals("����Ա")) {
                %>
                <li><a href='bingchuang/addpage' target='main'>��Ӳ���</a></li>
                <% }%>
                <li><a href='bingchuang/listpage' target='main'>�����б�</a></li>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items10');" target="_self">����ʱ�䰲�Ź���</a></dt>
        <dd id="items10" style="display:none;">
            <ul>
                <%
                    if (qx.equals("����Ա")) {
                %>
                <li><a href='gzsjap/add.jsp' target='main'>��ӹ���ʱ�䰲��</a></li>
                <li><a href='gzsjap/listpage' target='main'>����ʱ�䰲���б�</a></li>
                <% } else {%>
                <li><a href='gzsjap/list' target='main'>�ҵĹ�������</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items11');" target="_self">ҽ���嵥����</a></dt>
        <dd id="items11" style="display:none;">
            <ul>
                <%
                    if (qx.equals("ҽ��")) {
                %>
                <li><a href='yzqd/addpage' target='main'>���ҽ���嵥</a></li>
                <li><a href='yzqd/listpage' target='main'>ҽ���嵥�б�</a></li>
                <% } else {%>
                <li><a href='yzqd/listpage' target='main'>ҽ���嵥�б�</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->
    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items12');" target="_self">�嵥��ϸ����</a></dt>
        <dd id="items12" style="display:none;">
            <ul>
                <%
                    if (qx.equals("ҽ��")) {
                %>
                <li><a href='qdmx/add.jsp' target='main'>����嵥��ϸ</a></li>
                <li><a href='qdmx/listpage' target='main'>�嵥��ϸ�б�</a></li>
                <% } else {%>
                <li><a href='qdmx/listpage' target='main'>�嵥��ϸ�б�</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

    <!-- Item 1 Strat -->
    <dl>

        <dt><a href="###" onclick="showHide('items13');" target="_self">������Ϣ</a></dt>
        <dd id="items13" style="display:none;">
            <ul>
                <%
                    if (qx.equals("����Ա")) {
                %>
                <li><a href='gly/modpage' target='main'>������Ϣ</a></li>
                <% }%>
                <%
                    if (qx.equals("��ʿ")) {
                %>
                <li><a href='hushi/modpage' target='main'>������Ϣ</a></li>
                <% }%>
                <%
                    if (qx.equals("ҽ��")) {
                %>
                <li><a href='yisheng/modpage' target='main'>������Ϣ</a></li>
                <% }%>
            </ul>
        </dd>
    </dl>
    <!-- Item 1 End -->

</div>
</body>
</html>
