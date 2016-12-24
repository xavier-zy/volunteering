<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.Entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VOLUNTEER | story writing</title>
<meta name="description" content="">

<!-- core CSS -->
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/font-awesome.min.css" rel="stylesheet">
<link href="/myVolunteering/css/prettyPhoto.css" rel="stylesheet">
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">
<link href="/myVolunteering/css/responsive.css" rel="stylesheet">
<link href="/myVolunteering/css/umeditor.min.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<!--/head-->

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
							<li><a href="/myVolunteering/JSPs/stories.jsp">Stories</a></li>

							<li class="dropdown" class="active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">MyVolunteering<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">Profile</a></li>
									<li class="divider">
									<li><a href="#">Events</a></li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/mySharing.jsp">Sharing</a></li>
								</ul></li>

							<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
							<li class="dropdown"><a
								href="/myVolunteering/JSPs/myProfile&Events.jsp"
								class="dropdown-toggle" data-toggle="dropdown"> <span
									class="username"><%=user.getUserName()%></span>
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
	</div>

	<section id="inner-page">
		<div class="container">
			<div class="center">
				<h2>My Story</h2>
				<p class="lead">Manager only</p>
			</div>

			<div>
				<div class="center">
					<h3>write a new story</h3>
				</div>
				<div class="row">

					<form id="main-contact-form" class="contact-form"
						name="contact-form" method="post" action="">

						<div class="col-sm-9 col-sm-offset-1">
							<div class="form-group">
								<label>title *</label> <input type="text" name="title"
									id="title" class="form-control" required="required">
							</div>
						</div>

						<div class="col-sm-10 col-sm-offset-1">
							<label>content *</label>
							<script type="text/plain" id="myEditor"
								style="width: 800px; height: 500px;">
                            </script>
							<div class="form-group">
								<button type="button" class="btn btn-primary btn-lg"
									onclick="addStory()">发布</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--/.row-->
			<br /> <br /> <br />

		</div>

		<!--/.container-->
		<br> <br>
	</section>
	<!--/#inner-page-->

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



	<script src="/myVolunteering/js/jquery.js"></script>
	<script src="/myVolunteering/js/bootstrap.min.js"></script>
	<script src="/myVolunteering/js/jquery.prettyPhoto.js"></script>
	<script src="/myVolunteering/js/jquery.isotope.min.js"></script>
	<script src="/myVolunteering/js/main.js"></script>
	<script src="/myVolunteering/js/umeditor.config.js"></script>
	<script src="/myVolunteering/js/umeditor.min.js"></script>
	<script type="text/javascript">
		//实例化编辑器
		var um = UM.getEditor('myEditor');
		um.addListener('blur', function() {
			$('#focush2').html('编辑器失去焦点了')
		});
		um.addListener('focus', function() {
			$('#focush2').html('')
		});
		//按钮的操作
		function insertHtml() {
			var value = prompt('插入html代码', '');
			um.execCommand('insertHtml', value)
		}

		function isFocus() {
			alert(um.isFocus())
		}

		function doBlur() {
			um.blur()
		}

		function createEditor() {
			enableBtn();
			um = UM.getEditor('myEditor');
		}

		function getAllHtml() {
			alert(UM.getEditor('myEditor').getAllHtml())
		}

		function getContent() {
			var arr = [];
			arr.push("使用editor.getContent()方法可以获得编辑器的内容");
			arr.push("内容为：");
			arr.push(UM.getEditor('myEditor').getContent());
			alert(arr.join("\n"));
		}

		function getPlainTxt() {
			var arr = [];
			arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
			arr.push("内容为：");
			arr.push(UM.getEditor('myEditor').getPlainTxt());
			alert(arr.join('\n'))
		}

		function setContent(isAppendTo) {
			var arr = [];
			arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
			UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
			alert(arr.join("\n"));
		}

		function setDisabled() {
			UM.getEditor('myEditor').setDisabled('fullscreen');
			disableBtn("enable");
		}

		function setEnabled() {
			UM.getEditor('myEditor').setEnabled();
			enableBtn();
		}

		function getText() {
			//当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
			var range = UM.getEditor('myEditor').selection.getRange();
			range.select();
			var txt = UM.getEditor('myEditor').selection.getText();
			alert(txt)
		}

		function getContentTxt() {
			var arr = [];
			arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
			arr.push("编辑器的纯文本内容为：");
			arr.push(UM.getEditor('myEditor').getContentTxt());
			alert(arr.join("\n"));
		}

		function hasContent() {
			var arr = [];
			arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
			arr.push("判断结果为：");
			arr.push(UM.getEditor('myEditor').hasContents());
			alert(arr.join("\n"));
		}

		function setFocus() {
			UM.getEditor('myEditor').focus();
		}

		function deleteEditor() {
			disableBtn();
			UM.getEditor('myEditor').destroy();
		}

		function disableBtn(str) {
			var div = document.getElementById('btns');
			var btns = domUtils.getElementsByTagName(div, "button");
			for (var i = 0, btn; btn = btns[i++];) {
				if (btn.id == str) {
					domUtils.removeAttributes(btn, [ "disabled" ]);
				} else {
					btn.setAttribute("disabled", "true");
				}
			}
		}

		function enableBtn() {
			var div = document.getElementById('btns');
			var btns = domUtils.getElementsByTagName(div, "button");
			for (var i = 0, btn; btn = btns[i++];) {
				domUtils.removeAttributes(btn, [ "disabled" ]);
			}
		}
	</script>
</body>

</html>
