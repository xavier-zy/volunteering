<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.Entity.*"%>
<%@ page import="com.DAO.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEERING | about us</title>
<meta name="description" content="">

<!-- CSS -->
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">

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
							<li><a href="/myVolunteering/index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
						<li><a href="/myVolunteering/JSPs/events.jsp">Events</a></li>
						<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>

						<li><a href="/myVolunteering/JSPs/stories.jsp">Stories</a></li>
							<%
								if (user != null && (user.getLevel().equals("0"))) {
							%>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown">Management<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="newsPublishing.jsp">News publishing</a></li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/eventsPublishing.jsp">Events
											publishing</a></li>
								</ul></li>

							<%
								} else {
							%>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown">MyVolunteering<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="myProfile&Events.jsp">Profile</a>
									</li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/myProfile&Events.jsp">Events</a>
									</li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/mySharing.jsp">Sharing</a></li>
								</ul></li>
							<%
								}
							%>

							<li class="active"><a href="#">About Us</a></li>




							<%
								if (user == null) {
							%>
							<li>
								<button type="submit" class="btn btn-link">
									<a href="/myVolunteering/JSPs/Login.jsp">Log in</a>
								</button>
								|
								<button type="button" class="btn btn-link navbar-btn">
									<a href="/myVolunteering/JSPs/Signup.jsp">Sign up</a>
								</button>
							</li>
							<%
								} else {
							%>
							<li class="dropdown"><a
								href="/myVolunteering/JSPs/myProfile&Events.jsp"
								class="dropdown-toggle" data-toggle="dropdown"> <%
 	if (user.getLevel().equals("0")) {
 %> <span class="adminname"><%=user.getUserName()%></span> <%
 	} else {
 %> <span class="username"><%=user.getUserName()%></span> <%
 	}
 %>
							</a>
								<ul class="dropdown-menu">
									<li>
										<form method="post" action="LogoutController">
											<button class="btn btn-link">Log out</button>
										</form>
									</li>
								</ul></li>

							<%
								}
							%>

						</ul>

					</div>
				</nav>
			</div>
		</div>

		<div class="panel mypanel1" >
			<div class="center" style="margin: 80px 80px;">
				<h2 style="color:rgb(255, 109, 60)">About us</h2>
				<div class="post-footer"></div>
				<br />
				<h3 class="page-intro" style="color:#5fb25f">Volunteering is one of the most
					rewarding things you can do.</h3>
				<p>And thinking about how you want to benefit from volunteering
					is a good start to finding an opportunity that's right for you.</p>
				<p>Volunteering can help you gain confidence by giving you the
					chance to try something new and build a real sense of achievement.</p>
				<p>Volunteering can have a real and valuable positive affect on
					people, communities and society in general. Meet
					people.Volunteering can help you meet different kinds of people and
					make new friends.</p>
				<p>Volunteering can help you feel part of something outside your
					friends and family.</p>
				<p>Volunteering can help you learn new skills, gain experience
					and sometimes even qualifications.</p>
				<p>Through volunteering you can challenge yourself to try
					something different, achieve personal goals, practice using your
					skills and discover hidden talents.</p>
		</div>
		
		<div class="panel mypanel2" >
			<div class="center">
				<h2 style="color:rgb(255, 109, 60)">Contact us</h2>
				<div class="post-footer"></div>
					<br />
				<div class="row contact_top">
					<div class="col-md-4 contact_details">
						<span class="glyphicon glyphicon-map-marker" style="color: rgb(32, 141, 200); font-size: 20px;"></span>
						&nbsp;<strong>Shanghai,China</strong>
					</div>
					<div class="col-md-4 contact_details">
						<span class="glyphicon glyphicon-envelope" style="color: rgb(32, 141, 200); font-size: 20px;"></span>
						&nbsp;<strong>123456789@qq.com</strong>
						
					</div>
					<div class="col-md-4 contact_details">
						<span class="glyphicon glyphicon-earphone" style="color: rgb(32, 141, 200); font-size: 20px;"></span>
						&nbsp;<strong>+86 65980808</strong>
					</div>
				</div>
			</div>
			</div>
			
		</div>


		<div class="footer">
			<div class="mypanel">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2016 T_11 for Java EE
						final project</div>
					<div class="col-sm-6" style="text-align:right">
						<div class="follow-us">
							<span>for more information: </span> &nbsp;<span
								class="glyphicon glyphicon-globe"
								style="color: rgb(255, 140, 60);" >globe</span>&nbsp; <span
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
	
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
