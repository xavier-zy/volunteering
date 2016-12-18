<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@page import="com.bbs.bean.TUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	
	<style type="text/css">
	
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
    <sql:setDataSource var="projectDB" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://rdsjsuppddutzqvqdj9hi.mysql.rds.aliyuncs.com:3306/r7mvz60k1b38x4b1?user=r7mvz60k1b38x4b1&password=liyibu&useUnicode=true&characterEncoding=UTF8"/>
    <sql:query dataSource="${projectDB}" var="result">SELECT * from activity ORDER BY field(state,'招募中','进行中','已结束');</sql:query>
    <div data-options="region:'north'" style="height:67px;background:#0769AD">
	   <span><a href="index.jsp"><font size="16px" style="color:#FFFFFF">志愿者</font></a></span>	
	   <span style="margin-left:50px"><a href="index.jsp"><font style="font-size:20px;color:#FFFFFF">首页</font></a></span>
	   <span class="sp1"><a href="person.jsp"><font style="font-size:20px;color:#FFFFFF">个人中心</font></a></span>
	   <span class="sp1"><a href="project.jsp"><font style="font-size:20px;color:#FFFFFF">志愿活动管理</font></a></span>
	   <span class="sp1"><a href="release.jsp"><font style="font-size:20px;color:#FFFFFF">信息发布</font></a></span>
	   <span class="sp1"><a href="aboutus.jsp"><font style="font-size:20px;color:#FFFFFF">关于我们</font></a></span>
	   <%if(tuser == null){%>
		<span ><a class="login2" href="index.jsp">登陆</a></span>
	   <%}else{ %>
	   <span ><a class="login2" href="<%=request.getContextPath()%>/servlet/LoginOutServlet">退出登陆</a></span>
	   <span class="login"><%= tuser.getNickname()%></span>
	   
	   <%} %>
	</div>
	<div data-options="region:'east', border:false"  style="height:100%;";background:#EEEEEE">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',split:true,border:false" style="width:300px">
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',split:true,border:false,title:'活动筛选' ,collapsible:false" style="height:0px">
					</div>
					<div data-options="region:'center',split:true,border:false,collapsible:false,title:'活动状态'" style="height:20%">
						<div class="message textShow3"><span><a href="#" onclick="state1()">招募中</a></span></div>
   						<div class="message textShow3"><span><a href="#" onclick="state2()">进行中</a></span></div>
   						<div class="message textShow3"><span><a href="#" onclick="state3()">已结束</a></span></div>
   					</div>
   					<div data-options="region:'south',split:true,border:false" style="width:230px;height:80%">
   					    <div class="easyui-layout" data-options="fit:true">
				        	
				    	    <div data-options="region:'center',split:true,border:false,title:'活动区域',collapsible:false" style="height:30%">
				    	        <div class="message textShow3"><span><a href="#" onclick="index(0)">全部</a></span></div>
					    	    <div class="message textShow3"><span><a href="#" onclick="index(1)">嘉定</a></span></div>
					    	    <div class="message textShow3"><span><a href="#" onclick="index(2)">浦东</a></span></div>
					    	    <div class="message textShow3"><span><a href="#" onclick="index(3)">奉贤</a></span></div>
   					    	    <div class="message textShow3"><span><a href="#" onclick="index(4)">普陀</a></span></div>
   					    	    <div class="message textShow3"><span><a href="#" onclick="index(5)">闸北</a></span></div>
   					    	    <div class="message textShow3"><span><a href="#" onclick="index(6)">徐汇</a></span></div>
   					    	    <div class="message textShow3"><span><a href="#" onclick="index(7)">杨浦</a></span></div>
   					    	    <div class="message textShow3"><span><a href="#" onclick="index(8)">黄浦</a></span></div>
   					    	    <div class="message textShow3"><span><a href="#" onclick="index(9)">虹口</a></span></div>
   					    	    <div class="message textShow3"><span><a href="#" onclick="index(10)">其他</a></span></div>
   					        </div>
   					    </div>
					</div>
				</div>
			</div>
			<div data-options="region:'east',split:true,border:false" style="width:230px">
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
			<div data-options="region:'west',border:false,title:'活动信息',collapsible:false" style="width:550px">
			<c:forEach var="row" items="${result.rows}">
			<div class="project" index="<c:out value="${row.index2}"/>">
			    <div class="projecttitle" state="<c:out value="${row.state}"/>">
			        <a><c:out value="${row.title}"/>（<c:out value="${row.state}"/>）</a> 
			    </div>
			    <p>时间：<c:out value="${row.activityDate}"/></p>
			    <p>报名截止时间：<c:out value="${row.deadline}"/></p>
			    <p>地点：<c:out value="${row.address}"/></p>
			    <p>所需人员数：<c:out value="${row.number}"/>人左右</p>
			    <p>信息发布组织：<c:out value="${row.organizator}"/></p>
			    <button onclick="$(this).text('已报名')">报名</button>
			</div>
            </c:forEach>
			   
			</div>
		</div>
	</div>
	<div data-options="region:'south',split:true,border:false" style="height:35px;text-align:center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</body> 
<script>
function state1(){
	 var p=$(".projecttitle");
	 for(i=0;i<p.length;i++)
		{
			if(p.eq(i).attr("state")!="招募中"){p.eq(i).parent().hide();}
			else{p.eq(i).parent().show();}
		}
	
}
function state2(){
	 var p=$(".projecttitle");
	 for(i=0;i<p.length;i++)
		{
			if(p.eq(i).attr("state")!="进行中"){p.eq(i).parent().hide();}
			else{p.eq(i).parent().show();}
		}
	
}
function state3(){
	 var p=$(".projecttitle");
	 for(i=0;i<p.length;i++)
		{
			if(p.eq(i).attr("state")!="已结束"){p.eq(i).parent().hide();}
			else{p.eq(i).parent().show();}
		}
	
}
function index(a){
	var p=$(".project");
	if(a==0){
		for(i=0;i<p.length;i++)
		{
			p.eq(i).show();
		}
    }
	else if(a==10){
		for(i=0;i<p.length;i++)
		{
			if(p.eq(i).attr("index")<10&&p.eq(i).attr("index")>0){p.eq(i).hide();}
			else{p.eq(i).show();}
		}
	}
	else{
	for(i=0;i<p.length;i++)
		{
			if(p.eq(i).attr("index")!=a){p.eq(i).hide();}
			else{p.eq(i).show();}
		}
	}
}
</script>
</html>