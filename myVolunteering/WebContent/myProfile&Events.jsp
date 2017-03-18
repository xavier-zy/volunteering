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

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEERING | my profile & events</title>
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
	window.location.href = "/myVolunteering/JSPs/Login.jsp";
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
						<li><a href="/myVolunteering/index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
						<li><a href="/myVolunteering/events.jsp">Events</a></li>
						<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>
						<li><a href="/myVolunteering/JSPs/stories.jsp">Stories</a></li>
						
						<li class="dropdown" class="active"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">MyVolunteering<strong
								class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">Profile</a>
								</li>
								<li class="divider">
								<li><a href="#">Events</a>
								</li>
								<li class="divider">
								<li><a href="/myVolunteering/JSPs/mySharing.jsp">Sharing</a></li>
							</ul></li>

						<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
						<li class="dropdown">
							<a
								href="/myVolunteering/JSPs/myProfile&Events.jsp"
								class="dropdown-toggle" data-toggle="dropdown"> <span class="username"><%=user.getUserName()%></span>
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

			<div class="tab-content">

				<div class="tab-pane fade in active" id="myProfile">
					<div class="panel mypanel-default4">
						<input type="hidden" value="<%=user.getUserName()%>"
							class="form-control input-sm" id="username" name="username">
						<input type="hidden" value="<%=user.getUserId()%>"
							class="form-control input-sm" id="userId" name="userId">
							
						<div class="col-md-4">
							 <div style="text-align:center"	> 
							<img style="width: 128px;"
								src="images/person.jpg"
								alt="Responsive image" class="img-rounded">
									
						
							<h3><%=user.getUserName()%></h3>
							<button type="button" id="change" onclick="change()"
								class="btn btn-primary btn-right">修改资料</button>
							</div>
						</div>
						
						<%
							if (userInfo != null) {
									String gender = userInfo.getGender();
									int age = userInfo.getAge();
									String phone = userInfo.getPhone();
									String email = userInfo.getEmail();
									String address = userInfo.getAddress();
									String signature = userInfo.getSignature();
						%>
						<div class="col-md-2" style="text-align: left">
							<p class="lead">user name：</p>
							<p class="lead">gender：</p>
							<p class="lead">age：</p>
							<p class="lead">phone：</p>
							<p class="lead">email：</p>
							<p class="lead">address：</p>
							<p class="lead">signature：</p>
						</div>
						
						<div class="col-md-2"  style="text-align: left; font-family:monospace" id="display" >
							<p class="lead" >
								<strong><%=user.getUserName()%></strong>
							</p>
							<p class="lead">
								<strong><%=gender == null ? "" : gender%></strong>
							</p>
							<p class="lead">
								<strong><%=age == 0 ? "" : age%></strong>
							</p>
							<p class="lead">
								<strong><%=phone == null ? "" : phone%></strong>
							</p>
							<p class="lead">
								<strong><%=email == null ? "" : email%></strong>
							</p>
							<p class="lead">
								<strong><%=address == null ? "" : address%></strong>
							</p>
							<p class="lead">
								<strong><%=signature == null ? "" : signature%></strong>
							</p>
						</div>
						
						<div class="col-md-6" id="displayForm"
							style="display: none">
							<form id="userInfo" class="form-horizontal">
								<div class="form-group" style="margin-bottom: 10px">
									<div class="col-sm-8 col-md-5">
										<input type="text" value="<%=user.getUserName()%>"
											class="form-control input-sm" id="nickname" name="nickname">
									</div>
								</div>
								<div class="form-group" style="margin-bottom: 10px">

									<div class="col-sm-5 col-md-5">

										<select class="form-control  input-sm" id="gender"
											name="gender">
											<option value="male">male</option>
											<option value="female">female</option>

										</select>
									</div>
									<script>$('#gender').val('<%=gender == null ? "" : gender%>');
									</script>
								</div>
								<div class="form-group" style="margin-bottom: 10px">
									<div class="col-sm-5 col-md-5">
										<input type="number" class="form-control input-sm" id="age"
											name="age" value="<%=age == 0 ? "" : age%>">
									</div>
								</div>
								<div class="form-group" style="margin-bottom: 10px">
									<div class="col-sm-5 col-md-5">
										<input type="text" class="form-control input-sm" id="phone"
											name="phone" value="<%=phone == null ? "" : phone%>">
									</div>
								</div>
								<div class="form-group" style="margin-bottom: 10px">
									<div class="col-sm-5 col-md-5">
										<input type="email" class="form-control input-sm" id="email"
											name="email" value="<%=email == null ? "" : email%>">
									</div>
								</div>
								<div class="form-group" style="margin-bottom: 10px">
									<div class="col-sm-5 col-md-5">
										<input type="text" class="form-control input-sm" id="address"
											name="address" value="<%=address == null ? "" : address%>">
									</div>
								</div>
								<div class="form-group" style="margin-bottom: 10px">
									<div class="col-sm-5 col-md-5">
										<textarea class="form-control input-sm"
											id="signature" name="signature"
											value="<%=signature == null ? "" : signature%>"></textarea>
									</div>
								</div>
								<div class="form-group" style="margin-bottom: 10px">
									<div class="col-sm-5 col-sm-offset-0">
										<button onclick="updateUserInfo()" type="button"
											class="btn btn-primary btn-right">confirm</button>
									</div>
								</div>
							</form>
						</div>
						<%
							} else {
						%>
						<div
							class="col-xs-12 col-sm-4 col-md-4 col-sm-offset-1 col-md-offset-1"
							style="text-align: left" id="display">
							<p class="lead">
								user name：<em><%=user.getUserName()%></em>
							</p>
							<p class="lead">
								gender：<em></em>
							</p>
							<p class="lead">
								age：<em></em>
							</p>
							<p class="lead">
								phone：<em></em>
							</p>
							<p class="lead">
								email：<em></em>
							</p>
							<p class="lead">
								address：<em></em>
							</p>
							<p class="lead">
								signature：<em></em>
							</p>
						</div>
						<div class="col-xs-12 col-sm-5 col-md-5" id="displayForm"
							style="display: none">
							<form id="userInfo" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-4  col-md-4 control-label">user name</label>
									<div class="col-sm-5 col-md-5">
										<input type="text" value="<%=user.getUserName()%>"
											class="form-control input-sm" id="nickname" name="nickname">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-md-4 control-label">gender</label>
									<div class="col-sm-5 col-md-5">

										<select class="form-control  input-sm" id="gender"
											name="gender">
											<option>male</option>
											<option>female</option>

										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-md-4 control-label">age</label>
									<div class="col-sm-5 col-md-5">
										<input type="number" class="form-control input-sm" id="age"
											name="age">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-md-4 control-label">phone</label>
									<div class="col-sm-5 col-md-5">
										<input type="text" class="form-control input-sm" id="phone"
											name="phone">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-md-4 control-label">mail</label>
									<div class="col-sm-5 col-md-5">
										<input type="email" class="form-control input-sm" id="email"
											name="email">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-md-4 control-label">address</label>
									<div class="col-sm-5 col-md-5">
										<input type="text" class="form-control input-sm" id="address"
											name="address">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-md-4 control-label">signature</label>
									<div class="col-sm-5 col-md-5">
										<textarea class="form-control input-sm"
											id="signature" name="signature"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-5 col-sm-offset-4">
										<button onclick="insertUserInfo()" type="button"
											class="btn btn-primary btn-right">confirm</button>
									</div>
								</div>
							</form>
						</div>
						<%
							}
						%>
						<!-- #profile-edit -->
					</div>
				</div>

				<div class="tab-pane fade" id="myEvents">
					<div class="panel mypanel-default3">
						<div class="panel-heading" style="margin-bottom: 20px">my events</div>
							<div class="post-footer"></div>
							<div class="center">
							<table class="table table-hover table-bordered">
								<tr>
									<td><strong>event date</strong></td>
									<td><strong>event</strong></td>
									<td></td>
								</tr>

								<%
									if (myEvents != null) {
											int number = myEvents.size();
											Set<Integer> get = myEvents.keySet();

											for (Integer test : get) {
								%>

								<tr>
									<td><%=myEvents.get(test).getEventDate()%></td>
									<td><%=myEvents.get(test).getTitle()%></td>
									<td>
									<button type="button" class="btn btn-link" 
									onclick="cancel('<%=myEvents.get(test).getEventId()%>')">cancel
									</button></td>
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
					<div class="panel mypanel-default2">
						<div class="panel-heading" style="margin-bottom: 20px">change your password</div>
						<div class="post-footer"></div>
						<form method="POST" action="/myVolunteering/PasswordController"
							id="pw-form" style="margin-left: 15px">
							<div class="form-group">
								<label class="control-label" for="id-currentpw">current password</label> <input
									type="password" class="form-control" name="currentpw"
									id="id-currentpw" required>
							</div>
							<div class="form-group">
								<label for="id-newpw" class="control-label">new password</label> <input
									type="password" class="form-control" name="newpw1"
									id="id-newpw" required>
							</div>
							<div class="form-group">
								<label class="control-label" for="id-email">confirm password</label> <input
									type="password" class="form-control" name="newpw2"
									id="id-email" required>
							</div>

							<button type="submit" class="btn btn-default">Submit</button>
						</form>
						<!-- #pw-setting -->
					</div>
				</div>


			</div>

<div class="footer">
			<div class="mypanel">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2017 for Software Engineering
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

	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/myVolunteering/js/main.js"></script>
</body>
<%
	}
%>
</html>
