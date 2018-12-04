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
<title>产品参数</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/canshu.css"></link>
  </head>
  <body>
	<div class="navigation">
		<div class="navigation1">
		  <samp style="font-size:200%;line-height:40px;"><a href="<%=basePath%>home/index.action">首页</a></samp>
		  <samp style="font-size:200%;line-height:40px;margin:0 30px;">
		  <a id="clis" href="<%=basePath%>home/list.action?product_id=${product_id }">介绍</a></samp>
		   <samp style="font-size:200%;line-height:40px;margin:0 30px 0 0;"><a id="clis" href="#">参数</a></samp>
		   <samp style="font-size:200%;line-height:40px;"><a id="cliss" style="color:red;" target="_blank" href="<c:if test="${product_taobao!=null&&product_taobao!='' }">${product_taobao }</c:if><c:if test="${product_taobao==null||product_taobao=='' }">#</c:if>">购买商品</a></samp>
		</div>
	</div>
	<!-- 参数列表 -->
	<div class="navigationimg">
		<c:forEach items="${producttext}" var="sh"><!-- list -->
		  	 <div class="navigationimgs">
		  	 <c:forEach items="${sh}" var="map"><!-- map -->
		  	 <div class="left">
		  	 	<h2>${map.key }</h2>
		  	 </div>
		  	 <div class="right">
		  	  		<table>
		  	  			<c:forEach items="${map.value}" var="va"><!-- list -->
		  	  			<tr>
		  	  			  <td class="righttd">${va.producttext_name }</td>
		  	  			  <td class="righttds">${va.producttext_parameter }</td>
		  	  			</tr>
		  	  			</c:forEach>
		  	  		</table>
		  	  </div>
		  	  </c:forEach>
		  	 </div>
		  </c:forEach>
	</div>
  </body>
  <script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
  <script>
	
  </script>
</html>