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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/bootstrap-table.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap-table.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap-table-zh-CN.js"></script>
	<title>实时情况</title>
	<style>
	  h1{text-align:center;}
	  .page-first{margin:0px 0px 0px 60%;}
	  .table tr:nth-child(even){background: #F5F5F5;color:#000;}  
	  a{text-decoration:none;}
	</style>
	<body>
	  <div style="width:100%;">
		<h1>实时情况</h1>
		<hr/>
		<div style="width:100%;">
		<table class="table" id="table_page" data-toggle="table" data-classes="table table-hover" data-striped="true"
		data-pagination="true" data-pagination-loop="true"data-page-size="8"data-search="true"
		data-search-align="left">
		<thead style="width:100%">
				<tr style="width:100%">
					<th>学生名字</th>
					<th>学生学号</th>
					<th>学生班级</th>
					<th>学生座位</th>
					<th>学生当位置</th>
					<th>是否签到</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${student}" var="st">
					<tr>
						<td style="margin:0px 0px 0px 0px">${st.student_name}</td>
						<td style="margin:0px 0px 0px 0px">${st.student_school}</td>
						<td style="margin:0px 0px 0px 0px">${st.student_class}</td>
						<td style="margin:0px 0px 0px 0px">${st.student_seat}</td>
						<td style="margin:0px 0px 0px 0px"><c:if test="${st.student_position == '定位失败！！这位学生你很皮'||st.student_position =='	'}"><span style="color:red;">定位失败</span></c:if><c:if test="${st.student_position !=null&&st.student_position !='定位失败！！这位学生你很皮'}"><span style="color:#32CD32;">${st.student_position }</span></c:if></td>
						<td style="margin:0px 0px 0px 0px"><c:if test="${st.student_enable == 0}">签到</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	 </div>
	</body>
	<script>
	$(document).ready(function(){
$("#table_page").bootstrapTable({
			
		});
	});
	</script>
  </head>