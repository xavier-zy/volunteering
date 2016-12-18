<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Entity.*"%>
<%@ page import="com.DAO.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(path);
	System.out.println(basePath);
	User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>my profile & events</title>
<meta name="description" content="">

<!-- CSS -->
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">

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
		UserInfo userInfo = UserInfoHandler.getUserInfoByUserId(user.getUserId());
		Map<Integer, Events> myEvents = MyEventsHandler.getMyEventsByUserId(user.getUserId());
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
						<li><a href="/myVolunteering/index.jsp">Home</a></li>
						<li><a href="/myVolunteering/JSPs/events.jsp">Events</a></li>
						<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>

						<li class="dropdown" class="active"><a href="#"
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
						<li><a href="#"><%=user.getUserName()%></a> 
						<form method="post" action="../LogoutController">
										<button>Log out</button>
									</form>
					</ul>

				</div>
				</nav>
			</div>
		</div>
	</div>

	<section id="inner-page">
	<div class="container">
		<div class="center">
			<h2>My volunteering</h2>
			<p class="lead">
				Welcome to <span class="mySpan">VOLUNTEERING</span>！<%=user.getUserName()%>
			</p>
		</div>

		<ul class="nav nav-tabs">
			<li class="active"><a href="#myProfile" data-toggle="pill">Profile</a></li>
			<li><a href="#myEvents" data-toggle="pill">Events</a></li>
			<li><a href="#mySetting" data-toggle="pill">Setting</a></li>
		</ul>

		<div class="col-sm-9">
			<div class="tab-content">

				<div class="tab-pane fade in active" id="myProfile">
					<div class="panel mypanel-default">
							<div class="center center-profile">
								<div class="col-md-4">
									<img src="img/person.jpg" alt="Responsive image"
										class="img-rounded">
								</div>

								<%
									if (userInfo != null) {
											/* String realname = UserInfo.getRealname();
											String gender = tUserInfo.getGender();
											int age = tUserInfo.getAge();
											String department = tUserInfo.getDepartment();
											String phone = tUserInfo.getPhone();
											String email = tUserInfo.getEmail();
											String address = tUserInfo.getAddress();
											String signature = tUserInfo.getSignature(); */
								%>

								<div class="col-md-8">
									<p class="lead">
										name：<%=user.getUserName()%></p>
									<p class="lead">
										gender：<%=userInfo.getGender()%></p>
									<p class="lead">
										age：<%=userInfo.getAge()%></p>
									<p class="lead">
										phone：<%=userInfo.getPhone()%></p>
									<p class="lead">
										email：<%=userInfo.getEmail()%></p>
								</div>

								<%
									}
								%>

							</div>
						<!-- #profile-edit -->
					</div>
				</div>

				<div class="tab-pane fade" id="myEvents">
					<div class="panel mypanel-default">
							<div class="center">
								<table class="table table-hover">
									<tr>
										<td><strong>events.no</strong></td>
										<td><strong>events</strong></td>
									</tr>

									<%
										if (myEvents != null) {
												int number = myEvents.size();
												Set<Integer> get = myEvents.keySet();

												for (Integer test : get) {
									%>

									<tr>
										<td><%=myEvents.get(test).getEventId()%></td>
										<td><%=myEvents.get(test).getTitle()%></td>
									</tr>
									<%
										}
											}
									%>
								</table>
			
						</div>
					</div>
				</div>


				<div class="tab-pane fade" id="mySetting">
					<div class="panel mypanel-default">
								<div class="panel-heading">修改密码</div>
								<form method="POST" action="/myVolunteering/PasswordController"
									id="pw-form">
									<div class="form-group">
										<label class="control-label" for="id-currentpw">当前密码</label> <input
											type="password" class="form-control" name="currentpw"
											id="id-currentpw" required>
									</div>
									<div class="form-group">
										<label for="id-newpw" class="control-label">新的密码</label> <input
											type="password" class="form-control" name="newpw1"
											id="id-newpw" required>
									</div>
									<div class="form-group">
										<label class="control-label" for="id-email">确认密码</label> <input
											type="password" class="form-control" name="newpw2"
											id="id-email" required>
									</div>

									<button type="submit" class="btn btn-default">Submit</button>
								</form>
						<!-- #pw-setting -->
					</div>
				</div>


			</div>
		</div>
	</section>

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
