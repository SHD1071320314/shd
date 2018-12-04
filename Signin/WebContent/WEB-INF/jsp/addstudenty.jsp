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
<title>右边</title>
	<style>
	  h1{text-align:center;}
	  ul{list-style:none;}
	  li{float:left;}
	  a{text-decoration:none;}
	  .page-first{margin:0px 0px 0px 60%;}
	  .fixed-table-pagination{display:none;}
	  .table tr:nth-child(even){background: #F5F5F5;color:#000;}  
	</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/bootstrap-table.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap-table.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js/bootstrap-table-zh-CN.js"></script>
	<body>
	  <div style="width:100%;">
		<h1>课程添加<h1>
		<hr/>
	 </div>
	 <input type="button" id="add" value="班级添加"style="cursor:pointer;width:80px;height:30px;position:absolute;left:80%;top:25px;"/>
	<!--<div style="width:100%;height:20%;border-radius:5px;border-style:ridge;border-width:1px;">
		  <form  class="form-inline" action="${pageContext.request.contextPath }/home/addy.action" method="get">
		<label for="dictionary">班级</label>
		  <select	class="form-control" style="margin:3px 0px" id="dictionary" name="dictionary_id">
			<option value="0" selected>--请选择--</option>
			<c:forEach items="${dictionary}" var="cu">
				<option name="dictionary_id" value="${cu.dictionary_id}"<c:if test="${cu.dictionary_id == dictionarys}"> selected</c:if>>${cu.dictionary_class }</option>
			</c:forEach>
		</select>
		<input type="submit" value="查询" style="cursor:pointer;background:#00BFFF"/>
		</form>
	</div>-->
	<div style="width:100%;">
	<table class="table" id="table_page"data-toggle="table" data-classes="table table-hover" data-striped="true"
		data-pagination="true" data-pagination-loop="true"data-page-size="10"data-search="true"
		data-search-align="left">
		<thead style="width:100%">
				<tr style="width:100%">
					<th style="margin:0px 0px 0px 0px">班级编号</th>
					<th style="margin:0px 0px 0px 30%">所教班级</th>
					<th style="margin:0px 0px 0px 30%">操作</th>
				</tr>
			</thead>
			<tbody id="table_tbody">
				<c:forEach items="${dictionary}" var="st">
					<tr>
						<td style="margin:0px 0px 0px 0px">${st.dictionary_id}</td>
						<td style="margin:0px 0px 0px 30%">${st.dictionary_class}</td>
						<td>
							
							<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${st.dictionary_id})">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	 <div class="studentadd" style="border-radius:5px;border-style:ridge;border-width:10px;display:none;width:80%;height:80%;position:absolute;left:8%;top:12%;background:#ffffff;">
	   <div style="margin:0 2%;">
			<form id="information" style="font-size:35px;">
			添加班级:<input id="dictionary_class" type="text" name="dictionary_class" autocomplete="off" style="font-size:35px;margin:120px 0px 30px 0px;"/><br/>
			<input style="font-size:35px;margin:0px 0px 0px 60%;cursor:pointer;"type="button" value="提交" onclick="msg()">
			<input style="font-size:35px;margin:0px 0px;cursor:pointer;"type="button" value="关闭" onclick="msgs()">
			
			</form>
		</div>
	 </div>
	</body>
	<script>
		$(document).ready(function(){
		$("#add").click(function(){
			$(".studentadd").show();
		});
		$("#table_page").bootstrapTable({
			
		});
		
		
		});
		
		function msg()
		{
			var iff=1;
			if($("#dictionary_class").val()==""||$("#dictionary_class").val()==null){
				iff=0;
				alert("请填写信息");
			}else{
			$("#dictionary option").each(function(){
				if($(this).text() == $("#dictionary_class").val()){
					iff=0;
					return false;
				}
			});
			if(iff==1){
				 $.ajax({
						type:"post",
						url:"<%=basePath%>teacher/addy.action",
						data:{"dictionary_class":$("#dictionary_class").val()},
						success:function(data) {
							if(data==true){
								alert("提交成功");
							}else{
								alert("提交失败");
							}
						},
						error:function(data){
							alert("提交失败");
				        }
			});}else{
				alert("该课程已存在")
			}
		
		}}
		function msgs()
		{
			 $("input[type='text']").val("").focus();
			 $(".studentadd").hide();
			 window.location.reload();
		}
		function deleteCustomer(id){
			$.ajax({
				type:"post",
				url:"<%=basePath%>teacher/addydelete.action",
				data:{"dictionary_id":id,"dictionary_class":editCustomer(id)},
				success:function(data) {
					if(data==true){
						alert("删除成功");
						window.location.reload();
					}else{
						alert("删除失败");
					}
				},
				error:function(data){
					alert("删除失败");
		        }
	});
			function editCustomer(id){
				var str;
				var j=0;
				 $("#table_tbody tr").each(function(){
					 if($(this).find("td").eq(0).text()==id){
						 str=$(this).find("td").eq(1).text();
						 return false;
					 }
					});
			return str;
			}
		}
	</script>
  </head>