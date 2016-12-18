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
	ArrayList<Stories> stories = StoriesHandler.getAllStories();
	int amount = stories.size();
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
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
						<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>
						<li class="active"><a href="#">Stories</a></li>
						

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
						</li>
							<% } else { %>
							<li class="dropdown">
	 							<a href="/myVolunteering/JSPs/myProfile&Events.jsp" 
	 							class="dropdown-toggle" data-toggle="dropdown">
	 							<%=user.getUserName()%>
	 							</a>
									<ul class="dropdown-menu">
										<li>
										<form method="post" action="../LogoutController">
											<button>Log out</button>
										</form>
										</li>
									</ul>
							</li>
							<% } %>
						
					</ul>

				</div>
				</nav>
			</div>
		</div>
		
		
		<section id="inner-page">
		<div class="container">
			<div class="center">
				<h2>Stories</h2>

			</div>
			<table class="table table-hover">
				<tr>
					<td><strong>story.no</strong></td>
					<td><strong>story title</strong></td>
					<td></td>
				</tr>
				
				<%
					/* if (index < lastPage) { */
						for (int i = 0; i < stories.size(); i++) {
				%>
				<tr>
					<td><%=stories.get(i).getStoryId() %></td>
					<td><%=stories.get(i).getTitle() %></td>
					<td>
						<a href="../storyDetais.jsp?id=<%=stories.get(i).getStoryId() %>" >more</a>
					</td>
				</tr>
				
				<% /* } */
						} 
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
