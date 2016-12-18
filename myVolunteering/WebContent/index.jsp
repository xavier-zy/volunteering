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
	ArrayList<Stories> popularStories = StoriesHandler.getMostLikedStories();
	ArrayList<Events> events = EventsHandler.getAllEvents();
	ArrayList<News> news = NewsHandler.getAllNews();
	/* ArrayList<Thoughts> thoughts = ThoughtsDao.getAllThoughts();
	 */
%>
<!DOCTYPE html >
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Volunteering: home page</title>
<meta name="description" content="">

<!-- CSS -->
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/font-awesome.min.css" rel="stylesheet">
<link href="/myVolunteering/css/prettyPhoto.css" rel="stylesheet">
<!-- <link href="/myVolunteering/css/main.css" rel="stylesheet">
 -->
<link href="/myVolunteering/css/responsive.css" rel="stylesheet">
</head>


<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<!-- 导航栏 -->
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
							<li class="active"><a href="#">Home</a></li>
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
									<li><a href="/myVolunteering/JSPs/myProfile&Events.jsp">Profile</a>
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


		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">

				<div class="item active" style="">
					<img src="images/slider/bg1.jpg" alt="First slide">
					<div class="mycontainer">
						<div class="row slide-margin">
							<div class="col-sm-12">
								<div class="carousel-content">
									<h2>Welcome to VOLUNTEER</h2>
									<h4>Volunteering is one of the most rewarding things you
										can do!</h4>
									<a class="btn-slide" href="/myVolunteering/JSPs/aboutUs.jsp">Read
										More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				System.out.println("Helllllo!!");
					System.out.println(popularStories.size());
					for (int i = 0; i < popularStories.size(); i++) {
				%>
				<div class="item">
					<img src="images/slider/bg2.jpg" alt="Second slide">
					<div class="mycontainer">
						<div class="row slide-margin">
							<div class="col-sm-12">
								<div class="carousel-content">
									<h2><%=popularStories.get(i).getTitle() %></h2>
									<h4>Get to know our most liked stories.</h4>
									<a class="btn-slide" href="storyDetais.jsp?id=<%=popularStories.get(i).getStoryId() %>">
									Read More</a>
								</div>

							</div>
						</div>
					</div>
				</div>
				
				<% } %>

				<div class="item">
					<img src="images/slider/bg3.jpg" alt="Third slide">
					<div class="mycontainer">
						<div class="row slide-margin">
							<div class="col-sm-12">
								<div class="carousel-content">
									<h2>Latest NEWS</h2>
									<h4>Get some news and other resources!</h4>
									<a class="btn-slide"
										href="/myVolunteering/JSPs/newsInResources.jsp">Read More</a>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>

	<br>
	<br>

	<div class="row clearfix">
		<div class="container">
			<div class="col-md-4 column">
				<h2>Stories</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn" href="#">details »</a>
				</p>
			</div>
			<div class="col-md-4 column">
				<h2>Programs</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn" href="#">details »</a>
				</p>
			</div>
			<div class="col-md-4 column">
				<h2>FAQs</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn" href="#">details »</a>
				</p>
			</div>
		</div>
	</div>



	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/myVolunteering/js/jquery.prettyPhoto.js"></script>
	<script src="/myVolunteering/js/jquery.isotope.min.js"></script>
	<script src="/myVolunteering/js/main.js"></script>
</body>

</html>
