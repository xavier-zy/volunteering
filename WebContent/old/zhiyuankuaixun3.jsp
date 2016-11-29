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
			<img src="images/satewangzi.jpg" width="50%" height="366" /><img
				src="images/satewangzi2.jpg" width="50%" height="366" />

		</p>
		<h1 align="center">沙特王子豪捐320亿美元做慈善</h1>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中东土豪们一掷千金享受生活的新闻已经屡见不鲜了，然而捐出全部家当做慈善的却不多，沙特王子瓦利德·本·塔拉勒便是其中一个。
			据英国路透社报道，瓦利德王子7月1日宣布未来几年将向慈善组织捐献自己的全部家当320亿美元（约合1984亿元人民币），来帮助疾控、灾难救助和女性权益事业的发展。瓦利德王子可不是一般的有钱，
			自2005年起他便连续11年高居中东首富之位，有&ldquo;中东股神&rdquo;、&ldquo;阿拉伯的巴菲特&rdquo;之称。</p>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓦利德王子是沙特阿拉伯开国国君第21位王子的子嗣，父亲曾是沙特驻法国大使，母亲是现代黎巴嫩第一任总理之女。说到这里，你肯定会说这不就是个富二代吗？但其实，他的财富绝大部分是凭借自己卓越的商业智慧得来。1979年从美国旧金山门罗学院学成归国后，瓦利德王子利用父亲提供的1.5万美元开始创业，并在第二次石油危机时赚了个盆满钵满。</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&ldquo;土豪&rdquo;的生活总是奢华无比，瓦利德王子也不例外。2011年，他成为了空客A380飞机的首位私人买主，并且还是被称为&ldquo;飞行宫殿&rdquo;的超豪华型。除了私人客机，阿尔瓦利德还有一艘每年开销达到六百万美元的私人游艇。2002年，
			为庆贺自己豪华饭店的落成，瓦利德举行了一场&ldquo;隆重演唱会&rdquo;，76名中东歌手应邀出席，而让他们没想到的是，他们每个人都获得了一辆豪车作为回报。</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2013年，瓦利德王子宣布与第四任妻子离婚，恢复了自己中东最大&ldquo;钻石王老五&rdquo;的称号。王子对自己的家人也从不吝啬，儿子对汽车着迷，瓦利德王子就给他买了一辆价值25万美元的兰博基尼跑车；女儿喜欢唐那凯伦的时装，王子就买下该品牌价值2000万美元的股份，送给当时才15岁的女儿。</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虽然生活奢华，但瓦利德王子却从不吝啬做慈善。早在2002年，他便向美国安多佛菲利普斯中学捐款50万美元（约合310万元人民币），帮助设立乔治·布什奖学金。</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2004年印尼9.3级大地震海啸灾难，死亡人数超过20万人。瓦利德王子也慷慨捐赠了1700万美元（约合1.05亿元人民币），用于救灾和灾民安置。</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓦利德此次捐款的目的之一是帮助女性权益事业的发展。他曾资助沙特第一名航空公司女飞行员Hanadi，并在她的毕业典礼上承诺自己&ldquo;始终全力支持沙特女性到各行各业工作&rdquo;。正是在他的支持下，Hanadi得以于2014年正式上岗工作。</p>
	</div>
	<div data-options="region:'south',split:true,border:false"
		style="height: 35px; text-align: center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body>
</html>