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
<title>首页</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css"></link>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/ft-carousel.css"></link>
<style>
.example {width: 100%;height: 420px;font-size: 40px;text-align: center;margin: 10px auto;background-color: #464576;}
.carousel-item{line-height: 336px;color: #fff;font-family:  Arial Black}
</style>
  </head>
  <body>
	<div class="index">
	  <div class="mainframe">
		<div class="rotation">
		  <div class="example">
			<div class="ft-carousel" id="carousel_1">
			  <ul class="carousel-inner">
			  	<c:forEach items="${rotation}" var="ro">
			  		<li class="carousel-item"><img style="width:100%;height: 420px;" src="<%=basePath%>${ro.product_url }" /></li>
			  	</c:forEach>
			  	
			  </ul>
		  </div>
		</div>
		</div>
		<div class="content">
		<c:forEach items="${product}" var="sh">
			<div>
			<p style="font-size:200%;margin:0 10px;">${sh.product_name }</p>
			</div>
		  	  
		  	  <a href="<%=basePath%>home/list.action?product_id=${sh.product_id }"><img style="width:100%;" src="<%=basePath%>${sh.product_url }" /></a>	
		  	  </c:forEach>
		</div>
	  </div>
	</div>
  </body>
  <script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
  <script src="<%=basePath%>js/ft-carousel.min.js"></script>
  <script>
	$("#carousel_1").FtCarousel({
		
	});
  </script>
 </html>