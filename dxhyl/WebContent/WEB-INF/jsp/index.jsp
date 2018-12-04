<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大学回忆录管理登录</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css.css"></link>
<style>
  body{
	background-image:url("../../image/timg.jpg");  
  }
  .form_control::-webkit-input-placeholder{
	font-size: 20px;
  }
.error{
	color:red;
}
</style>
</head>
<body>
<div id="backgroundd1" class="backgroundd">
  	<div class="navigation"></div>
  	<div class="middle">
		<div class="middle_Left"></div>
		<div class="middle_middle">
			<div class="middle_middle_Left">
			<div class="middle_middle_middle_npg"><img src="../../image/2.png" width="200px" height="150px"></img></div>
			</div>
			<div class="middle_middle_middle">
				<div class="middle_middle_middle_transparent"></div>
				<form id="formurse" action="<%=basePath%>index/homepage.action" method="post">
				<div class="middle_middle_middle_absolute">
						<input autocomplete="off" type="text" name="dict_email" id="username" value="${dict_email }" size="40" placeholder="请输入邮箱"  style="height:30px;border-radius:10px;"/><br/><br/>
						<input type="password" name="dict_password" id="password" value="${dict_password }" size="40" placeholder="请输入密码" style="height:30px;border-radius:10px;"/><br/>
				</div>
				<div class="middle_middle_middle_absolute1" style="border-radius:5px;"><label for="username">邮箱:</label></div>
				<div class="middle_middle_middle_absolute2" style="border-radius:5px;"><label for="password">密码:</label></div>
				
					<div id="Sign_in" class="middle_middle_middle_change1"><input type="submit" value="登录" style="height:34px;border-radius:5px;"></div>
					<div id="register" class="middle_middle_middle_change2"><input type="button" value="注册" style="height:34px;border-radius:5px;"></div>
				</form>
			</div>
			<div class="middle_middle_right"></div>
		</div>
		<div class="middle_right"></div>
	</div>
  	<div class="bottom"><p style="color:#ffffff;text-align:center">技术提供者茂职院机电系学生<br/>联系邮箱1071320314@qq.com<p></div>
	<div id="Register_box" class="middle_middle_middle_register" style="background:#F5F5F5;height:500px;width:500px;position:absolute;border-radius:10px;display:none;opacity:0.95;">
		<div><h2 style="text-align:center">用户注册</h2><hr/></div>
		<form  class="cmxform" id="commentForm" method="post" action="">
			<fieldset>
				<div class="cmxform_input">
					<label for="dict_name" ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
					<input autocomplete="off" type="text" class="form_control" id="dict_name" placeholder="&nbsp;用户名" name="dict_name" minlength="2" required>
				</div>
		
		
				<div class="cmxform_input">
					<label for="dict_email" ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
					<input type="email" autocomplete="off" class="form_control" id="dict_email" placeholder="&nbsp;E-mail" name="dict_email" required>
				</div>
		
		
				<div class="cmxform_input">
					<label for="dict_password" ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
					<input type="password" class="form_control" id="dict_password" placeholder="&nbsp;密码" name="dict_password" required>
				</div>
		
		
				<div class="cmxform_input">
					<label for="edit_password_again" ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认密码&nbsp;&nbsp;&nbsp;</strong></label>
					<input type="password" class="form_control" id="edit_password_again" placeholder="&nbsp;确认密码" name="edit_password_again" required>
				</div>
		
		
				<div class="modal_footer">
					<input  id="button_closes" type="button" class="btn1 btn " style="background: rgb(255, 255, 255);color:#000000" value="验证" />
					<button id="button_close"  type="button" class="btn btn2" style="background:#FF0000"><strong>关闭</strong></button>
					<input class="submit btn" type="submit" value="提交" style="background: rgb(255, 255, 255);color:#000000"/>
				</div>
			</fieldset>
			</form>
			
	</div>
	<div style="position:absolute; left:1030px; top:390px; color:red"><p id="information" >${information }</p><!--判断注册帐号是否已存在--></div>
</div>
</body>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.validate.min.js" charset="utf-8"></script>
<script>
var verification=0;
$(document).ready(function(){
  $("input").focus(function(){
    $(this).css("background-color","#cccccc");
    $("#information").html("");
  });
  $("input").blur(function(){
    $(this).css("background-color","#ffffff");
  });
 /* $("input").change(function(){
   /*Enter回车数据提交
  });
  $("#Sign_in").click(function(){
  
  });*/
  
  $("#register").click(function(){
   /*注册框*/
   $("#Register_box").show(100);
  });
  $("#button_close").click(function(){
	  
	// verification=0;
	 
	 $("#commentForm")[0].reset();//清空input标签的数据
	 $("#commentForm").validate().resetForm();//清理jq V插件的提示
	 $("#Register_box").hide(100);
  });
  
/*  $("#button_closes").click(function(){
		
	  
	  
	  
	*/
  
	  
	  
});
 



$.validator.setDefaults({
    submitHandler: function() {
     if(verification==1){
      $("#Register_box").hide(100);
      $.ajax({
    	  	type:"post",
    	 	url:"<%=basePath%>index/register.action",
      	  	data:$("#commentForm").serialize(),'dict_email':encodeURI(encodeURI($("#dict_email").val())),
      	    success:function(data){
      	    	alert(data);
      	    },
      	  error:function(data) {
              alert(data);
          }
    	  });
     $("#commentForm")[0].reset();
    }else{
    	alert("请验证邮箱");
    }
}
});




$().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
  $("#commentForm").validate({
	    rules: {
	    	
	    	
	 	
	    dict_password: {
	       
	        minlength: 5
	      },
	      edit_password_again: {
	        
	        minlength: 5,
	        equalTo: "#dict_password"
		  }
	    },
	    messages: {
	    	
	    	
	    	
	    	dict_password: {
	        required: "请输入密码",
	        minlength: "密码长度不能小于 5 个字母"
	      },
	      edit_password_again: {
	        required: "请输入密码",
	        minlength: "密码长度不能小于 5 个字母",
	        equalTo: "两次密码输入不一致"
	      }
	    }
	});

});

function updateCustomer(){

}



$("#button_closes").click(function(){ 
    if($("#commentForm").valid()) {
    	  $.ajax({
    		  	type:"post",
				url:"<%=basePath%>index/verification.action",
				data:{'dict_email':encodeURI(encodeURI($("#dict_email").val()))},
				success:function(data,success){
					if(data==1){
						verification=1;
						alert("邮箱可用");
						
					}else if(data==0){
						
						verification=0;
						alert("邮箱已存在");
					}
				}
  			});
  	  
    } else {
        //校验不通过，什么都不用做，校验信息已经正常显示在表单上
    }
}); 

</script>
</html>