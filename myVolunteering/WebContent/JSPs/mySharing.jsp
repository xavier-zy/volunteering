<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Entity.*"%>
<%@ page import="com.DAO.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.ArrayList"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(path);
	System.out.println(basePath);
	User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>my sharing</title>
<meta name="description" content="">

<!-- CSS -->
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">
<link href="/myVolunteering/css/screen.css" rel="stylesheet">

</head>

<%
	if (user == null) {
%>
<script type="text/javascript">
	alert("您还未登录，请先登录。");
	window.location.href = "Login.jsp";
</script>
<%
	} else {
		/* 		Stories mystory = MyStoryHandler.getStoriesByUserId(user.getUserId());
		 */ ArrayList<Stories> mystories = MyStoryHandler.getAllStoriesByUserId(user.getUserId());
%>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">

				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.html">Volunteering</a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/myVolunteering/index.jsp">Home</a></li>
							<li><a href="/myVolunteering/JSPs/events.jsp">Events</a></li>
							<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>

							<li class="dropdown" class="active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">MyVolunteering<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="/myVolunteering/JSPs/myProfile&Events.jsp">Profile</a>
									</li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/myProfile&Events.jsp">Events</a>
									</li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/mySharing.jsp">Sharing</a></li>
								</ul></li>

							<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
							<li><a href="#"><%=user.getUserName()%></a> <a
								style="color: #f2f2f2"
								href="<%=request.getContextPath()%>/com.Controller/LogoutController">Log
									out</a></li>
						</ul>

					</div>
				</nav>
			</div>
		</div>
	</div>

	<section class="content-wrap">
		<div class="container">
			<div class="row">
				<main class="col-md-8 main-content">
				<article id=68 class="post">
					<%
						if (mystories != null) {
								int number = mystories.size();
								System.out.print("the number is"+number);
					%>
					<div class="post-head">
						<h1 class="post-title">
							<a><%=mystories.get(number - 1).getTitle()%></a>
						</h1>
						<div class="post-meta">
							<span class="author">author：<a href="/author/wangsai/"><%=user.getUserName()%></a></span>
							&bull;
							<time class="post-date"><%=mystories.get(number - 1).getWrittenTime()%></time>
						</div>
					</div>
					<div class="featured-media">
						<a href="/post/laravel-turns-five/"><img
							src="http://image.golaravel.com/e/09/f05fc8d95497bad948ac46eb68d9d.jpg"></a>
					</div>
					<div class="post-content">
						<p><%=mystories.get(number - 1).getContent()%></p>
					</div>
					<div class="post-permalink">
						<a href="/post/laravel-turns-five/" class="btn btn-default">阅读全文</a>
					</div>
					<%
						}
					%>
					<footer class="post-footer clearfix">
						<div class="pull-left tag-list">
							<i class="fa fa-folder-open-o"></i>

						</div>
						<div class="pull-right share"></div>
					</footer>
				</article>
				</main>

				<aside class="col-md-4 sidebar">
					<!-- start widget -->
					<!-- end widget -->

					<!-- start tag cloud widget -->
					<div class="widget">
						
						<div class="content community">
							
								<h4><a href="../storywriting.jsp"> add story</a></h4>
		
						</div>
					</div>
					<div class="widget">
						<h4 class="title">My Profile</h4>
						<div class="content community">
							<p>
								<a><i class="fa fa-comments"></i> </a>
							</p>
						</div>
					</div>
					<!-- end tag cloud widget -->
					<!-- start widget -->
					<div class="widget">
						<h4 class="title">Sharing List</h4>

						<div class="content download">
							<%
								if (mystories != null) {
										int number = mystories.size();
										for (int i = 0; i < number; i++) {
							%>
							<a href="myStory.jsp?id=<%=mystories.get(i).getStoryId()%>"><%=mystories.get(i).getTitle()%></a>
								<br>

							<%
								}
									}
							%>
						</div>

					</div>
					<!-- end widget -->
				</aside>
			</div>
		</div>
	</section>

	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
<%
	}
%>
</html>
