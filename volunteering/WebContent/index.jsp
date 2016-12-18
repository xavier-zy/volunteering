<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bbs.bean.TUser,com.bbs.bean.Activity,com.bbs.bean.News,com.bbs.bean.Thoughts"%>
<%@page import="com.bbs.dao.ActivityDao,com.bbs.dao.NewsDao,com.bbs.dao.ThoughtsDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser tuser = (TUser)session.getAttribute("tuser");
ArrayList<Activity> activities = ActivityDao.getActibvityAll();
ArrayList<News> news = NewsDao.getNewsAll();
ArrayList<Thoughts> thoughts = ThoughtsDao.getAllThoughts();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>VOLUNTEER</title>
	<meta name="description" content="">

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

<body class="homepage">
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-hidden="true" >
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h2 class="modal-title" id="myModalLabel">
						登录
					</h2>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="loginForm"  name="loginForm" method="post" action="servlet/TUserServlet">
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">用户名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="userName" name="userName" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label" >密码</label>
							<div class="col-sm-5 col-md-5">
								<input type="password" class="form-control input-sm" id="passWord" name="passWord">
							</div>
						</div>  
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-10">
								<div class="checkbox">
									<label>
										<input type="checkbox"> 记住我
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-5 col-sm-offset-4">
								<button type="submit" class="btn btn-primary btn-right">
									登录
								</button> 
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-hidden="true" >
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h2 class="modal-title" id="myModalLabel">
						注册
					</h2>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="registerForm"  name="registerForm" method="post" action="servlet/RegisterServlet">
						<div class="form-group">
							<label class="col-sm-4  col-md-4 control-label">用户名</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="userName" name="userName" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label" >昵称</label>
							<div class="col-sm-5 col-md-5">
								<input type="text" class="form-control input-sm" id="nickname" name="nickname">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label" >密码</label>
							<div class="col-sm-5 col-md-5">
								<input type="password" class="form-control input-sm" id="password" name="password">
							</div>
						</div>  
						<div class="form-group">
							<label class="col-sm-4 col-md-4 control-label" >确认密码</label>
							<div class="col-sm-5 col-md-5">
								<input type="password" class="form-control input-sm" id="repeat" name="repeat">
								<span id="repeatTip"></span>
							</div>
						</div> 
						<div class="form-group">
							<div class="col-sm-5 col-sm-offset-4">
								<button type="button" class="btn btn-primary btn-right" onclick="register()" >
									注册
								</button> 
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<header id="header">
		<nav class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
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
					<%
						if (tuser == null) {
					%>
					<ul class="nav navbar-nav">
						<a data-target="#login" data-toggle="modal" href="#" class="btn btn-primary btn-sm" style="margin-top: 0">登录</a>&nbsp;&nbsp;
						<a data-target="#register" data-toggle="modal" href="#" class="btn btn-danger btn-sm " style="margin-top: 0; padding: 8px 20px; border-radius: 4px; border: none">注册</a>
					</ul>
					<%
						} else {
					%>
					<div id="loginDiv" style="margin-left: 10px; margin-top: 8px;">
						<a style="margin-right: 10px;color:#f2f2f2" href="person.jsp"><span><img style="margin-right: 10px;" class="img-rounded" width="50px" src="<%= basePath+tuser.getHeadImg()%>"></span><%=tuser.getNickname()%></a>
							
						
						<a  style="color:#f2f2f2" href="<%=request.getContextPath()%>/servlet/LoginOutServlet">退出登录</a>
					</div>
					<%} %>
				</div>

			</div>
			<!--/.container--> 
		</nav>
		<!--/nav--> 

	</header>
	<!--/header-->

	<section id="main-slider" class="no-margin">
		<div class="carousel slide">
			<div class="carousel-inner">
				<div class="item active" style="background-image: url(images/slider/bg1.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-12">
								<div class="carousel-content">
									<h1>Welcome to <span class="logo">VOLUNTEER</span></h1>
									<h2>Dedication is the essence of volunteering spirit</h2>
									<a class="btn-slide" href="#info">Read More</a> </div>
								</div>
							</div>
						</div>
					</div>
					<!--/.item-->
						<!--/.carousel-inner--> 
					</div>
					<!--/.carousel--> 
					</section>
					<!--/#main-slider-->
					<div class="color-border"> </div>

					<section >
						<div class="container">
							<div class="center" id="info">
								<h2>信息中心</h2>
								<p class="lead">同济大学志愿者网站致力于为同学们提供一个方便了解与参与志愿者活动的平台。</p>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-4 col-md-4 v-list"  style="text-align:center;background-color:#48A2DE">
									


									<h2 style="margin:20px 0;">志愿快讯</h2>
									<div style="width:90%;margin-left:5%;text-align:left">
									<%
									if(news.size()>=7){
										for(int i=0;i<7;i++){
											
									%>
									<p class="row"><a href="news.jsp?id=<%=news.get(i).getId()%>"><span class="col-xs-12 col-sm-8 col-md-8" style="color:white"><%=news.get(i).getTitle()%></span><span class="col-xs-12 col-sm-4 col-md-4" style="color:white"><%=news.get(i).getPublishtime()%></span></a></p>
									<%
										}
									}else{
										for(int i=0;i<news.size();i++){
									%>
									<p class="row"><a href="news.jsp?id=<%=news.get(i).getId()%>"><span class="col-xs-12 col-sm-8 col-md-8" style="color:white"><%=news.get(i).getTitle()%></span><span class="col-xs-12 col-sm-4 col-md-4" style="color:white"><%=news.get(i).getPublishtime()%></span></a></p>
									<%
										}
									}
									%>
									</div>
									<a class="preview" href="moreNews.jsp"><i class="fa fa-search"></i> 更多>></a> 
								</div>
								<div class="col-xs-12 col-sm-4 col-md-4 v-list"  style="text-align:center;background-color:#48A2DE">
									


									<h2 style="margin:20px 0;">项目空间</h2>
									<div style="width:90%;margin-left:5%;text-align:left">
									<%
									if(activities.size()>=10){
										for(int i=0;i<10;i++){
											
									%>
									<p class="row"><a href="activities.jsp"><span class="col-xs-12 col-sm-8 col-md-8" style="color:white"><%=activities.get(i).getTitile()%></span><span class="col-xs-12 col-sm-4 col-md-4" style="color:white"><%=activities.get(i).getActivityDate()%></span></a></p>
									<%
										}
									}else{
										for(int i=0;i<activities.size();i++){
									%>
									<p class="row"><a href="activities.jsp"><span class="col-xs-12 col-sm-8 col-md-8" style="color:white"><%=activities.get(i).getTitile()%></span><span class="col-xs-12 col-sm-4 col-md-4" style="color:white"><%=activities.get(i).getActivityDate()%></span></a></p>
									<%
										}
									}
									%>
									</div>
									<a class="preview" href="activities.jsp" ><i class="fa fa-search"></i> 更多>></a>
								</div>
								<div class="col-xs-12 col-sm-4 col-md-4 v-list"  style="text-align:center;background-color:#48A2DE">
									


									<h2 style="margin:20px 0;">感想录</h2>
									<div style="width:90%;margin-left:5%;text-align:left">
									<%
									if(thoughts.size()>=10){
										for(int i=0;i<10;i++){
											
									%>
									<p class="row"><a href="thoughts.jsp?id=<%=thoughts.get(i).getId()%>"><span class="col-xs-12 col-sm-8 col-md-8" style="color:white"><%=thoughts.get(i).getThoughtsTitle()%></span><span class="col-xs-12 col-sm-4 col-md-4" style="color:white"><%=thoughts.get(i).getPublishTime()%></span></a></p>
									<%
										}
									}else{
										for(int i=0;i<thoughts.size();i++){
									%>
									<p class="row"><a href="thoughts.jsp?id=<%=thoughts.get(i).getId()%>"><span class="col-xs-12 col-sm-8 col-md-8" style="color:white"><%=thoughts.get(i).getThoughtsTitle()%></span><span class="col-xs-12 col-sm-4 col-md-4" style="color:white"><%=thoughts.get(i).getPublishTime()%></span></a></p>
									<%
										}
									}
									%>
									</div>
									<a class="preview" href="moreThinking.jsp"><i class="fa fa-search"></i> 更多>></a> 
								</div>

      <!-- <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="recent-work-wrap"> <img class="img-responsive" src="images/portfolio/recent/item4.jpg" alt="">
          <div class="overlay">
            <div class="recent-work-inner">
              <h2>志愿快讯</h2>
              <p><a href="#"><font color="white">我国现有1000万注册志愿者 志愿服务组织覆盖31省市</font></a></p>
              <p><a href="#"><font color="white">中央文明办发布“中国好人榜”</font></a></p>
              <p><a href="#"><font color="white">沙特王子豪捐320亿美元做慈善</font></a></p>
              <a class="preview" href="images/portfolio/full/item4.jpg" rel="prettyPhoto"><i class="fa fa-search"></i> 更多>></a> </div>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="recent-work-wrap"> <img class="img-responsive" src="images/portfolio/recent/item5.jpg" alt="">
          <div class="overlay">
            <div class="recent-work-inner">
              <h2>留言板</h2>
              <p>第一条留言！哈哈</p>
              <p>沙发~~</p>
              <div class="col-xs-12 col-sm-6 col-md-6">
              <a class="preview" href="images/portfolio/full/item5.jpg" rel="prettyPhoto"><i class="fa fa-search"></i> 更多>></a> </div>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-6">
              <a href="#"><font color="white"> 我要留言>></font></a> </div>
              </div>
          </div>
      </div> -->
  </div>
      <!-- <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="recent-work-wrap"> <img class="img-responsive" src="images/portfolio/recent/item6.jpg" alt="">
          <div class="overlay">
            <div class="recent-work-inner">
              <h3><a href="#">Lorem Ipsum</a></h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non odio sed eros tristique bibendum.</p>
              <a class="preview" href="images/portfolio/full/item6.jpg" rel="prettyPhoto"><i class="fa fa-search"></i> 更多>></a> </div>
          </div>
        </div>
    </div> -->   
    <!--/.row-->    
