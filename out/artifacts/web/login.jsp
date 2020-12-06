<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
    request.setCharacterEncoding("gb2312");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style>
        .iptBtn {
            margin-top: 10px;
            font-size: 14px;
            width: 80px;
            height: 30px;
            background-color: #8ec9ff;
            color: white;
            border-radius: 10px;
            border: none;
        }

        .iptBtn:focus{
            outline: none;
            border: none;
        }
        .iptBtn:hover {
            background-color: #ffa905;
            color: white;
            border: none;
        }
    </style>
    <title>系统登录</title>

    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
        body {
            background: #fdffd5 url('1.jpg') no-repeat fixed center;
        }

        a {
            COLOR: #404040;
            TEXT-DECORATION: none;
        }

        a:hover {
            COLOR: #404040;
        }

        .m_ctr {
            margin: 0 auto;
            margin-top: 120px;
            width: 492px;
            height: auto;
            overflow: hidden;
        }

        .t_left {
            margin: 0 auto;
            float: left;
            width: 4px;
            height: 34px;
            background: url(images/m_tleft.png);
        }

        .t_mid {
            margin: 0 auto;
            float: left;
            width: 474px;
            height: 34px;
            background: url(images/m_tmid.gif) repeat-x;
            line-height: 34px;
            font-weight: bold;
            padding-left: 10px;
        }

        .t_right {
            margin: 0 auto;
            float: left;
            width: 4px;
            height: 34px;
            background: url(images/m_tright.png);
        }

        .m_mid {
            margin: 0 auto;
            float: left;
            width: 470px;
            height: 210px;
            border-left: 1px #ddd solid;
            border-right: 1px #ddd solid;
            padding: 10px;
            background: #fff;
        }

        .m_pic {
            margin: 20px 30px 20px 50px;
            float: left;
            width: 76px;
            height: 100px;
            background: url(images/login.gif);
            display: inline;
        }

        .m_txt {
            margin: 0 auto;
            margin-left: 20px;
            float: left;
            width: 280px;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            display: inline;
            padding-bottom: 12px;
        }
        .m_txt1 {
            border-left-width: 0px;
            border-right-width: 0px;
            border-top-width: 0px;
            border-bottom: 1px solid #999999;
            background-color: white;
        }
        .m_txt1:focus{
            border: none;
            border-bottom: 1px solid #ffc019;
            outline: none;
        }
        .m_foot {
            margin: 0 auto;
            float: left;
            width: 492px;
            height: 4px;
            background: url(images/m_foot.png);
            overflow: hidden;
        }

        .m_cp {
            margin: 0 auto;
            width: 100%;
            height: 30px;
            line-height: 30px;
            text-align: center;
        }

        .txt {
            VERTICAL-ALIGN: middle;
            MARGIN-TOP: 2px;
            WIDTH: 160px;
            height: 20px;
            display: inline;
        }

        .btn {
            PADDING-RIGHT: 5px;
            PADDING-LEFT: 5px;
            BORDER-LEFT-COLOR: #ddd;
            BACKGROUND: #ddd;
            BORDER-BOTTOM-COLOR: #666;
            PADDING-BOTTOM: 1px;
            MARGIN: 5px 0px;
            VERTICAL-ALIGN: middle;
            CURSOR: pointer;
            COLOR: #000;
            BORDER-TOP-COLOR: #ddd;
            PADDING-TOP: 4px;
            BORDER-RIGHT-COLOR: #666;
            display: inline;
        }

        INPUT {
            BORDER-RIGHT: #ccc 1px solid;
            PADDING: 2px;
            BORDER-TOP: #666 1px solid;
            BACKGROUND: #f7f7f7;
            BORDER-LEFT: #666 1px solid;
            COLOR: #333;
            BORDER-BOTTOM: #ccc 1px solid;
        }
        .selctBeau{
            width: 90px;
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
    </style>
</head>
<script language="javascript">
    function check() {
        if (form.yhm.value == "") {
            alert("请输入用户名");
            return;
        }
        if (form.mm.value == "") {
            alert("请输入密码");
            return;
        }
        form.action = "logincheck.jsp";
        form.submit();
    }
</script>
<body>
<form name="form" action="" method="post">
    <div class="m_ctr">
        <div class="t_left"></div>
        <div class="t_mid" style="text-align: center">欢迎使用校医院管理系统 登录首页</div>
        <div class="t_right"></div>
        <div class="m_mid">
            <div class="m_pic" style="margin-top: 40px"></div>
            <div style="width: 400px; height: 21px;">
                <span style="color: red;margin-left: 20px">${msg}</span>
            </div>
            <div class="m_txt" style="margin-top:10px;">用户名：&nbsp;
                <input class="m_txt1" placeholder="请输入用户名" type="text" name="yhm"/>
            </div>
            <div class="m_txt">密&nbsp;&nbsp;&nbsp;&nbsp;码：
                <input class="m_txt1" placeholder="请输入密码" type="password" name="mm"/>
            </div>
            <div class="m_txt">权&nbsp;&nbsp;&nbsp;&nbsp;限：
                <select name="qx" class="selctBeau">
                    <option value="医生">医生</option>
                    <option value="护士">护士</option>
                    <option value="管理员">管理员</option>
                </select>
            </div>

            <div class="m_txt" style="margin-left: 170px">

                &nbsp; <input type="button" name="Submit" value="登录" onclick=check() class="iptBtn"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input style="margin-left: 20px" type="reset" name="Submit2" value="清空" class="iptBtn"/>
            </div>
        </div>
        <div class="m_foot"></div>
    </div>
    </div>
</form>
</body>
</html>

