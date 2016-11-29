<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bbs.bean.TUser,com.bbs.bean.News"%>
<%@page import="com.bbs.dao.NewsDao"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	TUser tuser = (TUser) session.getAttribute("tuser");
	String aid="";
	aid=request.getParameter("id");
		
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEER |志愿快讯</title>
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
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h2 class="modal-title" id="myModalLabel">登录</h2>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="loginForm" name="loginForm"
						method="post" action="servlet/TUserServlet">
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">用户名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="userName"
									name="userName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">密码</label>
							<div class="col-sm-5 col-md-5">
								<input type="password" class="form-control input-sm"
									id="passWord" name="passWord">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"> 记住我
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-5 col-sm-offset-4">
								<button type="submit" class="btn btn-primary btn-right">
									登录</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="register" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h2 class="modal-title" id="myModalLabel">注册</h2>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="registerForm" name="registerForm"
						method="post" action="servlet/RegisterServlet">
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">用户名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="userName"
									name="userName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">昵称</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="nickname"
									name="nickname">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">密码</label>
							<div class="col-sm-5 col-md-5">
								<input type="password" class="form-control input-sm"
									id="password" name="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">确认密码</label>
							<div class="col-sm-5 col-md-5">
								<input type="password" class="form-control input-sm" id="repeat"
									name="repeat"> <span id="repeatTip"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-5 col-sm-offset-4">
								<button type="button" class="btn btn-primary btn-right"
									onclick="register()">注册</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<header id="header">

		<nav class="navbar navbar-inverse" role="banner">

			<div class="container">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">

						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>

					</button>

					<a class="navbar-brand" href="index.jsp">VOLUNTEER</a>

				</div>

				<div class="collapse navbar-collapse navbar-left"
					style="padding-left: 5px; padding-right: 5px">
					<ul class="nav navbar-nav">

						<li><a href="index.jsp">首页</a></li>

						<li><a href="person.jsp">个人中心</a></li>

						<li><a href="activities.jsp?index=1">志愿活动</a></li>

						<li class="active"><a href="moreNews.jsp">志愿快讯</a></li>

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

						<a data-target="#login" data-toggle="modal" href="#"
							class="btn btn-primary btn-sm" style="margin-top: 0">登录</a>&nbsp;&nbsp;

						<a data-target="#register" data-toggle="modal" href="#"
							class="btn btn-danger btn-sm "
							style="margin-top: 0; padding: 8px 20px; border-radius: 4px; border: none">注册</a>

					</ul>

					<%
						} else {

					%>

					<div id="loginDiv" style="margin-left: 20px; margin-top: 8px;">

						<a style="margin-right: 10px; color: #f2f2f2" href="person.jsp"><span><img
								style="margin-right: 10px;" class="img-rounded" width="50px"
								src="<%=basePath + tuser.getHeadImg()%>"></span><%=tuser.getNickname()%></a>





						<a style="color: #f2f2f2"
							href="<%=request.getContextPath()%>/servlet/LoginOutServlet">退出登录</a>

					</div>

					<%

						}

					%>

				</div>



			</div>

			<!--/.container-->

		</nav>

		<!--/nav-->



	</header>
	<!--/header-->
	<section id="inner-page">
  <div class="container">
    <div class="center">
    <h2 style="margin-left:-120px;">志愿快讯之</h2>   
      <p style="font-size:25px;"><%=NewsDao.getNewsById(aid).getTitle()%></p><br>
      <span style="float:right;">发表时间:<%=NewsDao.getNewsById(aid).getPublishtime()%>&nbsp;&nbsp;</span>  
    </div>
	<div><%=NewsDao.getNewsById(aid).getContent()%></div>
	
 
 <br/>
  <br/>
   <br/>
    <br/>
 </div>
</section>

<section id="get-started">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h2 >联系我们</h2>

        <p>如果想了解或者加入我们，欢迎你的加入！<br>
          </p>
        <a href="contact-us.html" class="btn btn-primary">联系我们</a> </div>
    </div>
  </div>
  <!--/.container--> 
</section>

<!--/#get-started-->
<div class="color-border"> </div>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">Copyright &copy; 2015 SSE-SoftwareEngineeringProjects</div>
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