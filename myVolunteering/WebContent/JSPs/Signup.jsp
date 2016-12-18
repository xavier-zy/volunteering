<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sign up</title>
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
						<li class><a href="#">Events</a></li>
						<li><a href="#">Resources</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">MyVolunteering<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">Profile</a></li>
								<li class="divider">
								<li><a href="#">Events</a></li>
								<li class="divider">
								<li><a href="#">Sharing</a></li>
							</ul></li>
						<li><a href="#">About Us</a></li>
						<li>
							<button type="submit" class="btn btn-default">
								<a href="Login.jsp">Log in</a>
							</button>
							<button type="button" class="btn btn-default navbar-btn">
								<a href="Signup.jsp">Sign up</a>
							</button>
						</li>
					</ul>

				</div>
				</nav>
			</div>

		</div>
	</div>

	<div class="panel panel-default">
		<form class="form-horizontal" id="signupForm" name="signupForm"
			method="post" action="/myVolunteering/SignupController">
			<div class="form-group">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="Name">
			</div>
			<div class="form-group">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="Email">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="Password">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="con_password"
					name="con_password" placeholder="Confirm password">
					<span id="repeatTip"></span>
			</div>
			<div class="checkbox">
				<center>
					<label> <input type="checkbox"> remember me
					</label>
				</center>
			</div>
			<center>
				<button type="submit" class="btn btn_signup" onclick="check()">Sign
					up</button>
			</center>
		</form>
	</div>

	<!-- 
    script -->
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/myVolunteering/js/main.js"></script>

</body>

</html>
