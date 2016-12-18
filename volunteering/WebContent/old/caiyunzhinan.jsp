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
				style="font-size: 20px; color: #FFFFFF">志愿活动管理</font></a></span> <span
			class="sp1"><a href="#"><font
				style="font-size: 20px; color: #FFFFFF">系统管理</font></a></span> <span
			class="sp1"><a href="introduceus.jsp"><font
				style="font-size: 20px; color: #FFFFFF">关于我们</font></a></span>
	</div>
	<div data-options="region:'center', border:false" style="height: 100%;";background:#EEEEEE">
		<div class="easyui-layout" data-options="fit:true">
			<div
				data-options="region:'west',split:true,border:false,title:'志愿者团队'"
				style="width: 200px">
				<div style="margin: 20px 0 10px 23px;">
					<img src="images/8.jpg" alt="11" height='150px' width='150px'>
				</div>
				<div align="center">同济大学彩云支南协会</div>

			</div>
			<div data-options="region:'center',split:true,border:false"
				style="width: 824px;">
				<p>一、社团名称：同济大学彩云支南协会，简称为&ldquo;彩云支南&rdquo;。</p>
				<p>二、创建时间：2009</p>
				<p>三、简介：同济彩云支南协会是在同济大学赴云南暑期调研实践团的基础上成立的社团，也是彩云支南公益联盟总部、彩云支南工作组的同济分会。</p>
				<p>四、项目所在地：云南丽江，昭通，大理，曲靖</p>
				<p>五、社团宗旨：情系云南，宣助并举，搭建平台，共谋发展</p>
				<p>
					六、社团公益项目（一级项目）<br /> 1，文化古村古镇保护项目<br />      
					该项目为彩云支南工作组一级项目，是同济大学彩云支南协会牵头的重点发展项目。<br /> <br /> 2，「云鹰计划」寒暑期夏令营<br />
					      
					该项目为复旦大学，同济大学，华东政法大学共同参与的工作组一级项目。其目的是专业化寒暑期支教，将重点打造上海地区领先的寒暑期短期支教前期培训及教案设计。该项目教案板块，复旦负责人文学科部分，同济负责自然科学，华政负责普法宣传部分。<br />
					<br /> 3，医学类调研项目<br />       该项目为同济医学院，复旦医学院等相关学院共同完成的工作组一级重点项目。<br />
					<br /> 4，环保类调研项目<br />       该项目为东华大学彩云支南协会牵头，同济彩云参与的工作组一级项目。
				</p>
				<p>
					七、社团公益项目（二级项目）<br /> 1，彩云公益讲坛<br /> 2，爱心圆梦计划<br />
					3，小豆豆上海农民工子弟辅导<br /> 4，爱心图书室及爱心衣橱
				</p>
				<p>
					八、社团名称及LOGO<br /> 1、社团名称由来<br />
					原因一：&ldquo;彩云之南&rdquo;是云南的别称，社团取名&ldquo;彩云支南&rdquo;是利用&ldquo;之&rdquo;与&ldquo;支&rdquo;的谐音关系，一语双关。<br />
					<br />
					原因二：社团内的每一个成员如同一朵&ldquo;彩云&rdquo;，团结起来&ldquo;支&rdquo;持云南的建设，并对云南开展志愿服务及各种公益活动，故将社团取名为&ldquo;彩云支南协会&rdquo;<br />
					 <br /> 社团Logo如图所示，灵感来源于云南的象征——孔雀。绿色的三撇为孔雀头上翎毛，寓意着希望。
				</p>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
						src="images/8.jpg" width="264" height="339" />
				</p>
				<p>
					<br />
				</p>
			</div>
		</div>
	</div>
	<div data-options="region:'south',split:true,border:false"
		style="height: 35px; text-align: center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body>
</html>