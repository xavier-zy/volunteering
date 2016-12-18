<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BBS</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.slideBox.js" type="text/javascript"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/styles.css">

<style type="text/css">
.sp1 {
	margin-left: 20px;
}

.div1 {
	margin-left: 10px;
	margin-top: 10px;
}

.message {
	margin-left: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.textShow {
	width: 200px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.textShow2 {
	width: 400px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.textShow3 {
	width: 170px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.textBorder {
	border-bottom: 1px solid #E4EFFF
}
/* 超链接的样式 */
a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	color: orange;
}

a:active {
	text-decoration: underline;
}

.timeDecoration {
	position: absolute;
	right: 10px;
	color: blue;
}
</style>
</head>
<body class="easyui-layout"
	style="width: 1024px; MARGIN-RIGHT: auto; MARGIN-LEFT: auto; background: #EEEEEE">
	<div data-options="region:'north'"
		style="height: 67px; background: #0769AD">
		<span><a href="index.jsp"><font size="16px"
				style="color: #FFFFFF">志愿者</font></a></span> <span style="margin-left: 50px"><a
			href="index.jsp"><font style="font-size: 20px; color: #FFFFFF">首页</font></a></span>
		<span class="sp1"><a href="person.jsp"><font
				style="font-size: 20px; color: #FFFFFF">个人中心</font></a></span> <span
			class="sp1"><a href="project.jsp"><font
				style="font-size: 20px; color: #FFFFFF">志愿活动管理</font></a></span> <span class="sp1"><a href="release.jsp"><font style="font-size:20px;color:#FFFFFF">信息发布</font></a></span> <span
			class="sp1"><a href="introduceus.jsp"><font
				style="font-size: 20px; color: #FFFFFF">关于我们</font></a></span>
	</div>
	<div data-options="region:'center', border:false" style="height: 100%;";background:#EEEEEE">
		<div class="easyui-layout" data-options="fit:true">
			<div
				data-options="region:'west',split:true,border:false,title:'志愿者团队'"
				style="width: 200px">
				<div style="margin: 20px 0 10px 23px;">
					<img src="images/6.jpg" alt="11" height='150px' width='150px'>
				</div>
				<div align="center">同济大学彩云支南协会</div>

			</div>
			<div data-options="region:'center',split:true,border:false"
				style="width: 824px;">
				<p>一、社团名称：同济共青志愿服务大队</p>
				<p>二、创建时间 ：2005</p>
				<p>三、社团规模：基地组织</p>
				<p>四、社团宗旨：坑爹</p>
				<p>
					五、简介：共青团同济大学委员会共青志愿服务大队，是直接隶属于同济大学团委的十大部门之一；是在同济大学团委的指导下负责管理、协调同济大学各级志愿服务组织及广大志愿者的组织。自2005年从校团委实践部分离至今，
					短短5年时间里，获得杨浦区&ldquo;优秀集体（团队）&rdquo;的称号，并多次得到校领导的高度评价。<br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在我们心中，志愿者是一个没有国界的名称，是指不受私人得益的驱使、不受法律强制，是基于某种道义、信念、良知、同情心和责任感，
					为改进社会而提供服务，将我们所能给予他人的一切，贡献给那些需要我们帮助的人们。而作为一个为志愿者而服务的部门，我们被称为&ldquo;志愿者的志愿者&rdquo;，这就需要以我们以更高的热情、更强的责任意识、
					更坚定的信念投入到志愿者这份事业中去。在我们的积极影响与热情感召之下，在团委老师的指导和帮助之下，同济大学志愿者队伍正不断壮大起来，并朝着一个新的高度不断迈进。
				</p>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="images/7.jpg" width="207" height="169" />
				</p>
			</div>
		</div>
	</div>

	<div data-options="region:'south',split:true,border:false"
		style="height: 35px; text-align: center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body>
</html>