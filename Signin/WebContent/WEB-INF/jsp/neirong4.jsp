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
	<title>历史记录</title>
	<style>
	h1{text-align:center;}
	</style>
	<body>
	  <div style="width:100%;">
		<h1>历史记录</h1>
		<hr/>
		<div style="width:100%;">
		<table  data-toggle="table" data-classes="table table-hover" data-striped="true"
		data-pagination="true" data-pagination-loop="true"data-page-size="5"data-search="true"
		data-search-align="left"
		>
		<thead>
				<tr>
					<th >学生名字</th>
					<th >学生学号</th>
					<th >学生班级</th>
					<th >签到次数</th>
					<th >操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${student}" var="st">
					<tr>
						<td>${st.students_name}</td>
						<td>${st.students_school}</td>
						<td>${st.students_class}</td>
						<td>${st.students_Sign}</td>
						<td><a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${st.students_id})">删除</a></td>
						</tr>
				</c:forEach>	
			</tbody>
		</table>
		</div>
	 </div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap-table.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap-table-zh-CN.js"></script>
	<script>
		function deleteCustomer(id){
			 $.ajax({
					type:"post",
					url:"<%=basePath%>teacher/lishidelete.action",
					data:{"students_id":id},
					success:function(data) {
						if(data==true){
							alert("提交成功");
							window.location.reload();
						}else{alert("提交失败");}
					},
					error:function(data){
						alert("提交失败");
			        }
		});
		}
	</script>
  </head>