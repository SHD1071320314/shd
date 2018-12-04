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
<link rel="shortcut icon" href="<%=basePath%>image/registeredlogin/12138.png" />
<title>回忆茂职</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/SchoolView.css"></link>
<style>
	a{text-decoration:none;}
	 .head a:hover {color:#FFFFFF;background:#000000;}  
	.head a {display:block;height:30px;padding:8px 0px 0px 0px ;}
	.head1 a {display:block;height:30px;padding:8px 0px 0px 0px ;}
	.button{cursor:pointer}
	.display img{cursor:pointer}
	.Upload_box{background-image:url("../../image/homepage/20.jpg");} 
</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>
</head>
<body>
	<div class="head">
		<ul >
		  <li><a title="记忆茂职" href="<%=basePath%>/index/regis/home.action" class="head_hy" /><i>记忆茂职</i>&nbsp;&nbsp;首页&nbsp;&nbsp;</a></li>
		  <li><a title="介绍" href="https://baike.baidu.com/item/%E8%8C%82%E5%90%8D%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2/2400824?fr=aladdin" target="_blank" class="head_hy1 head_hy" />介绍</a></li>
		  <li><a title="校景" href="#" class="head_hy1 head_hy" />校景</a></li>
		</ul>
		<input type="button" class="button"style="width:70px; height:38px;" value="图片上传"/>
	</div>
	<hr/> 
	<div class="display1">
		<c:forEach items="${SchoolView }" var="SV">
			<div class="display"><img height="308px;" src="<%=basePath%>${SV.schoolview_url }"/></div>
		</c:forEach>
	</div>
	<div class="Upload_box" style="display:none;">
		<h3>请选择图片文件</h3>
		<hr/>
	
			<input id="file" type="file" name="file"/> 
			<input id="Submission" type="button" value="提交"/> 

		<div class="Upload_box1" style="display:none;">
			<img id="img0"width="548px;" height="308px;" src=""/>
		</div>
		<a>X</a>
	</div>
	<div class="Upload" style="display:none;">
		<a>X</a>
		<img id="Upload_img"src="../../image/homepage/06.gif" width="200px;" height="200px;"/>
		<div class="Upload1"><p>正在上传中...</p></div>
	</div>
	<div class="View_box"style="display:none;" >
		<div class="View_box2"></div>
		<img class="View_box_img"src="" width="960px;" height="540px;"/>
		<div class="View_box1">
			<img src="../../image/homepage/delete.png"/>
		</div>
	</div>
</body>
  <script>
  var objUrl;
	$(document).ready(function(){
		$(".button").click(function(){
			$(".Upload_box").show(200);
		
			$("#file").change(function(){
				//alert("asd");
				var fileData = file.files[0];
				var size = fileData.size;   //注意，这里读到的是字节数
				if(size<5242880){
				objUrl = getObjectURL(this.files[0]) ;    
					
				if (objUrl) {  
					$("#img0").attr("src", objUrl) ;  
				}  
				$(".Upload_box1").show(200);
				}else{
					objUrl="";
					$("#file").val(""); 
					alert("图片大于5MB,请更换或压缩图片");
					$(".Upload_box1").hide();
				}
			}) ;
		});
		$(".Upload_box a").click(function(){
			objUrl="";
			$(".Upload_box1").hide();
			$("#file").val("");  
			$(".Upload_box").hide();
		});
		$(".Upload a").click(function(){
			objUrl="";
			$(".Upload_box1").hide();
			$("#file").val("");  
			$(".Upload_box").hide();
			$(".Upload").hide();
			$("#Upload_img").attr("src", "<%=basePath%>image/homepage/06.gif");
			$(".Upload1 p").html("正在上传中...");
		});
		
		
		$("#Submission").click(function(){
			if(objUrl==""||objUrl==null){
				alert("请选着图片");
			}else{
				$(".Upload").show();
				//setTimeout(function () { 
				//$("#Upload_img").attr("src", "2851/05.gif");
				//$(".Upload1 p").html("提交成功！！！");
				//}, 2000);
				
				
				 $.ajaxFileUpload({
			            url:"<%=basePath%>index/regis/schoolviewfile.action",
			            fileElementId: "file", //文件上传域的ID，这里是input的ID，而不是img
			            dataType:'text',
			            contentType: "application/x-www-form-urlencoded; charset=utf-8",
			            success: function (data) {
			            	if(data==true){
			            		$("#Upload_img").attr("src", "<%=basePath%>image/homepage/05.gif");
								$(".Upload1 p").html("提交成功！！！等待管理员同意！！！");
			            	}else if(data==false){
			            		$("#Upload_img").attr("src", "<%=basePath%>image/homepage/03.gif");
								$(".Upload1 p").html("提交失败");
			            	}
			            },
			            error:function(data){
				        	$("#Upload_img").attr("src", "<%=basePath%>image/homepage/03.gif");
							$(".Upload1 p").html("提交失败");
				        }

			        });
			}
		});
		
		$(".display img").click(function(){
			var img = $(this).attr("src");
			$(".View_box_img").attr("src",img);
			$(".View_box").show();
		});
		$(".View_box1 img").click(function(){
			$(".View_box").hide();
		});
		
		$(window).keyup(function(e){
  　  　　	if(e.keyCode==27)
  　  		{//此处代表按的是键盘的Esc键
   　　　 　　$(".View_box").hide();
  　　　　}    
 　　　});
 
	
	function getObjectURL(file) 
	{
  var url = null ;   
  if (window.createObjectURL!=undefined){ // basic  
      url = window.createObjectURL(file) ;  
  } else if (window.URL!=undefined) { // mozilla(firefox)  
      url = window.URL.createObjectURL(file);  
  } else if (window.webkitURL!=undefined) { // webkit or chrome  
      url = window.webkitURL.createObjectURL(file); 
  }  
  return url;
	}
	});
  </script>
 </html>