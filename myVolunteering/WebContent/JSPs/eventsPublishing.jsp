<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="com.Entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>publish events</title>
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
						<li><a href="events.html">Events</a></li>
						<li><a href="resouces.html">Resources</a></li>

						<li class="dropdown" class="active"><a
							class="dropdown-toggle" data-toggle="dropdown">Management<strong
								class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="newsPublishing.jsp">News publishing</a></li>
								<li class="divider">
								<li><a href="/myVolunteering/JSPs/eventsPublishing.jsp">Events
										publishing</a></li>
							</ul></li>
						<li><a href="about%20us.html">About Us</a></li>
						<li>
							<%
								if (user == null) {
							%>
							<button type="submit" class="btn btn-default">
								<a href="/myVolunteering/JSPs/Login.jsp">Log in</a>
							</button>
							<button type="button" class="btn btn-default navbar-btn">
								<a href="/myVolunteering/JSPs/Signup.jsp">Sign up</a>
							</button>
						</li>
						<%
							} else {
						%>
						<li class="dropdown"><a
							href="/myVolunteering/JSPs/myProfile&Events.jsp"
							class="dropdown-toggle" data-toggle="dropdown"> <%=user.getUserName()%>
						</a>
							<ul class="dropdown-menu">
								<li>
									<form method="post" action="LogoutController">
										<button>Log out</button>
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
	</div>

	<section id="inner-page">
	<div class="container">
		<div class="center">
			<h2>信息发布中心</h2>
			<p class="lead">Manager only</p>

			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a
					href="publishActivity.jsp">发布活动</a></li>
				<li role="presentation"><a href="../newsPublishing.jsp">发布新闻</a></li>

			</ul>

		</div>


		<!--/.row-->


		<div>
			<div class="center">
				<h3>publish a new event</h3>
			</div>
			<div class="row">
				<form id="main-contact-form" class="contact-form"
					name="contact-form" method="post"
					action="../EventsPublishingController">
					<div class="col-sm-5 col-sm-offset-1">
						<div class="form-group">
							<!-- <label>活动时间 *</label>
            <input type="email" name="email" class="form-control" required="required"> -->
							<label for="meeting">活动时间：</label><input id="eventDate"
								name="eventDate" type="date" />
						</div>

						<div class="form-group">
							<label>活动名称 *</label> <input type="text" id="title" name="title"
								class="form-control" required="required">
						</div>

					</div>
					<div class="col-sm-5">
						<div class="form-group">
							<label>具体内容 *</label>
							<textarea name="introduction" id="introduction" required
								class="form-control" rows="8"></textarea>
						</div>
						<div class="form-group">
							<button name="submit" class="btn btn-primary btn-lg">Publish</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--/.row-->
		<br /> <br /> <br />

	</div>

	<!--/.container--> <br>
	<br>
	</section>

	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>