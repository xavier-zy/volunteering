<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page
	import="com.bbs.bean.TUser,com.bbs.bean.Thoughts,com.bbs.bean.TUserInfo"%>

<%@page import="com.bbs.dao.ThoughtsDao,com.bbs.dao.TUserDao"%>

<%

	String path = request.getContextPath();

	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	TUser tuser = (TUser) session.getAttribute("tuser");

	ArrayList<Thoughts> thoughts = ThoughtsDao.getAllThoughts();

	double amount = thoughts.size();

	double lastPage = Math.ceil(amount/10);

	System.out.println(lastPage);

	int index;

	if (request.getParameter("index") != null) {

		index = Integer.parseInt(request.getParameter("index"));

		if (index > lastPage) {

			index = 1;

		}

		System.out.println(index);

	} else {

		index = 1;

		System.out.println(index);

	}

%>



<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>VOLUNTEER |志愿活动</title>

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

						<li><a href="moreNews.jsp">志愿快讯</a></li>

						<li class="active"><a href="moreThinking.jsp">感想录</a></li>

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



	<section id="inner-page">

		<div class="container">

			<div class="center">

				<h2>感想录</h2>

				<p>每个人都能留下他的足迹！</p>

			</div>

			<table class="table table-hover">

				<tr>

					<td><strong>编号</strong></td>

					<td><strong>标题</strong></td>

					<td><strong>作者</strong></td>

					<td><strong>发表时间</strong></td>



				</tr>

				<%

                     if(index<lastPage){

                    	 for (int i =0; i < 10; i++){

                    		 

                     %>

				<tr>

					<td><a
						href="thoughts.jsp?id=<%=thoughts.get((index-1)*10+i).getId()%>"><%=thoughts.get((index-1)*10+i).getId()%></a></td>

					<td><a
						href="thoughts.jsp?id=<%=thoughts.get((index-1)*10+i).getId()%>"><%=thoughts.get((index-1)*10+i).getThoughtsTitle()%></a></td>



					<td><%=TUserDao.getTUserById((thoughts.get((index-1)*10+i).getUserId()).toString()).getNickname()%>

					</td>

					<td><%=thoughts.get((index-1)*10+i).getPublishTime()%>
				</tr>

				<%

                    	 }

                     }else{

							int currentAmount=(int)amount-10*(int)(lastPage-1);

							for (int i = 0; i < currentAmount; i++) {

					%>

				<tr>

					<td><a
						href="thoughts.jsp?id=<%=thoughts.get((index-1)*10+i).getId()%>"><%=thoughts.get((index-1)*10+i).getId()%></a></td>

					<td><a
						href="thoughts.jsp?id=<%=thoughts.get((index-1)*10+i).getId()%>"><%=thoughts.get((index-1)*10+i).getThoughtsTitle()%></a></td>

					<td><%=TUserDao.getTUserById((thoughts.get((index-1)*10+i).getUserId()).toString()).getNickname()%>

					</td>

					<td><%=thoughts.get((index-1)*10+i).getPublishTime()%>
				</tr>

				<%

							}

                     }

                     %>

			</table>

		</div>

		<div
			class="center col-sm-6  col-md-6 col-sm-offset-3 col-md-offset-3 index">

			<span><a href="moreThinking.jsp?index=1"><<</a></span>

			<%

			if(index!=1){
			%>
			<span><a href="moreThinking.jsp?index=<%=index-1 %>"><</a></span>
			<%

			} 

			%>

			<%

			if(index-2>=1){

			%>

			<span><a href="moreThinking.jsp?index=<%=index-2 %>"><%=index-2 %></a></span>

			<%

			} 
			%>
			<%

			if(index-1>=1){

			%>

			<span><a href="moreThinking.jsp?index=<%=index-1 %>"><%=index-1 %></a></span>

			<%

			} 

			%>

			<span><%=index %></span>

			<%
			if(index+1<=(int)lastPage){

			%>

			<span><a href="moreThinking.jsp?index=<%=index+1 %>"><%=index+1 %></a></span>

			<%

			} 

			%>

			<%

			if(index+2<=(int)lastPage){

			%>

			<span><a href="moreThinking.jsp?index=<%=index+2 %>"><%=index+2 %></a></span>

			<%

			} 

			%>

			<%

			if(index<lastPage){

			%>

			<span><a href="moreThinking.jsp?index=<%=index+1 %>">></a></span>

			<%

			} 

			%>

			<span><a href="moreThinking.jsp?index=<%=(int)lastPage %>">>></a></span>

		</div>

		</div>

	</section>



	<section id="get-started">

		<div class="container">

			<div class="row">

				<div class="col-sm-12">

					<h2>联系我们</h2>



					<p>

						如果你有什么想法，请投稿给我们 123456@qq.com<br>

					</p>

					<a href="about.jsp" class="btn btn-primary">联系我们</a>

				</div>

			</div>

		</div>

		<!--/.container-->

	</section>



	<!--/#get-started-->

	<div class="color-border"></div>

	<footer id="footer">

		<div class="container">
			<div class="row">
				<div class="col-sm-6">Copyright &copy; 2016 tjzyz</div>

				<div class="col-sm-6">

					<div class="follow-us">

						<a class="fa fa-facebook social-icon" href="#"></a> <a
							class="fa fa-twitter social-icon" href="#"></a> <a
							class="fa fa-linkedin social-icon" href="#"></a> <a
							class="fa fa-google-plus social-icon" href="#"></a>

					</div>

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
