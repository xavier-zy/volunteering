<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bbs.bean.TUser"%>
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
					<div data-options="region:'north',split:true,border:false,title:'关于我们' ,collapsible:false" style="height:20px">
					</div>
<div class='show_body'>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><strong style="mso-bidi-font-weight: normal"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin"><font size="3">》》》》》我们的大事件<span lang="EN-US"></span></font></span></strong></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><strong style="mso-bidi-font-weight: normal"><span lang="EN-US" style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin"><font size="3">&nbsp;</font></span></strong></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US" style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin"><font size="3">&nbsp;</font></span></p>
<div align="center">
<table width="400" cellspacing="0" cellpadding="0" border="1" class="MsoTableGrid" style="BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; WIDTH:304.2pt; BORDER-COLLAPSE: collapse; BORDER-TOP: medium none; BORDER-RIGHT: medium none; mso-border-top-alt: solid black .5pt; mso-border-bottom-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt; mso-yfti-tbllook: 1184">
    <tbody>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 0; mso-yfti-firstrow: yes">
            <td width="400" nowrap="nowrap" style="BORDER-BOTTOM: black 1.5pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: windowtext 1pt solid; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid black 1.5pt; mso-border-bottom-themecolor: text1">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-bidi-font-weight: bold; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">活动名称<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 1">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black 1.5pt; mso-border-bottom-alt: black .5pt; mso-border-right-alt: windowtext .5pt; mso-border-left-alt: windowtext .5pt; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">餐厅引导员<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 2">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">迎新维护交通活动<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 3">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">十六届中国国际投资贸易洽谈会会务志愿者和翻译志愿者<strong><span style="COLOR: red">&radic;</span></strong><strong style="mso-bidi-font-weight: normal"><span lang="EN-US"></span></strong></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 4">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid black .5pt; mso-border-bottom-themecolor: text1">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">&ldquo;我为搬迁做贡献&rdquo;校区搬迁志愿者<strong><span style="COLOR: red">&radic;</span></strong><strong style="mso-bidi-font-weight: normal"><span lang="EN-US"></span></strong></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 6">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">马耳他客人外事活动的志愿者<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 7">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">同济暑期参观导游志愿者<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 8">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">&ldquo;爱在南强&rdquo;造血干细胞样本采集<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 10">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">优秀党员表彰大会志愿者<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 11">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">招生办接电话志愿者<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
        <tr style="HEIGHT: 30.8pt; mso-yfti-irow: 12">
            <td width="806" nowrap="nowrap" style="BORDER-BOTTOM: black 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 5.4pt; WIDTH: 604.2pt; PADDING-RIGHT: 5.4pt; HEIGHT: 30.8pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-top-alt: black; mso-border-bottom-alt: black; mso-border-right-alt: windowtext; mso-border-left-alt: windowtext; mso-border-top-themecolor: text1; mso-border-bottom-themecolor: text1; mso-border-style-alt: solid; mso-border-width-alt: .5pt">
            <p align="center" class="MsoNormal" style="TEXT-ALIGN: center; MARGIN: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"><font size="1">同济大学<span lang="EN-US">2012</span>届毕业生冷餐会志愿者<span lang="EN-US"></span></font></span></p>
            </td>
        </tr>
            </td>

    </tbody>
</table>
</div>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US" style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin"><font size="1">&nbsp;</font></span></p>
<p class="MsoNormal" style="TEXT-INDENT: 84pt; MARGIN: 0cm 0cm 0pt; mso-char-indent-count: 8.0"><font size="3"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin">注：带</span><strong><span style="FONT-FAMILY: 黑体; COLOR: red; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">&radic;</span></strong><span style="FONT-FAMILY: 黑体; mso-bidi-font-weight: bold; mso-hansi-font-family: 宋体; mso-bidi-font-size: 10.5pt; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">的活动为校青协的品牌项目<span lang="EN-US"></span></span></font></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US" style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin"><font size="1">&nbsp;</font></span></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><strong style="mso-bidi-font-weight: normal"><span lang="EN-US" style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin"><font size="1">&nbsp;</font></span></strong></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><strong style="mso-bidi-font-weight: normal"><span style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin">》》》》》》》联系我们<span lang="EN-US"></span></span></strong></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US" style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin">&nbsp;</span></p>
<p class="MsoNormal" style="TEXT-INDENT: 84pt; MARGIN: 0cm 0cm 0pt; mso-char-indent-count: 6.0"><span style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin">新浪微博</span><span lang="EN-US" style="FONT-SIZE: 14pt; mso-bidi-font-size: 11.0pt"><a href="http://weibo.com/xmuzyz"><span style="FONT-FAMILY: 黑体; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin"><font color="#0000ff">http://weibo.com/xmuzyz</font></span></a></span><span class="MsoHyperlink"><span lang="EN-US" style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin"></span></span></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US" style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin">&nbsp;</span></p>
<p class="MsoNormal" style="TEXT-INDENT: 84pt; MARGIN: 0cm 0cm 0pt; WORD-BREAK: break-all; mso-char-indent-count: 6.0"><span style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin">人人主页</span><span lang="EN-US" style="FONT-FAMILY: &quot;Tahoma&quot;,&quot;sans-serif&quot;; COLOR: #333333; FONT-SIZE: 11pt; mso-font-kerning: 0pt; mso-fareast-font-family: 宋体"><a href="http://www.renren.com/xmuxqx"><font color="#0000ff">www.renren.com/xmuxqx</font></a></span><span lang="EN-US" style="FONT-FAMILY: &quot;Tahoma&quot;,&quot;sans-serif&quot;; COLOR: #333333; FONT-SIZE: 11pt; mso-bidi-font-size: 9.0pt; mso-font-kerning: 0pt; mso-fareast-font-family: 宋体"> </span></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; WORD-BREAK: break-all"><span lang="EN-US" style="FONT-FAMILY: &quot;Tahoma&quot;,&quot;sans-serif&quot;; COLOR: #333333; FONT-SIZE: 11pt; mso-bidi-font-size:5pt; mso-font-kerning: 0pt; mso-fareast-font-family: 宋体">&nbsp;</span></p>
<p class="MsoNormal" style="TEXT-INDENT: 84pt; MARGIN: 0cm 0cm 0pt; mso-char-indent-count: 6.0"><span style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin">同济大学志愿者网<span lang="EN-US"><a href="http://tjzyz.aliapp.com"><font color="#0000ff">http://t.cn/zWvnkUZ</font></a></span></span></p>
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US" style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 10.5pt; mso-hansi-theme-font: minor-latin">&nbsp;</span></p>
<span style="FONT-FAMILY: 黑体; FONT-SIZE: 14pt; mso-hansi-font-family: Calibri; mso-bidi-font-size: 5.5pt; mso-hansi-theme-font: minor-latin">邮箱：<span lang="EN-US">xmuqnzyz@126.com</span></span>
</div>
<div data-options="region:'south',split:true,border:false" style="height:35px;text-align:center">志愿者协会会员群:12345678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有,请勿盗版</div>

</body>
</html>