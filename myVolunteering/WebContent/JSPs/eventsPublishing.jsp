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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEERING | admin-publish events</title>
<meta name="description" content="">

<!-- CSS -->
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">
</head>

<%
	if (user == null || user.getLevel().equals("1")) {
%>
<script type="text/javascript">
	alert("Please log in as a administrator");
	window.location.href = "/myVolunteering/JSPs/Login.jsp";
</script>
<%
	} else {
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
							<li><a href="/myVolunteering/index.jsp"><span
									class="glyphicon glyphicon-home"></span> Home</a></li>
							<li><a href="/myVolunteering/events.jsp">Events</a></li>
							<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>
							<li><a href="/myVolunteering/JSPs/stories.jsp">Stories</a></li>

							<li class="dropdown" class="active"><a
								class="dropdown-toggle" data-toggle="dropdown">Management<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="../newsPublishing.jsp">News publishing</a></li>
									<li class="divider">
									<li class="active"><a href="#">Events publishing</a></li>
								</ul></li>
							<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
							<li>
							<li class="dropdown"><a
								href="/myVolunteering/JSPs/myProfile&Events.jsp"
								class="dropdown-toggle" data-toggle="dropdown"> <span
									class="adminname"><%=user.getUserName()%></span>
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

		<div class="center">
			<h3>Information Publishing Center</h3>
			<p class="lead">administrator only</p>
			<br>
			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a
					href="#">publish events</a></li>
				<li role="presentation"><a href="../newsPublishing.jsp">publish
						resources</a></li>

			</ul>

		</div>

		<div class="panel" style="padding-top:20px; background:rgba(255,255,255,0.5)">
			<div class="row" style="margin-left:10%">
				<form id="main-contact-form" class="contact-form"
					name="contact-form" method="post"
					action="../EventsPublishingController">
					
						<label for="meeting">time：</label>
						<div class="form-group">
							<input id="eventDate"
								name="eventDate" type="date" />
						</div>

						<label>title *</label> 
						<div class="form-group">
							<input type="text" id="title" name="title"
								class="form-control" required="required" style="width:50%">
						</div>

			
						<label>content *</label>
						<div class="form-group">
							<textarea name="introduction" id="introduction" required
								class="form-control" rows="20" style="width:50%"></textarea>
						</div>
						<div class="form-group">
							<button name="submit" class="btn btn-primary">Publish</button>
						</div>
				</form>
			</div>
		</div>

		<div class="footer" style="margin-top:30px">
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

	<!--/.container-->
	<br>
	<br>

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