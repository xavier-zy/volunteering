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
	<div data-options="region:'center',split:true,border:false"
		style="width: 824px;">

		<p>
			<img src="images/zhiyuankuaixunpic.jpg" width="50%" height="358" /><img
				src="images/zhiyuankuaixun2.jpg" width="50%" height="358" />
		</p>
		<h1 align="center">我国现有1000万注册志愿者 志愿服务组织覆盖31省市</h1>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;６日，中国志愿服务联合会副会长兼秘书长赵津芳（右）、武汉市委宣传部副部长和晓曦为全国首个志愿服务基地揭牌。</p>
		<p>
			新华网武汉７月７日电（连迅俞菲）中国志愿服务联合会副会长兼秘书长赵津芳日前在武汉表示，我国已有１０００万志愿者注册，志愿服务组织覆盖全国３１个省市。</p>
		<p>
			７月６日，首期志愿服务实践基地培训班暨&ldquo;邻里守望&rdquo;社区志愿服务座谈会在武汉百步亭社区召开。赵津芳在会上介绍，从２０１３年１２月中国志愿服务联合会成立至今，全国３１个省市建立了中国志愿服务组织，２０多个省市成立了联合会。</p>
		<p>
			中国志愿服务联合会成立以后，带动各地志愿组织迅猛发展。据介绍，长春市朝阳区桂林街道湖光社区居民总数６２４５人，目前拥有志愿者队伍１５支，志愿者１０５０名，每人参与志愿服务活动平均时长２００余小时。武汉市武昌区南湖街中央花园社区有居民８６７０余人，社区登记注册志愿者１１２９人，占总人口的１３％。社区志愿服务已成为社区居民生活不可缺少的一部分。</p>
		<p>
			特别是武汉市百步亭社区，目前有近１５万居民，注册志愿者达到近４万人。近两年，百步亭社区在全国率先发起&ldquo;邻里守望&rdquo;志愿服务活动，通过社区志愿服务全国联络总站，联动全国１．２万个社区，每年开展１０余万场次&ldquo;邻里守望&rdquo;志愿服务活动。
			发动社区志愿者关爱空巢老人、留守儿童、农民工和残障人士，与他们结对帮扶，把志愿服务工作常态化落到实处。百步亭还创新志愿服务模式，发动在职党员进社区。党员发挥职业专长，提供８小时外专业化志愿服务，做到&ldquo;工作在单位、活动在社区，奉献双岗位&rdquo;。</p>
		<p>
			&nbsp;６日，全国首个志愿服务实践基地落户武汉百步亭社区，赵津芳为基地揭牌。赵津芳说，一年多来自己三次来到百步亭，每次都有非常深的体会。她认为百步亭社区志愿服务工作站位高，打造志愿服务道德高地；定位准，彰显出中国特色；效果显著，形成一体化社区服务网络。</p>
		<p>
			赵津芳表示，中国特色的志愿服务，有&ldquo;党的领导、传统文化和学雷锋&rdquo;三个特征。作为中国志愿服务事业，不仅需要理论层面的认识，更需要实践领域的探索。中国志愿服务联合会致力于从理论和实践多维度推进中国志愿服务事业的发展，准备在全国优秀地区建立研究基地、培训基地和实践基地。</p>
		<p>
			据赵津芳介绍，中国志愿服务联合会已经建立了集宣传、服务和管理为一体的志愿服务信息系统，设计了中国志愿ＬＯＧＯ，出版了《中国志愿》杂志，创作了《搭把手》歌曲。２０１５年，中国志愿服务联合会开展邻里守望志愿服务活动，并在北京、贵阳、西安、嘉兴等地召开志愿服务现场座谈会，进一步推进邻里守望志愿服务发展。</p>
		<p>
			她说，下一步，中国志愿服务联合会将大力推进志愿服务法制化建设；推进邻里守望志愿服务活动发展；继续宣传行善立德的志愿服务发展理念；发挥共产党员示范带头作用；积极应用信息化手段推进志愿服务制度化发展；加强志愿服务理论研讨和对外交流。</p>
		<p>
			赵津芳提出，中国志愿服务的发展不仅要立足中国特色，更要有国际视野。国际的发展对中国志愿服务发展有巨大推动作用。希望通过中国志愿服务联合会的努力，能把中国志愿服务事业进一步融入世界。在中国特色志愿服务工作中，进一步坚实行善立德的理念和精神，努力把践行社会主义价值观与志愿服务很好地结合起来，为志愿服务发展提供良好的环境，汇聚志愿力量，共筑中国梦想。</p>
	</div>
	<div data-options="region:'south',split:true,border:false"
		style="height: 35px; text-align: center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body>
</html>