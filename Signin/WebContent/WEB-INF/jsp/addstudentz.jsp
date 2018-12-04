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
<title>左边</title>
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
		<h1>学生添加<h1>
		<hr/>
	 </div>
	 <input type="button" id="add" value="学生添加"style="cursor:pointer;width:80px;height:30px;position:absolute;left:80%;top:25px;"/>
	<div style="width:100%;height:20%;border-radius:5px;border-style:ridge;border-width:1px;">
		<!--  <form  class="form-inline" action="${pageContext.request.contextPath }/home/addz.action" method="post">
		<label for="fstudent_name" style="cursor:pointer;margin:5px 5px;">学生姓名<label><input name="student_name" id="fstudent_name"type="text" style="margin:10px 2px;border-radius:5px;height:20px;" autocomplete="off" value="<c:if test="${dictionaryzz != null}">${dictionaryzz }</c:if>"/>
		<label for="dictionary">班级</label>
		<select	class="form-control" id="dictionary" name="student_class">
			<option value="0">--请选择--</option>
			<c:forEach items="${dictionary }" var="cu">
				<option value="${cu.dictionary_id}"<c:if test="${cu.dictionary_id == dictionaryz}"> selected</c:if>>${cu.dictionary_class }</option>
			</c:forEach>
		</select>
		<input type="submit" value="查询" style="cursor:pointer;background:#00BFFF"/>
		</form>-->
	</div>
	<div style="width:100%;">
	<table class="table" id="table_page" data-toggle="table" data-classes="table table-hover" data-striped="true"
		data-pagination="true" data-pagination-loop="true"data-page-size="10"data-search="true"
		data-search-align="left">
		<thead style="width:100%">
				<tr style="width:100%">
					<th style="margin:0px 0px 0px 0px">学生编号</th>
					<th style="margin:0px 0px 0px 20%">学生姓名</th>
					<th style="margin:0px 0px 0px 20%">学生学号</th>
					<th style="margin:0px 0px 0px 20%">学生班级</th>
					<th style="margin:0px 0px 0px 20%">操作</th>
				</tr>
			</thead>
			<tbody id="table_tbody">
				<c:forEach items="${student }" var="st">
					<tr>
						<td style="margin:0px 0px 0px 0px">${st.students_id}</td>
						<td style="margin:0px 0px 0px 20%">${st.students_name}</td>
						<td style="margin:0px 0px 0px 20%">${st.students_school}</td>
						<td style="margin:0px 0px 0px 20%">${st.students_class}</td>
						<td>
							<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(${st.students_id})">修改</a>
							<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${st.students_id})">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	 <div class="studentadd" style="border-radius:5px;border-style:ridge;border-width:10px;display:none;width:80%;height:80%;position:absolute;left:8%;top:12%;background:#ffffff;">
	   <div style="margin:0 2%;">
			<form id="information" style="font-size:35px;">
			学生姓名:<input type="text" id="student_name" name="student_name" autocomplete="off" style="font-size:35px;margin:120px 0px 30px 0px;"/><br/>
			学生学号:<input type="text" id="student_school" name="student_school" autocomplete="off" style="font-size:35px;margin:30px 0px;"/><br/>
			学生班级:<select	class="form-control" style="width:50%;cursor:pointer;margin:0px 0px 5% 0px"id="sqlstudent" name="student_class">
			<c:forEach items="${dictionary }" var="cu">
				<option value="${cu.dictionary_id}">${cu.dictionary_class }</option>
			</c:forEach>
			</select>
			<input style="font-size:35px;margin:0px 0px 0px 60%;cursor:pointer;"type="button" value="提交" onclick="msg()">
			<input style="font-size:35px;margin:0px 0px;cursor:pointer;"type="button" value="关闭" onclick="msgs()">
			</form>
		</div>
	 </div>
	 <div id="edit"style="border-radius:5px;border-style:ridge;border-width:10px;display:none;width:80%;height:80%;position:absolute;left:8%;top:12%;background:#ffffff;">
			<form id="editform" style="font-size:35px;" >
			学生编号：<input type="text" name="student_id"  autocomplete="off" style="font-size:35px;margin:120px 0px 30px 0px;"readonly/><br/>
			学生名字：<input type="text" name="student_name" autocomplete="off" style="font-size:35px;margin:30px 0px;"/><br/>
			学生学号：<input type="text" name="student_school"  autocomplete="off" style="font-size:35px;margin:30px 0px;"/><br/>
			学生班级：<select	id="form-control"class="form-controls" style="width:50%;cursor:pointer;margin:-50px 50px ;"id="sqlstudents" name="student_class">
			<c:forEach items="${dictionary }" var="cu">
				<option value="${cu.dictionary_id}"selected="selected">${cu.dictionary_class }</option>
			</c:forEach>
			</select><br/>
			<input style="font-size:35px;margin:0px 0px 0px 60%;cursor:pointer;"type="button" value="提交" onclick="editmsg()">
			<input style="font-size:35px;margin:0px 0px;cursor:pointer;"type="button" value="关闭" onclick="msgs()">
			<div id="nonevalue"style="display:none;">
				<input type="text" value=""/>
				<input type="text" value=""/>
				<input type="text" value=""/>
			</div>
			</form>
		</div >
	</body>
	<script>
		$(document).ready(function(){
		$("#add").click(function(){
			$(".studentadd").show();
		});
		
		});
		
		function msg()
		{
			if($("#student_name").val()==""||$("#student_name").val()==null||$("#student_school").val()==""||$("#student_school").val()==null){
				alert("请填写信息");
			}else{
			 $.ajax({
					type:"post",
					url:"<%=basePath%>teacher/addz.action",
					data:{"student_name":$("#student_name").val(),"student_school":$("#student_school").val(),"student_class":$("#sqlstudent  option:selected").val(),"students_class":$("#sqlstudent  option:selected").text()},
					success:function(data) {
						if(data==true){
							alert("提交成功");
						}else{alert("提交失败");}
					},
					error:function(data){
						alert("提交失败");
			        }
		});}
		}
		function msgs()
		{
			 $("input[type='text']").val("").focus();
			 $(".studentadd").hide();
			 window.location.reload();
		}
		function deleteCustomer(id){
			var student_name;
			var student_school;
			var student_class;
			var student_classa;
			 $("#table_tbody tr").each(function(){
				 if($(this).find("td").eq(0).text()==id){
					 student_name=$(this).find("td").eq(1).text();
					 student_school=$(this).find("td").eq(2).text();
					 student_class=$(this).find("td").eq(3).text();
					 return false;
				 }
				});
			 $("#form-control option").each(function(){
				 if($(this).text()==student_class){
					 student_classa=$(this).val();
					 return false;
				 }
				});
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/teacher/addzdelete.action",
				data:{"student_id":id,"student_name":student_name,"student_school":student_school,"student_class":student_classa},
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
			
		}
		function editCustomer(id){
			var student_class;
			var j=0;
			var k=0;
			 $("#table_tbody tr").each(function(){
				 if($(this).find("td").eq(0).text()==id){
					 for(var i=0;i<3;i++){
						 $("#edit input").eq(i).val($(this).find("td").eq(j++).text());

							 $("#nonevalue input").eq(k++).val($(this).find("td").eq(j).text());
							 

					 }
					 student_class=$(this).find("td").eq(3).text();
					 return false;
				 }
				});
				$("#form-control option").each(function(){
					 if($(this).text()==student_class){
						 $("#nonevalue input").eq(2).val($(this).val());
						 return false;
					 }
					});
			$("#edit").show();
			
		}
		function editmsg(){//sqlstudents
			var student_class;
			student_class=$("#nonevalue input").eq(2).val();
			if(student_class==""||student_class==null){
				student_class=0;
			}
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/teacher/addzupdate.action",
				data:{"student_id":$("#editform input").eq(0).val(),"student_name":$("#editform input").eq(1).val(),"student_school":$("#editform input").eq(2).val(),"student_class":$("#form-control option:selected").val(),"student_namea":$("#nonevalue input").eq(0).val(),"student_schoola":$("#nonevalue input").eq(1).val(),"student_classa":student_class},
				success:function(data) {
					if(data==true){
						alert("修改成功");
						window.location.reload();
					}else{
						alert("修改失败");
					}
				},
				error:function(data){
					alert("修改失败");
		        }
	});	
		}
	</script>
  </head>