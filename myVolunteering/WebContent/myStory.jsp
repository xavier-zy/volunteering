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
	ArrayList<Stories> mystories = MyStoryHandler.getAllStoriesByUserId(user.getUserId());
	String aid = "";
	aid = request.getParameter("id");
%>

<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>my story</title>
<meta name="description" content="">

<!-- CSS -->
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">
<link href="/myVolunteering/css/screen.css" rel="stylesheet">

</head>

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
							<li><a href="/myVolunteering/index.jsp"><span class="glyphicon glyphicon-home"></span>Home</a></li>
							<li><a href="/myVolunteering/JSPs/events.jsp">Events</a></li>
							<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>
							<li><a href="/myVolunteering/JSPs/stories.jsp">Stories</a></li>

							<li class="dropdown" class="active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">MyVolunteering<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">Profile</a></li>
									<li class="divider">
									<li><a href="#">Events</a></li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/mySharing.jsp">Sharing</a></li>
								</ul></li>

							<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
							<li class="dropdown"><a
								href="/myVolunteering/JSPs/myProfile&Events.jsp"
								class="dropdown-toggle" data-toggle="dropdown"> <span
									class="username"><%=user.getUserName()%></span>
							</a>
								<ul class="dropdown-menu">
									<li>
										<form method="post" action="LogoutController">
											<button class="btn btn-link">Log out</button>
										</form>
									</li>
								</ul></li>
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
					<div class="post-head">
						<h1 class="post-title">
							<a><%=MyStoryHandler.getStoryByStoryId(aid).getTitle()%></a>
						</h1>
						<div class="post-meta">
							<span class="author">author：<a
								href="/myVolunteering/myProfile&Events.jsp"><%=user.getUserName()%></a></span>
							&bull;
							<time class="post-date"><%=MyStoryHandler.getStoryByStoryId(aid).getWrittenTime()%></time>
							<span class="glyphicon glyphicon-heart"
					style="color: rgb(255, 60, 64);"></span> <%=MyStoryHandler.getStoryByStoryId(aid).getLike()%>
						</div>
					</div>
					<div class="post-footer"></div>
					<div class="featured-media">
						<a href="/post/laravel-turns-five/"><img
							src="http://image.golaravel.com/e/09/f05fc8d95497bad948ac46eb68d9d.jpg"></a>
					</div>
					<div class="post-content">
						<p><%=MyStoryHandler.getStoryByStoryId(aid).getContent()%></p>
					</div>
					<div class="post-footer"></div>
					<div class="post-permalink">
						<a href="/post/laravel-turns-five/" class="btn btn-default">edit</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-default" onclick="deleteStory('<%=aid%>')">delete</a>
					</div>
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
		
			<div class="footer">
			<div class="mypanel">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2016 T_11 for Java EE
						final project</div>
					<div class="col-sm-6" style="text-align: right">
						<div class="follow-us">
							<span>for more information: </span> &nbsp;<span
								class="glyphicon glyphicon-globe"
								style="color: rgb(255, 140, 60);">globe</span>&nbsp; <span
								class="glyphicon glyphicon-copyright-mark"
								style="color: rgb(255, 140, 60);">links</span>&nbsp; <span
								class="glyphicon glyphicon-link"
								style="color: rgb(255, 140, 60);">flag</span>&nbsp;<span
								class="glyphicon glyphicon-info-sign"
								style="color: rgb(255, 140, 60);">info</span>
						</div>
					</div>
				</div>
			</div>

		</div>
		
		</div>
	</section>

	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/myVolunteering/js/main.js"></script>

</body>
</html>
