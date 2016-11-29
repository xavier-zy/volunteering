<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@page import="com.bbs.bean.TUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser tuser = (TUser)session.getAttribute("tuser");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>BBS</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.slideBox.js" type="text/javascript"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	
	<style type="text/css">

	.sp1{margin-left:20px;}
	.div1{margin-left:10px; margin-top:10px;}
	.message{
		margin-left:10px; 
		margin-top:5px;
		margin-bottom:5px;
	}
	.textShow{
		width:200px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.textShow2{
		width:400px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.textShow3{
		width:170px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.textBorder{border-bottom: 1px solid #E4EFFF}
	/* 超链接的样式 */
	a:link {text-decoration:none; color:black;}
	a:visited {text-decoration:none;}
	a:hover {text-decoration:none;color:orange;}
	a:active {text-decoration:underline;}
	
	.timeDecoration{
		position:absolute ; 
		right:10px;
		color:blue;
	}
	</style>
  </head>
  <body class="easyui-layout" style="width:1024px;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;background:#EEEEEE">
	<div data-options="region:'north'" style="height:67px;background:#0769AD">
	   <span><a href="index.jsp"><font size="16px" style="color:#FFFFFF">志愿者</font></a></span>	
	   <span style="margin-left:50px"><a href="index.jsp"><font style="font-size:20px;color:#FFFFFF">首页</font></a></span>
	   <span class="sp1"><a href="person.jsp"><font style="font-size:20px;color:#FFFFFF">个人中心</font></a></span>
	   <span class="sp1"><a href="project.jsp"><font style="font-size:20px;color:#FFFFFF">志愿活动管理</font></a></span>
	   <span class="sp1"><a href="release.jsp"><font style="font-size:20px;color:#FFFFFF">信息发布</font></a></span>
	   <span class="sp1"><a href="aboutus.jsp"><font style="font-size:20px;color:#FFFFFF">关于我们</font></a></span>
	</div>

	<div data-options="region:'center', border:false"  style="height:100%;";background:#EEEEEE">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',split:true,border:false" style="width:824px;">
			<div  align="center">
<form class="projectform" id="registerForm"  name="registerForm" method="post" >
用户名：<input type="text" name="userName" id="userName">
<br/>
昵称：<input type="text" name="nickname" id="nickname">
<br/>
密码：<input type="password" name="passWord" id="passWord">
<br/>
确认密码：<input type="password" name="passWord2" id="passWord2">
</form>
<button onclick="mysubmit()">注册</button>
</div>
			</div>			   
		</div>
	</div>
	<div data-options="region:'south',split:true,border:false" style="height:35px;text-align:center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
	</body> 
<script type="text/javascript">
function mysubmit(){
	var userName = $("#userName").val();
	var nickname = $("#nickname").val();
	var passWord = $("#passWord").val();
	var passWord2 = $("#passWord2").val();
	if(passWord==""||userName==""){
		alert("请输入用户名和密码。");
	}
	else{
	if(passWord==passWord2){
		document.registerForm.target="_self";
	    document.registerForm.action="<%=request.getContextPath()%>/servlet/RegisterServlet?userName="+userName+"&passWord="+passWord+"&nickname="+nickname;
	    document.registerForm.submit();
	}else{
		alert("两次输入密码不一致，请重新输入");
	}
	}
}
</script>
</body>
</html>