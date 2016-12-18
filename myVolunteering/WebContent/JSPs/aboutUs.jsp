<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.Entity.*"%>
<%@ page import="com.DAO.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
	ArrayList<Events> events = EventsHandler.getAllEvents();
	ArrayList<News> news = NewsHandler.getAllNews();
	/* ArrayList<Thoughts> thoughts = ThoughtsDao.getAllThoughts();
	 */
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>about us</title>
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
							<li><a href="/myVolunteering/index.jsp">Home</a></li>
						<li><a href="/myVolunteering/JSPs/events.jsp">Events</a></li>
						<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>

						<li class="dropdown"><a href="my%20volunteering.html"
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

						<li  class="active"><a href="#">About Us</a></li>
						<li>
							<% if (user == null) {%>
							<button type="submit" class="btn btn-default">
								<a href="/myVolunteering/JSPs/Login.jsp">Log in</a>
							</button>
							<button type="button" class="btn btn-default navbar-btn">
								<a href="/myVolunteering/JSPs/Signup.jsp">Sign up</a>
							</button> 
							<% } else { %>
							<li class="dropdown">
	 							<a href="/myVolunteering/JSPs/myProfile&Events.jsp" 
	 							class="dropdown-toggle" data-toggle="dropdown">
	 							<%=user.getUserName()%>
	 							</a>
									<ul class="dropdown-menu">
										<li>
										<form method="post" action="LogoutController">
											<button>Log out</button>
										</form>
										</li>
									</ul>
							</li>
							 <%
 	}
 %>
							</li>
						</ul>

					</div>
				</nav>
			</div>
		</div>
	</div>
	<section id="inner-page">
		<div class="container">
			<div class="center" style="margin: 80px 80px;">
				<h2>Contact us</h2>
				<br />
				<h3 class="page-intro">Volunteering is one of the most
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
			<div class="center">
				<div class="row contact_top">
					<div class="col-md-4 contact_details">
						<i class="fa fa-map-marker fa-2x"></i>
						<p>Shanghai,China</p>
					</div>
					<div class="col-md-4 contact_details">
						<i class="fa fa-envelope-o fa-2x"></i>
						<p>123456789@qq.com</p>
					</div>
					<div class="col-md-4 contact_details">
						<i class="fa fa-phone fa-2x"></i>
						<p>+86 65980808</p>
					</div>
				</div>
			</div>
			<!--/.row-->
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
