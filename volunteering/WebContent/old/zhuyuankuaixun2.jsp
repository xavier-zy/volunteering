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
				style="font-size: 20px; color: #FFFFFF">个人中心</font></a></span> <span class="sp1"><a href="release.jsp"><font style="font-size:20px;color:#FFFFFF">信息发布</font></a></span> <span
			class="sp1"><a href="#"><font
				style="font-size: 20px; color: #FFFFFF">系统管理</font></a></span> <span
			class="sp1"><a href="introduceus.jsp"><font
				style="font-size: 20px; color: #FFFFFF">关于我们</font></a></span>
	</div>
	<div data-options="region:'center',split:true,border:false"
		style="width: 824px;">
		<h1 align="center">中央文明办发布6月“中国好人榜”</h1>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新华网合肥７月２日电
			中央文明办２日在安徽省安庆市举办全国道德模范与身边好人现场交流活动，并发布６月&ldquo;中国好人榜&rdquo;。在上榜的１０７位身边好人中，有近６０名党员干部，他们以自己助人为乐、见义勇为、诚实守信、敬业奉献、孝老爱亲的实际行动，树立了新时期共产党人的良好形象。</p>
		<p>
			好人是你我身边的感动，是时代精神的标杆。近年来，在各地不断涌现出的凡人善举、身边好人中，党员干部始终是领头雁、主力军。6月份&ldquo;我推荐我评议身边好人&rdquo;活动，共收到有效线索６２００多件，其中超过半数推举的是党员干部。９０后海军潜水员官东，在湖北监利长江沉船事故中冒险救人；八旬退休干部肖而乾，扎根江西山村２０年带领乡亲致富；９０后大学生党员孟瑞鹏，湖中勇救儿童献出年轻生命；居委会主任朱国萍，２５年热情服务居民，被誉为&ldquo;小巷总理&rdquo;；广东公安民警谭耀华，从警３５年、不离一线到生命的最后一刻；河北企业家吴振山，坚守党员优秀品格、３５年打造&ldquo;无字碑&rdquo;诚信工程等等。广大党员干部无论在平凡岗位还是在危难时刻，都始终把人民利益放在首位，把群众幸福作为最大追求，自觉实践党的宗旨。他们坚守对党的忠诚、饱含对人民的深情，在平凡的工作和生活中，勇做社会主义核心价值观的先行者、示范者和传播者，践行着共产党人的理想信念和价值追求，在广大群众中引起热烈反响。本月活动页面浏览量达１２２０余万人次、留言２９万条，许多网民感慨，社会上还是好人多，好人中间党员干部多。</p>
		<p>
			安庆市历史悠久，王祥卧冰求鲤、桐城&ldquo;六尺巷&rdquo;等中华美德故事都发源于此，有着深厚的文化底蕴和道德传统。在交流活动上，官东和彭伟平、张宝、李传代等道德模范、中国好人一道，与现场观众进行面对面的交流，讲述亲身经历、分享心得体会。活动还通过播放事迹短片、黄梅戏唱好人、道德基金帮扶、赠送好人传家宝、行业代表倡议等形式，传诵好人故事、传扬好人精神。场内响起一阵阵热烈掌声，许多观众潸然泪下、感动不已。</p>
		<p>
			由中央文明办主办、中国文明网承办的&ldquo;我推荐我评议身边好人&rdquo;活动开展七年来，至今已发掘好人好事线索３４万多件，发布&ldquo;中国好人榜&rdquo;７７期，近８０００人光荣上榜，３５亿人次网民、观众参与推荐、评议、投票和现场交流互动。</p>
	</div>
	<div data-options="region:'south',split:true,border:false"
		style="height: 35px; text-align: center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body>
</html>