<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Entity.*"%>
<%@ page import="com.DAO.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
	ArrayList<Events> events = EventsHandler.getAllEvents();
	int amount = events.size();
	double lastPage = Math.ceil(amount / 10);
	System.out.println(lastPage);
	int index;
	if (request.getParameter("index2") != null) {
		index = Integer.parseInt(request.getParameter("index2"));
		if (index > lastPage) {
			index = 1;
		}
		System.out.println(index);
	} else {
		index = 1;
		System.out.println(index);
	}
	HashSet<Integer> myEvents = new HashSet<Integer>();
	if (user != null) {
		ArrayList<MyEvents> myevent = MyEventsHandler.getAllMyEvents(user.getUserId());

		if (myevent != null) {
			int number = myevent.size();

			for (int i = 0; i < number; i++) {
				myEvents.add(myevent.get(i).getEventId());
			}
		}

	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEERING | events</title>
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
							<li><a href="/myVolunteering/index.jsp"><span
									class="glyphicon glyphicon-home"></span> Home</a></li>
							<li class="active"><a href="#">Events</a></li>
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
									<li><a href="myProfile&Events.jsp">Profile</a></li>
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
							<li>
								<%
									if (user == null) {
								%>
								<button type="submit" class="btn btn-link">
									<a href="/myVolunteering/JSPs/Login.jsp">Log in</a>
								</button> |
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
			<aside class="col-md-4 mysidebar">
				<div class="widget">
					<h4 class="title" style="font-size: 1.5em; font-weight: 400;">Events list</h4>

					<div class="content download">
						<%
							if (user != null && user.getLevel().equals("1")) {
						%>
						<%
							for (int i = 0; i < amount; i++) {
						%>
						<table class="table table-hover">
							<tr>
								<td><a
									href="/myVolunteering/JSPs/eventDetails.jsp?id=<%=events.get(i).getEventId()%>">
										<%=events.get(i).getEventDate()%>&nbsp;|&nbsp;<%=events.get(i).getTitle()%></a></td>
								<%
									if (myEvents.contains(events.get(i).getEventId())) {
								%>
								<td>
									<button type="button" class="btn btn-danger"
										style="margin-right: 20px;">已报名</button>
								</td>
								<%
									} else {
								%>
								<td><button type="button" class="btn btn-success"
										onclick="enroll('<%=user.getUserId()%>',
									'<%=events.get(i).getEventId()%>',
									'<%=events.get(i).getState()%>')">
										报名</button></td>
							</tr>
						</table>
						<%
							}
								}
							} else {
								for (int i = 0; i < amount; i++) {
						%>
						<table class="table table-hover">
							<tr>
								<td><a
									href="/myVolunteering/JSPs/eventDetails.jsp?id=<%=events.get(i).getEventId()%>">
										<%=events.get(i).getEventDate()%>&nbsp;|&nbsp;<%=events.get(i).getTitle()%></a></td>
								<td><button type="button" class="btn btn-success"
										onclick="pleaseLogin()">报名</button></td>
							</tr>
						</table>
						<%
							}
							}
						%>
					</div>
				</div>
			</aside>


			<main class="col-md-8 main-content">
			<div class="post" style="text-align:center">
				<h3><%=events.get(amount - 1).getTitle()%></h3>
				<span style="float: center;">published time:&nbsp;<%=events.get(amount - 1).getEventDate()%>
				</span>
				<div class="my_jumbotron">
					<p><%=events.get(amount - 1).getIntroduction()%></p>
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
	<script src="/myVolunteering/js/main.js"></script>
</body>

</html>
