<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理登录</title>
</head>
<body style="width: 100%;height:100%;margin: 0 auto;">
	<input type="password" name="password" id="password" placeholder="Please enter your password"style="width:400px;height:50px;font-size:200%;margin:20% 0 0 40%;"/>
</body>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
  <script>
	$(document).ready(function(){
		$("#password").change(function(){
			$.ajax({
	    	  	type:"post",
	    	 	url:"<%=basePath%>home/pass.action",
	      	  	data:{password:$("#password").val()},
	      	    success:function(data){
	      	    	if(data==true){
	      	    		location.href='${pageContext.request.contextPath}/change/index.action';
	      	    	}else{
	      	    		alert("密码错误");
	      	    		$("#password").val("");
	      	    	}
	      	    },
	      	  error:function(data) {
	              alert("提交失败");
	          }
	    	  });
			  });
	});
  </script>
</html>