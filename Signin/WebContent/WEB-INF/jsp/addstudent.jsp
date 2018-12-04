<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
	h1{text-align:center;}
 .zuo{
	 width:50%;
	 float:left;
 }
 .you{
	 width:50%;
	 float:left;
 }
	</style>
	<title>添加学生&班级</title>
	<body>
	  <div style="width:100%;">
		<h1>添加学生&班级</h1>
		<hr/>
		<div class="zuo">
			<iframe id="iframe"src="<%=basePath%>home/addz.action" width="100%" height="780px" frameborder="1"></iframe>
		</div>
		<div class="you">
			<iframe id="iframe"src="<%=basePath%>home/addy.action" width="100%" height="780px" frameborder="1"></iframe>
		</div>
	 </div>
	</body>
	<script>
	</script>
  </head>