</div>  
<!--/.container--> 
</section>
<!--/#recent-works-->


<section id="middle">
	<div class="container">
		<div class="row">
			<div class="center">
				<h3>留言：</h3>		
				<p>您的评论对我们也很重要哦</p>
			</div>
			<!-- <div class="row"> -->
			<div class="col-xs-12 col-sm-8 col-md-8 col-md-offset-2">
				<div class="">
					<textarea class="form-control" id="message" rows="6"></textarea>
				</div>		
			</div>
			<div class="col-xs-12 col-sm-2 col-md-2" style="margin-top:80px;">
				<button type="button" class="btn btn-info" onclick="insertMessage('<%=tuser!=null?tuser.getUserName():"" %>')">提交</button>
			</div>
			<!-- </div> -->
			<!-- <div class="row"> -->
			<div class="col-xs-12 col-sm-8 col-md-8 col-md-offset-2">
			</div>
			<!-- </div> -->
			<div class="col-sm-6" style="margin-left:450px;">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;志愿充实生活</h3>
				<br>
				<div class="media"> <i class="fa fa-smile-o pull-left fa-3x"></i>
					<div class="media-body">
						<h3 class="media-heading"> 造福他们 收获快乐</h3>
						总是走在给生命赋予特殊意义的路上</div>
					</div>
					<br>
					<div class="media"> <i class="fa fa-check-square-o pull-left fa-3x"></i>
						<div class="media-body">
							<h3 class="media-heading"> 实现自我价值 </h3>
							每天都有更多的大学生加入到志愿者的行列</div>
						</div>
						<br>
						<div class="media"> <i class="fa fa-trophy pull-left fa-3x"></i>
							<div class="media-body">
								<h3 class="media-heading"> 更美好的明天 </h3>
								越来越多的人从中受益</div>
							</div>
						</div>
						<!--/.col-sm-6-->
					</div>
					<!--/.row--> 
				</div>
				<!--/.container--> 
			</section>
			<!--/#middle-->


			<section id="get-started">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<h2>志愿者协会会员群</h2>
							<p>qq:123456789<br>
							</p>
							<a href="about.jsp" class="btn btn-primary">联系我们</a> </div>
						</div>
					</div>
					<!--/.container--> 
				</section>
				<!--/#get-started-->

				<div class="color-border"> </div>
				<footer id="footer">
					<div class="container">
						<div class="row">
							<div class="col-sm-6">Copyright &copy; 2016 tjzyz</div>
							<div class="col-sm-6">
								<div class="follow-us"> <a class="fa fa-facebook social-icon" href="#"></a> <a class="fa fa-twitter social-icon" href="#"></a> <a class="fa fa-linkedin social-icon" href="#"></a> <a class="fa fa-google-plus social-icon" href="#"></a> </div>
							</div>
						</div>
					</div>
				</footer>
				<!--/#footer--> 

				<script src="js/jquery.js"></script> 
				<script src="js/bootstrap.min.js"></script> 
				<script src="js/jquery.prettyPhoto.js"></script> 
				<script src="js/jquery.isotope.min.js"></script> 
				<script src="js/main.js"></script>
			</body>
			</html>