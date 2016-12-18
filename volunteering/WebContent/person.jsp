<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.bbs.bean.*"%>
<%@ page import="com.bbs.dao.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(path);
	System.out.println(basePath);
	TUser tuser = (TUser) session.getAttribute("tuser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEER | 个人中心</title>
<meta name="description" content="">
<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>
<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<!--/head-->
<%
	if (tuser == null) {
%>
<script type="text/javascript">
	alert("您还未登录，请先登录。");
	window.location.href = "index.jsp";
</script>
<%
	} else {
		TUserInfo tUserInfo = TUserInfoDao.getUserInfoByUserId(tuser.getUserId());
		Map<Integer,Activity> myActivities =MyActivityDao.getMyActivityByUserId(tuser.getUserId());
%>
<body>
	<header id="header">
		<nav class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">VOLUNTEER</a>
				</div>
				<div class="collapse navbar-collapse navbar-left" style="padding-left:5px;padding-right:5px">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">首页</a></li>
						<li><a href="person.jsp">个人中心</a></li>
						<li><a href="activities.jsp?index=1">志愿活动</a></li>
						<li><a href="moreNews.jsp">志愿快讯</a></li>
						<li><a href="moreThinking.jsp">感想录</a></li>
						<%
							if (tuser != null&&!"1".equals(tuser.getLevel())) {
						%>
						<li><a href="message.jsp">信息管理</a></li>
						<li><a href="publishActivity.jsp">信息发布</a></li>
						<%
							}else{
						%>
						
						
						<li><a href="about.jsp">关于我们</a></li>
						<%} %>
					</ul>
				</div>
				<div class="collapse navbar-collapse navbar-right">
					<div id="loginDiv" style="margin-left: 20px; margin-top: 8px;">
						<a style="margin-right: 10px; color: #f2f2f2" href="person.jsp"><span><img
								style="margin-right: 10px;" class="img-rounded" width="50px"
								src="<%=basePath + tuser.getHeadImg()%>"></span><%=tuser.getNickname()%></a>


						<a style="color: #f2f2f2"
							href="<%=request.getContextPath()%>/servlet/LoginOutServlet">退出登录</a>
					</div>
				</div>

			</div>
			<!--/.container-->
		</nav>
		<!--/nav-->

	</header>
	<!--/header-->
	<div class="color-border"></div>
	<section id="inner-page">
		<div class="container">
			<div class="center">
				<h2>个人中心</h2>
				<p class="lead">
					欢迎来到VOLUNTEER！<%=tuser.getNickname()%></p>
			</div>
			<div class="center">
			    <input type="hidden" value="<%=tuser.getUserName()%>" class="form-control input-sm" id="username" name="username">
				<input type="hidden" value="<%=tuser.getUserId()%>" class="form-control input-sm" id="userId" name="userId">
				<div class="col-xs-12 col-sm-7 col-md-7">
					<img style="width: 128px;" src="<%=basePath + tuser.getHeadImg()%>"
						alt="Responsive image" class="img-rounded">
					<h3><%=tuser.getUserName()%></h3>
					<button type="button" id="change" onclick="change()"
						class="btn btn-primary btn-right">修改资料</button>
						
				</div>
				<%
					if (tUserInfo != null) {
							String realname = tUserInfo.getRealname();
							String gender = tUserInfo.getGender();
							int age = tUserInfo.getAge();
							String department = tUserInfo.getDepartment();
							String phone = tUserInfo.getPhone();
							String email = tUserInfo.getEmail();
							String address = tUserInfo.getAddress();
							String signature = tUserInfo.getSignature();
				%>
				<div
					class="col-xs-12 col-sm-4 col-md-4 col-sm-offset-1 col-md-offset-1"
					style="text-align: left" id="display">
					<p class="lead">
						昵称：<em><%=tuser.getUserName()%></em>
					</p>
					<p class="lead">
						真实姓名：<em><%=realname == null ? "" : realname %></em>
					</p>
					<p class="lead">
						性别：<em><%=gender == null ? "" : gender%></em>
					</p>
					<p class="lead">
						年龄：<em><%=age == 0 ? "" : age%></em>
					</p>
					<p class="lead">
						学院：<em><%=department == null ? "" : department%></em>
					</p>
					<p class="lead">
						电话：<em><%=phone == null ? "" : phone%></em>
					</p>
					<p class="lead">
						邮箱：<em><%=email == null ? "" : email%></em>
					</p>
					<p class="lead">
						地址：<em><%=address == null ? "" : address%></em>
					</p>
					<p class="lead">
						个人签名：<em><%=signature == null ? "" : signature%></em>
					</p>
				</div>
				<div class="col-xs-12 col-sm-5 col-md-5" id="displayForm"
					style="display: none">
					<form id="userInfo" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">昵称</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" value="<%=tuser.getUserName()%>"
									class="form-control input-sm" id="nickname" name="nickname">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">真实姓名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="realname"
									name="realname" value="<%=realname == null ? "" : realname%>">
							</div>
						</div>
						<div class="form-group">
						
							<label class="col-sm-4 col-md-4 control-label">性别</label>
							<div class="col-sm-5 col-md-5">
								
									<select class="form-control  input-sm"  id="gender"
									name="gender">
									<option value="男">男</option>
									<option value="女">女</option>
					
								</select>
							</div>
							<script>$('#gender').val('<%=gender == null ? "" : gender%>');</script>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">年龄</label>
							<div class="col-sm-5 col-md-5">
								<input type="number" class="form-control input-sm" id="age"
									name="age" value="<%=age == 0 ? "" : age%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">学院</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="department"
									name="department" value="<%=department == null ? "" : department%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">电话</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="phone"
									name="phone" value="<%=phone == null ? "" : phone%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">邮箱</label>
							<div class="col-sm-5 col-md-5">
								<input type="email" class="form-control input-sm" id="email"
									name="email" value="<%=email == null ? "" : email%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">地址</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="address"
									name="address" value="<%=address == null ? "" : address%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">个人签名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="signature"
									name="signature" value="<%=signature == null ? "" : signature%>">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-5 col-sm-offset-4">
								<button onclick="updateUserInfo()" type="button"
									class="btn btn-primary btn-right">修改信息</button>
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
						昵称：<em><%=tuser.getUserName()%></em>
					</p>
					<p class="lead">
						真实姓名：<em></em>
					</p>
					<p class="lead">
						性别：<em></em>
					</p>
					<p class="lead">
						年龄：<em></em>
					</p>
					<p class="lead">
						学院：<em></em>
					</p>
					<p class="lead">
						电话：<em></em>
					</p>
					<p class="lead">
						邮箱：<em></em>
					</p>
					<p class="lead">
						地址：<em></em>
					</p>
					<p class="lead">
						个人签名：<em></em>
					</p>
				</div>
				<div class="col-xs-12 col-sm-5 col-md-5" id="displayForm"
					style="display: none">
					<form id="userInfo" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">昵称</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" value="<%=tuser.getUserName()%>"
									class="form-control input-sm" id="nickname" name="nickname">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">真实姓名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="realname"
									name="realname">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">性别</label>
							<div class="col-sm-5 col-md-5">
								
									<select class="form-control  input-sm"  id="gender"
									name="gender">
									<option>男</option>
									<option>女</option>
					
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">年龄</label>
							<div class="col-sm-5 col-md-5">
								<input type="number" class="form-control input-sm" id="age"
									name="age">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">学院</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="department"
									name="department">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">电话</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="phone"
									name="phone">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">邮箱</label>
							<div class="col-sm-5 col-md-5">
								<input type="email" class="form-control input-sm" id="email"
									name="email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">地址</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="address"
									name="address">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label">个人签名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="signature"
									name="signature">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-5 col-sm-offset-4">
								<button onclick="insertUserInfo()" type="button"
									class="btn btn-primary btn-right">修改信息</button>
							</div>
						</div>
					</form>
				</div>
				<%
					}
				%>
				<div class="center">
					<table class="table table-hover">
						<h4>您的活动</h4>
						<tr>
							<td><strong>活动编号</strong></td>
							<td><strong>活动名称</strong></td>
							<td><strong>操作</strong></td>
						</tr>
						<%
						if(myActivities!=null){
						int number =myActivities.size();
						Set<Integer> get = myActivities.keySet(); 
				
						for (Integer test:get) {
							
						%>
						<tr>
							<td><%=myActivities.get(test).getActivityId() %></td>
							<td><%=myActivities.get(test).getTitile() %></td>
							<td><button type="button" class="btn btn-danger" onclick="cancel('<%=test %>')">取消报名</button></td>
						</tr>
						<%
						}
						}
						%>
						
					</table>
				</div>
			</div>
		</div>






	</section>
	<!--/#portfolio-item-->
	<section id="get-started">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h2>想了解更多志愿信息吗?</h2>
					<p>
						如果想知道或者加入我们的团队，请联系我们！<br>
					</p>
					<a href="about.jsp" class="btn btn-primary">联系我们</a>
				</div>
			</div>
		</div>
		<!--/.container-->
	</section>
	<!--/#get-started-->
	<div class="color-border"></div>
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">Copyright &copy; 2016 tjzyz</div>
				<div class="col-sm-6">
					<div class="follow-us">
						<a class="fa fa-facebook social-icon" href="#"></a> <a
							class="fa fa-twitter social-icon" href="#"></a> <a
							class="fa fa-linkedin social-icon" href="#"></a> <a
							class="fa fa-google-plus social-icon" href="#"></a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/#footer-->

	
</body>
<%
	}
%>
</html>