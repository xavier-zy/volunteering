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

		
		<h1 align="center">做志愿者的感想</h1>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以前一直以为做志愿者只是一时爱心泛滥帮助别人，通过这段时间的志愿者服务的经历。我有了不一样的感受。</p>
		<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一、做志愿者是在帮自己。我们看看做志愿者的过程我们得到了什么：首先，我们的想要帮助别人的心得到了满足，这是一种自我价值的实现与肯定。我有个同学，曾经是在学生圈里不受欢迎的那种，
			平时也不参加班里的活动，跟谁都好像是君子之交----淡如水的，谁都不知道，这样不合群的他竟然是个活跃的志愿者！他到福利院，所有的小孩都愿意缠着他跟他玩，他到老人院，每位老人都会热情的跟他打招呼。我问他为什么，他说，本来人际交往对他来说是一个心理障碍，
			但是有一天他来到这里，看见这些让人心疼的人，他突然就放开了自己，他慢慢地学会主动地接触每个人，对每个人微笑，结果是，他换来了每个人的微笑。原来的自我否定瞬间瓦解，在这里，他的价值得到了所有人的肯定和感谢。他说：&ldquo;做志愿者的时候是快乐的，
			像有瘾一样，每个星期都要来做，哪个星期没来就心理难受。&rdquo; 其次，做志愿者总有意外的惊喜。就我自己来说，我最好的朋友是在志愿者的队伍里认识的。我们一起工作，一起吃饭盒，一起睡在简陋的房间里，一起讨论我们的项目。这样难得的经历使我们走得更近，
			我们常开玩笑说：我们是一起患过难的姐妹！不仅如此，志愿者让我从一个不喜欢小孩子的人变成了一个一见到小朋友就心花怒放的人；志愿者让我从一个肉食主义者变成了一个素食主义的支持者；志愿者的名字让我骄傲，让我温暖，让我幸福……最后，也是最重要的一点，志愿者的队伍，
			给我们提供了一个绝佳的平台去帮助别人。一个麻木冷漠的社会是可怕的，身边总有人是需要我们帮助的，打开报纸、电视机，看见他们也许身残，也许贫困，也许病重，也许有难以逾越的心理障碍，他们正需要我们的帮助！歌中唱得好：只要人人都献出一点爱，世界将变成美好的人间！</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、我认为，做志愿者除了帮助了自己帮助了别人，也对社会文明的进步起到非常重要的作用。说到这里，我想到一个电影，叫做《充气娃娃之恋》，有些自闭的男主人公把一个充气娃娃当成自己的好朋友，
			好像她像一个真正的人一样存在着。试想一下，如果你身边也有一个这样的人，你会有什么样的反应呢？是觉得这个人很神经病，离他远远地？还是直接把他送到疯人院去？不得而知。在电影里，男主人公的亲人、朋友、同事、甚至教会的人和陌生人，知道了他的故事后都自愿地配合他，
			好像充气娃娃真的是一个人！他们以这种方式给他安慰，给他爱，慢慢的，治愈了男主人公的自闭症状。我记得有一幕是开始他们不知道如何处理充气娃娃的事时，有人问了一句：&ldquo;Whatwill
			goddo？&rdquo;然后，他们决定以爱的方式接受这个和充气娃娃交朋友的男人。
			我在想，我们接受了志愿者精神的洗礼之后，是不是应该以一个更加包容和热情的态度去对待这个社会。当你在社会中吃了亏的时候，如果能问自己一句，&ldquo;志愿者是怎么做的？&rdquo;也许你的世界会更加开阔幸福！</p>
	</div>
	<div data-options="region:'south',split:true,border:false"
		style="height: 35px; text-align: center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body>
</html>