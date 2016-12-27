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
<title>VOLUNTEERING | admin-publish resources</title>
<meta name="description" content="">

<!-- core CSS -->
<link href="/myVolunteering/css/bootstrap.min.css" rel="stylesheet">
<link href="/myVolunteering/css/font-awesome.min.css" rel="stylesheet">
<link href="/myVolunteering/css/mycss.css" rel="stylesheet">
<link href="/myVolunteering/css/responsive.css" rel="stylesheet">
<link href="/myVolunteering/css/umeditor.min.css" rel="stylesheet">
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
							<li><a href="/myVolunteering/events.jsp">Events</a></li>
							<li><a href="/myVolunteering/JSPs/newsInResources.jsp">Resources</a></li>
							<li><a href="/myVolunteering/JSPs/stories.jsp">Stories</a></li>

							<li class="dropdown" class="active"><a
								class="dropdown-toggle" data-toggle="dropdown">Management<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li class="active"><a href="#">News publishing</a></li>
									<li class="divider">
									<li><a href="/myVolunteering/JSPs/eventsPublishing.jsp">Events
											publishing</a></li>
								</ul></li>
							<li><a href="/myVolunteering/JSPs/aboutUs.jsp">About Us</a></li>
							<li>
							<li class="dropdown"><a
								href="/myVolunteering/JSPs/myProfile&Events.jsp"
								class="dropdown-toggle" data-toggle="dropdown"><span
									class="adminname"><%=user.getUserName()%></span> </a>
								<ul class="dropdown-menu">
									<li>
										<form method="post" action="LogoutController">
											<button class="btn btn-link">Log out</button>
										</form>
									</li>
								</ul>
					</div>
				</nav>
			</div>
		</div>


		<div class="center">
			<h3>Resources Publishing Center</h3>
			<p class="lead">Manager only</p>
			<br>
			<ul class="nav nav-tabs">
				<li role="presentation"><a
					href="/myVolunteering/JSPs/eventsPublishing.jsp">publish events</a></li>
				<li role="presentation" class="active"><a
					href="#">publish resources</a></li>

			</ul>
		</div>

		<div class="panel"
			style="padding-top: 20px; background: rgba(255, 255, 255, 0.5)">
			<div class="row" style="margin-left: 10%">

				<form id="main-contact-form" class="contact-form"
					name="contact-form" method="post" action="">

					<label>tag *</label>
					<div class="form-group">
							<select class="form-control" id="tag" name="tag" style="width:10%">
								<option value="news">news</option>
								<option value="publication">publication</option>
								<option value="report">report</option>
								<option value="training">training</option>
								<option value="other">other</option>
							</select>
					</div>

					<label>news title *</label>
					<div class="form-group">
						<input type="text" name="title" id="title" class="form-control"
							required="required" style="width: 50%">
					</div>

					<label>content *</label>
					<script type="text/plain" id="myEditor"
						style="width: 800px; height: 500px;">
                            </script>
					<br>
					<div class="form-group">
						<button type="button" class="btn btn-primary"
							onclick="publishNews()">publish</button>
					</div>
				</form>
			</div>
		</div>

		<div class="footer" style="margin-top: 30px">
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
