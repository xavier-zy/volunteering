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
<title>VOLUNTEERING | my stories</title>
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
						<a class="navbar-brand" href="../index.jsp">Volunteering</a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/myVolunteering/index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
							<li><a href="/myVolunteering/JSPs/events.jsp">Events</a></li>
							<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>
							<li><a href="/myVolunteering/JSPs/stories.jsp">Stories</a></li>
							<li class="dropdown" class="active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">MyVolunteering<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="/myVolunteering/myProfile&Events.jsp">Profile</a>
									</li>
									<li class="divider">
									<li><a href="/myVolunteering/myProfile&Events.jsp">Events</a>
									</li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/mySharing.jsp">Sharing</a></li>
								</ul></li>
							<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
							
							<li class="dropdown"><a
								href="/myVolunteering/JSPs/myProfile&Events.jsp"
								class="dropdown-toggle" data-toggle="dropdown"> <span class="username"><%=user.getUserName()%></span>
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
							<span class="author">author：<a href="/myVolunteering/myProfile&Events.jsp"><%=user.getUserName()%></a></span>
							&bull;
							<time class="post-date"><%=mystories.get(number - 1).getWrittenTime()%></time>
						</div>
					</div>
					<div class="post-footer"></div>
					<div class="post-content">
						<p><%=mystories.get(number - 1).getContent()%></p>
					</div>
					<div class="post-footer"></div>
					<%
						}
					%>
					
				</article>
				</main>

				<aside class="col-md-4 sidebar">
					<div class="widget">
						
						<div class="content community">
							
								<h4><a href="../storywriting.jsp"> add story</a></h4>
		
						</div>
					</div>

					<!-- start widget -->
					<div class="widget">
						<h4 class="title">My stories</h4>

						<div class="content download">
							<%
								if (mystories != null) {
										int number = mystories.size();
										for (int i = 0; i < number; i++) {
							%>
							<a href="../myStory.jsp?id=<%=mystories.get(i).getStoryId()%>"><%=mystories.get(i).getTitle()%></a>
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
					<div class="col-sm-6">Copyright &copy; 2017 for Software Engineering
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
