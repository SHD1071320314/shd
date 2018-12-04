<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生签到系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qiandao.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	  <div class="whole">
		<!--左部内容-->
		<div class="left">
		  <img src="data:image/png;base64,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"/>
		  <div class="left-ul">
			<ul>
			  <li id="left-ul-lis" style="background:#696969;"><a>首页</a></li>
			  <li id="left-ul-lit"><a>添加学生</a></li>
			  <li id="left-ul-lix"><a>学生签到</a></li>
			  <li id="left-ul-liss"><a>实时情况</a></li>
			  <li id="left-ul-lil"><a>历史记录</a></li>
			</ul>
		  </div>
		</div>
		<!--头标签-->
		<div class="head">
			<div class="head-ul">
				<ul>
				  <li>
				    <a href="${pageContext.request.contextPath }/ewm/out.action" style="width:50px;height:30px;" >退出</a>
				  </li>
				</ul>
			</div>
		</div>
		
		
		<!--主内容-->
		<div class="content">
		  <iframe id="iframe"src="<%=basePath%>/home/page.action" width="100%" height="894px" frameborder="0"></iframe>
		</div>
	  </div>
	</body>
	<script>
	  $(document).ready(function(){
		$(".left-ul li").mouseenter(function(){
		  $(this).css("background","#4B0082");
		});
		$(".left-ul li").mouseleave(function(){
		  $(this).css("background","#696969");
		});
		
		$("#left-ul-lis").click(function(){
			$("#iframe").attr("src","<%=basePath%>home/page.action");
		});
		$("#left-ul-lit").click(function(){
			$("#iframe").attr("src","<%=basePath%>/home/add.action");
		});
		$("#left-ul-lix").click(function(){
			$("#iframe").attr("src","<%=basePath%>/home/Sign.action");
		});
		$("#left-ul-liss").click(function(){
			$("#iframe").attr("src","<%=basePath%>/home/situation.action");
		});
		$("#left-ul-lil").click(function(){
			$("#iframe").attr("src","<%=basePath%>/home/History.action");
		});
	 });
	</script>
  </head>