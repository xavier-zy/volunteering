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
	String aid= stories.get(amount-1).getStoryId() + "";
	Stories theStory = StoriesHandler.getStoryByStoryId(aid);
	ArrayList<Comment> comments = CommentHandler.getCommentsByStoryId(aid);

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

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEERING | stories</title>
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
						<li><a href="/myVolunteering/index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
						<li><a href="/myVolunteering/events.jsp">Events</a></li>
						<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>
						<li class="active"><a href="#">Stories</a></li>
						

						<li class="dropdown"><a href="my%20volunteering.html"
							class="dropdown-toggle" data-toggle="dropdown">MyVolunteering<strong
								class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="/myVolunteering/myProfile&Events.jsp">Profile</a>
								</li>
								<li class="divider">
								<li><a href="/myVolunteering/myProfile&Events.jsp">Events</a>
								</li>
								<li class="divider">
								<li><a href="/myVolunteering/JSPs/mySharing.jsp">Sharing</a></li>
							</ul></li>

						<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
						<li>
							<% if (user == null) {%>
							<button type="submit" class="btn btn-link">
								<a href="/myVolunteering/JSPs/Login.jsp">Log in</a>
							</button>
							|
							<button type="button" class="btn btn-link navbar-btn">
								<a href="/myVolunteering/JSPs/Signup.jsp">Sign up</a>
							</button> 
						</li>
							<% } else { %>
							<li class="dropdown">
	 							<a href="/myVolunteering/JSPs/myProfile&Events.jsp" 
	 							class="dropdown-toggle" data-toggle="dropdown">
	 							<%
 	if (user.getLevel().equals("0")) {
 %> <span class="adminname"><%=user.getUserName()%></span> <%
 	} else {
 %> <span class="username"><%=user.getUserName()%></span> <%
 	}
 %>
	 							</a>
									<ul class="dropdown-menu">
										<li>
										<form method="post" action="LogoutController">
											<button class="btn btn-link">Log out</button>
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
		
		
			<div class="row clearfix">
			<main class="col-md-8 main-content">
			<div class="post">
			<div style="text-align: center">
				<h2><%=theStory.getTitle()%></h2>
				<span style="float: center;"> Author:&nbsp;<span class="username"><%=UserHandler.getTUserById(theStory.getUserId()).getUserName()%></span>&nbsp;&nbsp;&nbsp;
					Publish time:&nbsp;<%=theStory.getWrittenTime()%>&nbsp;&nbsp;&nbsp;

					<span class="glyphicon glyphicon-heart"
					style="color: rgb(255, 60, 64);"></span> <%=theStory.getLike()%>&nbsp;&nbsp;&nbsp;

					<button type="button" class="btn btn-link"
						onclick="addLike('<%=aid%>')">
						<span class="glyphicon glyphicon-thumbs-up"
							style="color: rgb(255, 128, 47);"></span> like the story
					</button>
				</span> 
			</div><br>
			<div class="post-content">
						<%=theStory.getContent()%></div>
			</div>

			<div class="comments_block">

				<h4>Comments:</h4>
				<%
					if (comments != null) {
				%>
				<%
					for (int i = 0; i < comments.size(); i++) {
				%>
				<%
					if (comments.get(i).getReplyId() < 0) {
				%>

				<div class="comments">
					<p class="meta">
						<%=comments.get(i).getUserName()%>&nbsp;<%=comments.get(i).getCommentTime()%>
					</p>
					<div class="comments_content">
						<p>
							<%=comments.get(i).getCommentContent()%>
						</p>

						<%
							if (user != null && user.getLevel().equals("1")) {
						%>
						<button id="show" class="reply">Reply</button>

						<form id="form" style="display: none;"
							enctype="multipart/form-data">
							<textarea name="uploadText" id="uploadText" rows="5" cols="60"
								placeholder="Your Comment"></textarea><br>
							<button type="submit" class="btn btn-success"
								onclick="addComment('<%=comments.get(i).getCommentId()%>',
								'<%=user.getUserName()%>',
								'<%=comments.get(i).getStoryId()%>')">
								Submit</button>
							<button id="hide" type="button" class="btn btn-danger"
								value="Cancel">Cancel</button>
						</form>
						<%
							} else {
						%>
						<button class="reply" onclick="pleaseLogin()">Reply</button>

						<%
							}
						%>
						<div class="clr"></div>
						<div class="reply_icon"></div>
					</div>
				</div>
				<%
					}
				%>

				<%
					if (-1 != comments.get(i).getReplyId()) {
				%>
				<div class="comments reply">
					<p class="meta">
						<%=comments.get(1).getUserName()%>&nbsp;<%=comments.get(1).getCommentTime()%>
					</p>
					<div class="comments_content">
						<p>
							<%=comments.get(i).getCommentContent()%>
						</p>
						<%
							if (user != null && user.getLevel().equals("1")) {
						%>
						<button id="show" class="reply">Reply</button>

						<form id="form" style="display: none;"
							enctype="multipart/form-data">
							<textarea name="uploadText" id="uploadText" rows="5" cols="60"
								placeholder="Your Comment"></textarea>
							<button type="submit" class="btn btn-success"
								onclick="addComment('<%=comments.get(i).getCommentId()%>',
								'<%=user.getUserName()%>',
								'<%=comments.get(i).getStoryId()%>')">
								Submit</button>
							<button id="hide" type="button" class="btn btn-danger"
								value="Cancel">Cancel</button>
						</form>
						<%
							} else {
						%>
						<button class="reply" onclick="pleaseLogin()">Reply</button>

						<%
							}
						%>

						<div class="clr"></div>
						<div class="reply_icon"></div>
					</div>
				</div>
				<%
					}
				%>

				<%
					}
					}
				%>

				<!-- Comment Form -->
				<h5>Write a Comment</h5>

				<%
					if (user != null && user.getLevel().equals("1")) {
				%>
				<form id="form" enctype="multipart/form-data">
					<textarea name="uploadText" id="uploadText" rows="5" cols="60"
						placeholder="Your Comment"></textarea><br>
					<button type="submit" class="btn btn-success"
						onclick="addComment('-1',
								'<%=user.getUserName()%>',
								'<%=theStory.getStoryId()%>')">
						Submit</button>
				</form>
				<%
					} else {
				%>

				<form id="form" enctype="multipart/form-data">
					<textarea name="uploadText" id="uploadText" rows="5" cols="60"
						placeholder="Your Comment"></textarea><br>
					<button type="submit" class="btn btn-success"
						onclick="pleaseLogin()">Submit</button>
				</form>
				<%
					}
				%>

			</div>
			</main>

			<aside class="col-md-4">
				<div class="mysidebar">
					<div class="widget">
						<h4 class="title" style="font-size: 1.5em; font-weight: 400;">Events
							list</h4>
						<table class="table table-hover">
							<tr>
								<td style="text-align:left"><strong>story title</strong></td>
								<td><strong>liked</strong></td>
								<td></td>
							</tr>

							<%
								/* if (index < lastPage) { */
								for (int i = 0; i < stories.size(); i++) {
							%>
							<tr>

								<td style="text-align:left"><%=stories.get(i).getTitle()%></td>
								<td style="color:rgb(255, 0, 0)"><%=stories.get(i).getLike()%></td>
								<td><a
									href="../storyDetais.jsp?id=<%=stories.get(i).getStoryId()%>">more</a>
								</td>
							</tr>

							<%
								/* } */
								}
							%>


						</table>

					</div>
				</div>
			</aside>

		</div>

		<div class="footer">
			<div class="mypanel">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2016 T_11 for Java EE
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
</body>

</html>
