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
	double amount = news.size();
	double lastPage = Math.ceil(amount / 10);
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEERING | resources</title>
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
						<li><a href="/myVolunteering/events.jsp">Events</a></li>
						<li  class="active"><a href="#">Resources</a></li>
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

							<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>




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

		<section id="inner-page">
		<div class="container">
			<div class="center">
				<h2>News</h2>
				<!-- <p>请对活动做出修改</p> -->
			</div>
			<table class="table table-hover">
				<tr>
					<td><strong>实时新闻</strong></td>
					<td><strong>更新时间</strong></td>
				</tr>
				<%
					//if (index < lastPage) {
						for (int i = 0; i < news.size(); i++) {
				%>
				<tr>
					<td><a
						href="newsContent.jsp?id=<%=news.get(i).getNewsId()%>"><%=news.get(i).getTitle()%></a></td>
					<td><a
						href="newsContent.jsp?id=<%=news.get(i).getNewsId()%>"><%=news.get(i).getPublishTime()%></a></td>
				</tr>
				<%
					}
					/* } else {
						int currentAmount = (int) amount - 10 * (int) (lastPage - 1);
						for (int i = 0; i < currentAmount; i++) { */
				%>
				<%-- <tr>
					<td><a
						href="newsContent.jsp?id=<%=news.get((index - 1) * 10 + i).getNewsId()%>"><%=news.get((index - 1) * 10 + i).getTitle()%></a></td>
					<td><a
						href="newsContent.jsp?id=<%=news.get((index - 1) * 10 + i).getNewsId()%>"><%=news.get((index - 1) * 10 + i).getPublishTime()%></a></td>
				</tr> --%>
				<%
					/* }
					} */
				%>
			</table>
		</div>
		</section>
	</div>

	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
