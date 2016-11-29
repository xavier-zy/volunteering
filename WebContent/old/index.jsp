<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bbs.bean.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser tuser = (TUser)session.getAttribute("tuser");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>BBS</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#quit{
	
	}
	#quit:hover {text-decoration:none;color:orange;}
	#quit:active {text-decoration:underline;}
	.sp1{margin-left:20px;}
	.div1{margin-left:10px; margin-top:10px;}
	.message{
		margin-left:10px; 
		margin-top:5px;
		margin-bottom:5px;
	}
	.textShow{
		width:200px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.textShow2{
		width:400px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.textShow3{
		width:170px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.textBorder{border-bottom: 1px solid #E4EFFF}
	/* 超链接的样式 */
	a:link {text-decoration:none; color:black;}
	a:visited {text-decoration:none;}
	a:hover {text-decoration:none;color:orange;}
	a:active {text-decoration:underline;}
	
	.timeDecoration{
		position:absolute ; 
		right:10px;
		color:blue;
	}
	</style>
  </head>
  <body class="easyui-layout" style="width:1024px;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;background:#EEEEEE">
	<div data-options="region:'north'" style="height:67px;background:#0769AD">
	   <span><a href="index.jsp"><font size="16px" style="color:#FFFFFF">志愿者</font></a></span>	
	   <span style="margin-left:50px"><a href="index.jsp"><font style="font-size:20px;color:#FFFFFF">首页</font></a></span>
	   <span class="sp1"><a href="person.jsp"><font style="font-size:20px;color:#FFFFFF">个人中心</font></a></span>
	   <span class="sp1"><a href="project.jsp"><font style="font-size:20px;color:#FFFFFF">志愿活动管理</font></a></span>
	   <span class="sp1"><a href="release.jsp"><font style="font-size:20px;color:#FFFFFF">信息发布</font></a></span>
	   <span class="sp1"><a href="aboutus.jsp"><font style="font-size:20px;color:#FFFFFF">关于我们</font></a></span>
	</div>
	<div data-options="region:'center', border:false"  style="height:100%;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'east',split:true,border:false" style="width:250px">
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',split:true,border:false,title:'网站介绍' ,collapsible:false" style="height:150px">
						<div style="margin-left:10px;margin-top:10px;">
							同济大学志愿者网站致力于为同学们提供一个方便了解与参与志愿者活动的平台。
						</div>
					</div>
					<div data-options="region:'center',split:true,border:false,collapsible:false,title:'项目空间'" style="height:200px">
						<div class="message textShow3"><span><a href="#">敬老服务招募</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
   						<div class="message textShow3"><span><a href="#">地铁志愿者招募</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
   						<div class="message textShow3"><span><a href="#">赛车志愿者招募</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
   						<div class="message textShow3"><span><a href="#">博物馆志愿者招募</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
   						<div class="message textShow3"><span><a href="#">城市志愿服务站<br/>志愿者招募</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
					    <div style="position:absolute ; right:10px; bottom:5px;"><a href="#">更多>></a></div>
					</div>
					<div data-options="region:'south',split:true,border:false,title:'感想录',collapsible:false" style="height:250px">
						<div class="message textShow3"><span><a href="hetangyuese.jsp">荷塘月色滴答滴答滴答滴答滴答滴答滴答滴答</a></span><span class="timeDecoration">05-09</span></div>
   						<div class="message textShow3"><span><a href="zhiyuanganxiang.jsp">做志愿者的感想</a></span><span class="timeDecoration">05-09</span></div>
   						<div class="message textShow3"><span><a href="zhiyuanzheganxaing2.jsp">志愿者感想</a></span><span class="timeDecoration">05-09</span></div>
						<div style="position:absolute ; right:10px; bottom:5px;"><a href="#">更多>></a></div>
						<div style="position:absolute ; left:10px; bottom:5px;"><a href="#">发表感想</a></div>
					</div>
				</div>
			</div>
			<div data-options="region:'west',split:true,border:false" style="width:230px">
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',split:true,border:false,title:'会员登录',collapsible:false" style="height:170px">
						<%if(tuser == null){%>
						<form id="loginForm"  name="loginForm" method="post">
							<div style="margin-left:18px;margin-top:15px;">
								<div style="margin-bottom:5px;">
									<input id="userName" name="userName" class="easyui-textbox" style="width:90%;height:25px;padding:12px" data-options="prompt:'帐号',iconCls:'icon-man',iconWidth:38">
								</div>
								<div style="margin-bottom:5px">
									<input id="passWord" name="passWord" class="easyui-textbox" type="password" style="width:90%;height:25px;padding:12px;margin-left:20px" data-options="prompt:'密码',iconCls:'icon-lock',iconWidth:38">
								</div>
								<div>
									<a href="#"  onclick="login()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:90%; height:25px">
										<span style="font-size:14px;">登录</span>
									</a>
								</div>
							</div>
						</form>
						<div style="margin-left:50px; margin-top:10px;">
							<span><a href="#">找回密码</a></span>
							<span style="margin-left:20px"><a href="register.jsp">立即注册</a></span>
						</div>
						<%}else{ %>
						<div id="loginDiv" style="margin-left:20px;margin-top:20px;">
							<div>欢迎您：<%= tuser.getNickname()%></div>
							<div>用户级别:
							<%if("1".equals(tuser.getLevel())){out.print("普通用户");}else{out.print("管理员");} %>
							</div>
							<div>最后登录时间:<%= tuser.getLastlogin().toString()%></div>
							<div style="height:20px;"></div>
							<a href="<%=request.getContextPath()%>/servlet/LoginOutServlet">退出登陆</a>
						</div>
						<%} %>
					</div>
					<div data-options="region:'center',split:true,border:false,title:'志愿团队' ,collapsible:false" style="height:380px">
						<div class="message" style=""><a href="zhiyuanfuwudadui.jsp">同济大学志愿服务大队</a><br/></div>
						<div class="message  textBorder textShow"> 校团委下属十大组织</div>
						<div class="message"><a href="caiyunzhinan.jsp">彩云之南</a><br/></div>
						<div class="message  textShow textBorder"> 同济彩云团队于2009年4月成立，是由上海同济大学一群爱心于公益，来自于不同学院、年级学生所组成的团队。</div>
						<div class="message"><a href="#">同济大学绿色之路协会</a><br/></div>
						<div class="message textBorder textShow"> 同济大学绿色之路协会成立于 1999年 3 月，正式注册于 2000 年 10 月，是同济大学在校学生在共同理想的基础上自愿组织起来的群众性团体，是同济大
						学目前唯一以宣传环保知识，普及环保理念，发展环保事业为主旨的协会。</div>
						<div style="position:absolute ; right:15px; bottom:5px;"><a href="#">更多>></a></div>
					</div>
					<div data-options="region:'south',split:true,border:false,title:'留言板' ,collapsible:false" style="height:250px">
						<div class="message"><a href="#">张三</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015-05-09 11:53<br/></div>
						<div class="message  textBorder textShow"> 俺是第1条留言！经很久很久很久很久经很久很久很久很久很久很久很久很久很久很久后经很久很久很久很久很久很久很久很久很久很久很久很久很久很久很久很久</div>
						<div class="message" ><a href="#">张三</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015-05-09 11:53<br/></div>
						<div class="message  textBorder textShow"> 俺是第2条留言！经很久很久很久很久经很久很久很久很久很久很久很久很久很久很久后经很久很久很久很久很久很久很久很久很久很久很久很久很久很久很久很久</div>
						<div class="message"><a href="#">张三</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015-05-09 11:53<br/></div>
						<div class="message  textShow textBorder"> 俺是第3条留言！经很久很久很久很久经很久很久很久很久很久很久很久很久很久很久后经很久很久很久很久很久很久很久很久很久很久很久很久很久很久很久很久</div>
						<div class="message"><a href="#">张三</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015-05-09 11:53<br/></div>
						<div style="position:absolute ; left:10px; bottom:5px;"><a href="#">我要留言</a></div>
						<div style="position:absolute ; right:15px; bottom:5px;"><a href="#">更多>></a></div>
					</div>
				</div>
			</div>
			<div data-options="region:'center',border:false">
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',split:true,border:false,title:'志愿者风采',collapsible:false" style="height:350px">
					  <div id="demo1" class="slideBox" style="margin:5px;">
					  	<ul class="items">
    						<li><a href="#" title="奉献友爱互助进步"><img src="images/11.jpg" alt="11"width="520"height="290"> </a></li>
    						<li><a href="#" title="志愿大扫除"><img src="images/12.jpg" alt="22"width="520"height="290"></a></li>
    						<li><a href="#" title="地铁服务"><img src="images/13.jpg" alt="33"width="520"height="290"></a></li>
    						<li><a href="#" title="文明交通"><img src="images/14.jpg" alt="44"width="520"height="290"></a></li>
    						<li><a href="#" title="敬老奉献"><img src="images/15.jpg" alt="66"width="520"height="290"></a></li>
					    	<li><a href="#" title="敬老服务"><img src="images/16.jpg" alt="77"width="520"height="290"></a></li>
					    	<li><a href="#" title="活动宣传"><img src="images/17.jpg" alt="88"width="520"height="290"></a></li>
					    	<li><a href="#" title="服务到家"><img src="images/18.jpg" alt="99"width="520"height="290"></a></li>
					    	<li><a href="#" title="社区服务"><img src="images/19.jpg" alt="10"width="520"height="290"></a></li>
  						</ul>
					  </div>
					</div>
					<div data-options="region:'center',split:true,border:false,collapsible:false,title:'志愿快讯'">
						<div class="message textShow2"><span><a href="zhiyuankuaixun1.jsp">我国现有1000万注册志愿者 志愿服务组织覆盖31省市</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
   						<div class="message textShow2"><span><a href="zhuyuankuaixun2.jsp">中央文明办发布6月“中国好人榜”</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
   						<div class="message textShow2"><span><a href="zhiyuankuaixun3.jsp">沙特王子豪捐320亿美元做慈善</a></span><span class="timeDecoration">2015-05-09 16:03</span></div>
   						
					    <div style="position:absolute ; right:10px; bottom:5px;"><a href="#">更多>></a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'south',split:true,border:false" style="height:35px;text-align:center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body> 
<script>
jQuery(function($){
	$('#demo1').slideBox({
		titlegeight : 20,
		clickBarRadius : 10,
	});
	$('#demo2').slideBox({
		direction : 'top',//left,top#方向
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		startIndex : 1//初始焦点顺序
	});
	$('#demo3').slideBox({
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 3,//滚动延迟时间，单位：秒
		//hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 10
	});
	$('#demo4').slideBox({
		hideBottomBar : true//隐藏底栏
	});
});

$('#quit').click(function(){
	var keys=document.cookie.match(/[^ =;]+(?=\=)/g);
	if(keys){
		for(var i=keys.length;i--;)
			document.cookie=keys[i]+='=0;expires='+new Date(0).toUTCString()
	}
});

function login(){
	
	var userName = $("#userName").val();
	var passWord = $("#passWord").val();
	if(passWord==""||userName==""){
		alert("请输入用户名和密码。");
	}else{
	document.loginForm.target="_self";
	document.loginForm.action="<%=request.getContextPath()%>/servlet/TUserServlet?userName="+userName+"&passWord="+passWord;
	document.loginForm.submit();
	}
}
</script>
</html>