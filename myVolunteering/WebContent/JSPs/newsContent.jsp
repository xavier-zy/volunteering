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
	ArrayList<News> news = NewsHandler.getAllNews();
	String aid = "";
	aid = request.getParameter("id");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>events</title>
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
						<li class="active"><a href="#">Resources</a></li>

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

						<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
						<li>
							<% if (user == null) {%>
							<button type="submit" class="btn btn-default">
								<a href="/myVolunteering/JSPs/Login.jsp">Log in</a>
							</button>
							<button type="button" class="btn btn-default navbar-btn">
								<a href="/myVolunteering/JSPs/Signup.jsp">Sign up</a>
							</button> 
							<% } else { %>
							<div id="loginDiv" style="margin-left: 10px; margin-top: 8px;">
								<a style="margin-right: 10px; color: #161617" href="/myVolunteering/JSPs/myProfile&Events.jsp">
									<%-- <span>
										<img
										style="margin-right: 10px;" class="img-rounded" width="50px"
										src="<%= basePath+user.getHeadImg()%>">
									</span --%>
									<%=user.getUserName()%>
								</a> 
								<a  style= "color: #161617" href="<%=request.getContextPath()%>/com.Controller/LogoutController">
									Log out
								</a>
							</div>
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
		<aside class="col-md-3 sidebar">
			<div class="content download">
							<%
								if (news != null) {
										int number = news.size();
										for (int i = 0; i < number; i++) {
							%>
							<a href="newsContent.jsp?id=<%=news.get(i).getNewsId()%>"><%=news.get(i).getTitle()%></a>
								<br>

							<%
								}
									}
							%>
						</div>
		</aside>
		<main class="col-md-9 main-content">
			<div class="center">
				<h2><%=NewsHandler.getNewsByNewsId(aid).getTitle()%></h2>
				<span style="float: center;">发表时间:<%=NewsHandler.getNewsByNewsId(aid).getPublishTime()%>&nbsp;&nbsp;
				</span>
				<br><br/>
				<!-- <p>请对活动做出修改</p> -->
				<div class="my_jumbotron">
					<h3><%=NewsHandler.getNewsByNewsId(aid).getTitle()%></h3>
					<p><%=NewsHandler.getNewsByNewsId(aid).getContent()%></p>
				</div>
			</div>
		</main>


		</div>
	</section>
	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
