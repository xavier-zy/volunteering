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
<%if(tuser == null){%>
  <script type="text/javascript">
  alert("您还未登陆，请登陆。");
  window.location.href="index.jsp";
  </script>
<%}else{ %>			
  <body class="easyui-layout" style="width:1024px;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;background:#EEEEEE">
  <sql:setDataSource var="personDB" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://rdsjsuppddutzqvqdj9hi.mysql.rds.aliyuncs.com:3306/r7mvz60k1b38x4b1?user=r7mvz60k1b38x4b1&password=liyibu&useUnicode=true&characterEncoding=UTF8"/>
  <sql:query dataSource="${personDB}" var="result">select * from tuser,tuserinfo where tuser.id=tuserinfo.id and tuser.userName="<%=tuser.getUserName()%>";</sql:query>

  <c:forEach var="row" items="${result.rows}">
	<div data-options="region:'north'" style="height:67px;background:#0769AD">
	   <span><a href="index.jsp"><font size="16px" style="color:#FFFFFF">志愿者</font></a></span>	
	   <span style="margin-left:50px"><a href="index.jsp"><font style="font-size:20px;color:#FFFFFF">首页</font></a></span>
	   <span class="sp1"><a href="person.jsp"><font style="font-size:20px;color:#FFFFFF">个人中心</font></a></span>
	   <span class="sp1"><a href="project.jsp"><font style="font-size:20px;color:#FFFFFF">志愿活动管理</font></a></span>
	   <span class="sp1"><a href="release.jsp"><font style="font-size:20px;color:#FFFFFF">信息发布</font></a></span>
	   <span class="sp1"><a href="aboutus.jsp"><font style="font-size:20px;color:#FFFFFF">关于我们</font></a></span>
	   <%if(tuser == null){%>
		<span ><a class="login2" href="index.jsp">登陆</a></span>
	   <%}else{ %>
	   <span ><a class="login2" href="<%=request.getContextPath()%>/servlet/LoginOutServlet">退出登陆</a></span>
	   <span class="login"><%= tuser.getNickname()%></span>
	   
	   <%} %>
	</div>

	<div data-options="region:'center', border:false"  style="height:100%;";background:#EEEEEE">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',split:true,border:false,title:'个人中心'" style="width:200px">
			<div style="margin:20px 0 10px 23px;"><img src="images/1.png" alt="11" height='150px' width='150px'></div>	
			<div align="center">昵称：<c:out value="${row.nickname}"/></div>
			<div align="center">服务时长：<c:out value="${row.time}"/></div>
			</div>
			<div data-options="region:'center',split:true,border:false" style="width:824px;">
				<div class="easyui-tabs" style="width:824px;height:700px">
		            <div title="个人资料" style="padding:10px">
		            	<div class="personmessage">用户名：&nbsp;&nbsp;&nbsp;<c:out value="${row.userName}"/></div>
		            	<div class="personmessage">昵称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${row.nickname}"/></div>
		            	<div class="personmessage">头像：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/1.png" alt="11" height='150px' width='150px' align="top"></div>
		            	<div class="personmessage">手机号码：<c:out value="${row.phone}"/></div>
		            	<div class="personmessage">e-mail：<c:out value="${row.email}"/></div>	
                        <div class="personmessage">性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${row.sex}"/></div>
                        <div class="personmessage">年龄：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${row.age}"/></div>
                        <div class="personmessage">地址：<c:out value="${row.address}"/></div>
                        <div class="personmessage">个性签名：<c:out value="${row.signature}"/></div>
		            </div>
		            <div title="我的活动" style="padding:10px">
			            <div class="personmessage">已经报名的活动
			            <div class="div1">1.敬老院服务</div>
			            <div class="div1">2.小学课堂服务</div>
			            <div class="div1">3.环境保护服务</div>
			            </div>
			            <div class="personmessage">正在进行的活动
			            <div class="div1">1.敬老院服务</div>
			            <div class="div1">2.小学课堂服务</div>
			            <div class="div1">3.环境保护服务</div>
			            </div>
			            <div class="personmessage">曾经参与的活动
			            <div class="div1">1.敬老院服务</div>
			            <div class="div1">2.小学课堂服务</div>
			            <div class="div1">3.环境保护服务</div>
			            </div>
		            </div>
		            <div title="消息"  style="padding:10px">
			           没有新信息
		            </div>
	            </div>
			</div>			   
		</div>
	</div>
	<div data-options="region:'south',split:true,border:false" style="height:35px;text-align:center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</c:forEach>
</body> 
<%} %>
</html>