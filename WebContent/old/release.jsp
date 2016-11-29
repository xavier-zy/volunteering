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
<%if(tuser == null){//判断是否登陆%>
  <script type="text/javascript">
  alert("您还未登陆，请登陆。");
  window.location.href="index.jsp";
  </script>
<%}else{ %>			
<%if(!tuser.getLevel().equals("0")){//判断是否为管理员%>
<script type="text/javascript">
  alert("您不是管理员，不能发布信息。");
  window.location.href="index.jsp";
</script>
<%}else{ %>		
  <body class="easyui-layout" style="width:1024px;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;background:#EEEEEE">
  <sql:setDataSource var="personDB" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://115.28.46.153:3306/tjzyz?user=root&password=liyibu&useUnicode=true&characterEncoding=UTF8"/>
  <sql:query dataSource="${personDB}" var="result">select * from TUSER,tuserinfo where TUSER.userId=tuserinfo.userid and TUSER.userName="<%=tuser.getUserName()%>";</sql:query>

  <c:forEach var="row" items="${result.rows}">
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

	<div data-options="region:'center', border:false"  style="height:100%;";background:#EEEEEE">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',split:true,border:false" style="width:824px;">
			<div  align="center">
				<form class="projectform" id="projectForm"  name="projectForm" method="post" align="left">
				活动名称：<input type="text" name="title" id="title"/>
                <br/><br/>
                                          活动时间：<input type="text" name="activityDate" id="activityDate"/>
                <br/><br/>
                                          报名截止时间：<input type="text" name="deadline" id="deadline"/>
                <br/><br/>
                                          参与人数：<input type="text" name="number" id="number"/>
                <br/><br/>
                                          活动地区：<select id="index" name="index"/>  
                        <option value="1">嘉定</option>  
                        <option value="2">浦东</option>  
                        <option value="3">奉贤</option>
                        <option value="4">普陀</option>  
                        <option value="5">闸北</option>  
                        <option value="6">徐汇</option>
                        <option value="7">杨浦</option>  
                        <option value="8">黄浦</option>  
                        <option value="9">虹口</option>
                        <option value="10">其他</option>
                        </select> 
                <br/><br/>
                                          活动地址：<input type="text" name="address" id="address"/>
                <br/><br/>
                                          发布组织：<input type="text" name="organizator" id="organizator"/>
                <br/><br/>
                                          状态：<select id="state" name="state">  
                        <option value="招募中">招募中</option>  
                        <option value="进行中">进行中</option>  
                        <option value="已结束">已结束</option>
                        </select>  

                <br/><br/>
                                          活动简介：<TEXTAREA id="introduction" name="introduction" rows=5 cols=40 ></TEXTAREA><br>
                                          
				</form>
				<button onclick="release()">发布</button>
				</div>
			</div>			   
		</div>
	</div>
	<div data-options="region:'south',split:true,border:false" style="height:35px;text-align:center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>
</c:forEach>
</body> 
<%} %>
<%} %>
<script type="text/javascript">
function release(){
	var title = $("#title").val();
	var activityDate = $("#activityDate").val();
	var deadline = $("#deadline").val();
	var number = $("#number").val();
    var index = $("#index").val();
    var address = $("#address").val();
    var organizator = $("#organizator").val();
    var state = $("#state").val();
    var introduction = $("#introduction").val(); 
	document.projectForm.target="_self";
	document.projectForm.action="<%=request.getContextPath()%>/servlet/Release?title="+title+"&activityDate="+activityDate+"&deadline="+deadline+"&number="+number+"&index="+index+"&address="+address+"&organizator="+organizator+"&state="+state+"&introduction="+introduction;
	document.projectForm.submit();
}

</script>
</html>