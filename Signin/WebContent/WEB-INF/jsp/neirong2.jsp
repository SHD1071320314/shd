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
	<title>学生签到</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.qrcode.min.js" ></script>
	<style>
	  h1{text-align:center;}
	  #button{cursor:pointer}
	  #buttons{cursor:pointer}
	</style>
	<body>
	  <div style="width:100%;">
		<h1>学生签到<h1><br/>
		<hr/>
		<div>
		亲爱的<Strong style="color:red;">${Teacher_name.teacher_name }</Strong>点击按钮生成二维码:<input id="button" type="button" value="生成二维码" style="width:90px; height:40px;margin: 10px 0px;"/><input id="buttons" type="button" value="关闭二维码" style="width:90px; height:40px"/><br/>
		</div>
		<div id="qrcode" style=" width:50%;margin:0 28%;"></div>
	 </div>
	 <div id="Deposit" style="display:none;">
	 	<input id="Deposit_id"type="text" value="${Teacher_name.teacher_id }"/>
	 </div>
	</body>
	<script>
	var ewm = "";
	$(document).ready(function(){
		$("#button").click(function(){
			$.ajax({
				type:"get",
				url:"<%=basePath%>ewm/kgcode.action",
				data:{"judge":$("#Deposit_id").val(),teacher_id:$("#Deposit_id").val()},
		 
			});
		  ewm = "<%=basePath%>ewm/code.action?teacher_id="+$("#Deposit_id").val();
		  $('#qrcode').qrcode({
			  render: "table", //也可以替换为table
			  width: 650,
			  height: 650,
			  foreground: "#000000",
		  	  background: "#ffffff",
			  text: ewm
		  });
		});
		$("#buttons").click(function(){
			 $("#qrcode").empty();//清空二维码
			 $.ajax({
					type:"get",
					url:"<%=basePath%>ewm/kgcode.action",
					data:{"judge":0,teacher_id:$("#Deposit_id").val()},
			 
		});
		
		});
	});	
	</script>
  </head>