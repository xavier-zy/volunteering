<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bbs.bean.TUser"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser tuser = (TUser)session.getAttribute("tuser");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEER | 关于我们 </title>
<meta name="description" content="">

<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<!--/head-->

<body>
<header id="header">
		<nav class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
					<a class="navbar-brand" href="index.jsp">VOLUNTEER</a>
				</div>
				<div class="collapse navbar-collapse navbar-left" style="padding-left:5px;padding-right:5px">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">首页</a></li>
						<li><a href="person.jsp">个人中心</a></li>
						<li><a href="activities.jsp?index=1">志愿活动</a></li>
						<li><a href="moreNews.jsp">志愿快讯</a></li>
						<li><a href="moreThinking.jsp">感想录</a></li>
						<%
							if (tuser != null&&!"1".equals(tuser.getLevel())) {
						%>
						<li><a href="message.jsp">信息管理</a></li>
						<li><a href="publishActivity.jsp">信息发布</a></li>
						<%
							}else{
						%>
						
						
						<li><a href="about.jsp">关于我们</a></li>
						<%} %>
					</ul>
				</div>
				<div class="collapse navbar-collapse navbar-right">
					<%
						if (tuser == null) {
					%>
					<ul class="nav navbar-nav">
						<a data-target="#login" data-toggle="modal" href="#" class="btn btn-primary btn-sm" style="margin-top: 0">登录</a>&nbsp;&nbsp;
						<a data-target="#register" data-toggle="modal" href="#" class="btn btn-danger btn-sm " style="margin-top: 0; padding: 8px 20px; border-radius: 4px; border: none">注册</a>
					</ul>
					<%
						} else {
					%>
					<div id="loginDiv" style="margin-left: 20px; margin-top: 8px;">
						<a style="margin-right: 10px;color:#f2f2f2" href="person.jsp"><span><img style="margin-right: 10px;" class="img-rounded" width="50px" src="<%= basePath+tuser.getHeadImg()%>"></span><%=tuser.getNickname()%></a>
							
						
						<a  style="color:#f2f2f2" href="<%=request.getContextPath()%>/servlet/LoginOutServlet">退出登录</a>
					</div>
					<%} %>
				</div>

			</div>
			<!--/.container--> 
		</nav>
		<!--/nav--> 

	</header>
	<!--/header-->
<div class="color-border"> </div>
<section id="inner-page">
  <div class="container">
    <div class="center" style="margin-top:80px;">
      <h2>关于我们</h2>
      <br><br><br><br><br><br><br><br>
      <p class="center">志愿服务是一种生活方式<br><br>用我们的努力，换取一个更美好的校园<br><br>如果想了解或者加入我们，欢迎你的加入!</p>
    </div>
    
    <div class="row contact_top">
      <div class="col-md-4 contact_details"> <i class="fa fa-map-marker fa-2x"></i>
        <p>Building Jishi,No.4800 Caoan Rd,Jiading District<br>
          Shanghai,China</p>
      </div>
      <div class="col-md-4 contact_details"> <i class="fa fa-envelope-o fa-2x"></i>
        <p>123456789@qq.com</p>
      </div>
      <div class="col-md-4 contact_details"> <i class="fa fa-phone fa-2x"></i>
        <p>+86 65980808<br>
          +86 65982333</p>
      </div>
    </div>
    <div class="row">
			<div class="center">
				<h3>留言：</h3>		
				<p>您的评论对我们也很重要哦</p>
			</div>
			<!-- <div class="row"> -->
			<div class="col-xs-12 col-sm-8 col-md-8 col-md-offset-2">
				<div class="">
					<textarea class="form-control" id="message" rows="6"></textarea>
				</div>		
			</div>
			<div class="col-xs-12 col-sm-2 col-md-2" style="margin-top:80px;">
				<button type="button" class="btn btn-info" onclick="insertMessage('<%=tuser!=null?tuser.getUserName():"" %>')">提交</button>
			</div>
			<!-- </div> -->
			
			
						<!--/.col-sm-6-->
	</div>
    <!--/.row-->    
    <!--/.row--> 
  </div>
  <!--/.container--> 
  <br>
  <br>
</section>
<!--/#inner-page-->

<div class="color-border"> </div>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">Copyright &copy; 2016 tjzyz</div>
      <div class="col-sm-6">
        <div class="follow-us"> <a class="fa fa-facebook social-icon" href="#"></a> <a class="fa fa-twitter social-icon" href="#"></a> <a class="fa fa-linkedin social-icon" href="#"></a> <a class="fa fa-google-plus social-icon" href="#"></a> </div>
      </div>
    </div>
  </div>
</footer>
<!--/#footer--> 

<script src="js/jquery.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.prettyPhoto.js"></script> 
<script src="js/jquery.isotope.min.js"></script> 
<script src="js/main.js"></script>
</body>
</html>