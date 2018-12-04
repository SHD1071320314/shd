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
<title>管理首页</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/homepage.css"></link>
<style>
	  .whole_1_1{cursor:pointer}
	  .whole_1_1 img{cursor:pointer}
	  .whole_1_Shadow{cursor:pointer}
	  .click_1 img{cursor:pointer}
</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>
</head>
<body>
<div class="whole">
	  <div class="whole_2">
		<h1>管理界面<h1>
	  </div>
	  <div class="whole_1">
		<div class="whole_1_1 whole_1_2">
			<img style="margin:80px 0px 0px 5px;" src="<%=basePath%>image/homepage/h18.png"/>
		</div>
		<div class="whole_1_1">
			<img style="margin:120px 2px;"src="../image/homepage/11.jpg"/>
		</div>
		<div class="whole_1_1">
			<img style="width:200px;margin:120px 40px;"src="<%=basePath%>image/homepage/577714481.png"/>
		</div>
		<div class="whole_1_1">
			<img style="width:260px;margin:80px 5px;"src="<%=basePath%>image/homepage/r11.png"/>
		</div>
		<div class="whole_1_1">
			<img style="width:260px;margin:80px 5px;"src="<%=basePath%>image/homepage/finder.png"/>
		</div>
	  </div>
	</div>
	<div class="whole_1_Shadow" style="display:none;">
		<p></p>
	</div>
	
	<div class="click_2">
		<div class="click">
			<div class="click_1">
				<img src="<%=basePath%>image/homepage/delete.png"/>
			</div>
		</div>
		<div class="click_2_1">
			
				
					<div class="lonin_form">
						<h3>电脑壁纸选换</h3>
						<c:forEach items="${computer}" var="com">
							<div class="lonin_confirm"><img title="${com.computer_id }" width="384px"height="216px" src="<%=basePath%>${com.computer_url}"/><br/>使用:<input style="width:20px;height:20px" type="radio" name="${com.computer_url}" value="1"<c:if test="${com.computer_enable==1 }">checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;停用:<input style="width:20px;height:20px" type="radio" name="${com.computer_url}" value="0" <c:if test="${com.computer_enable==0 }">checked="checked"</c:if>/></div>
						</c:forEach>
					</div>
					<div class="phone_form">
						<h3>手机壁纸选换</h3>
						<c:forEach items="${phone}" var="ph">
							<div class="lonin_phone"><img title="${ph.phone_id }" width="216px"height="384px" src="<%=basePath%>${ph.phone_url}"/><br/>使用:<input style="width:20px;height:20px" type="radio" name="${ph.phone_url}" value="1" <c:if test="${ph.phone_enable==1 }">checked="checked"</c:if> />停用:<input style="width:20px;height:20px" type="radio" name="${ph.phone_url}" value="0" <c:if test="${ph.phone_enable==0 }">checked="checked"</c:if>/></div>
						</c:forEach>
					</div>
					<div class="roll_form">
						<h3 style="margin:10px 0px 0px 750px;text-shadow: -2px -2px 1px #F5DEB3;">轮换壁纸选换</h3>
						<c:forEach items="${lonin}" var="in">
							<div class="lonin_roll" style="width:450px;float:left;margin: 10px 10px;"><img title="${in.longin_id }" width="450px"height="200px" src="<%=basePath%>${in.longin_url}"/><br/>使用:<input style="width:20px;height:20px" type="radio" name="${in.longin_url}" value="1"  <c:if test="${in.longin_enable==1 }">checked="checked"</c:if>/>停用:<input style="width:20px;height:20px" type="radio" name="${in.longin_url}" value="0"<c:if test="${in.longin_enable==0 }">checked="checked"</c:if>/></div>
						</c:forEach>
					</div>
				
				<input class="buttonaa" style="position:fixed; left:1700px;top:300px;width:100px;height:50px;" type="button" value="壁纸更换提交"/>
				
				
				<div class="file" style="position:fixed; left:1700px;top:500px;">
				电脑图片上传：<input id="computerfile" type="file" name="computerfile"/> 
				<input id="Submission1" type="button" value="提交"/><br/><br/>
				手机图片上传：<input id="phonefile" type="file" name="phonefile"/> 
				<input id="Submission2" type="button" value="提交"/><br/><br/>
				轮换壁纸上传：<input id="longinfile" type="file" name="longinfile"/> 
				<input id="Submission3" type="button" value="提交"/><br/><br/>
				</div>
				
			
		</div>
		<div class="click_2_2"style="width:1600px;padding:0px;float:left;border:10px ridge #DEB887;">
			<div class="click_2_2_1">
				<h3 style="margin:10px 0px 0px 750px;text-shadow: -2px -2px 1px #F5DEB3;">校景壁纸选换</h3>
				<c:forEach items="${school}" var="svd">
					<div class="lonin_SchoolView" style="float:left;margin: 10px 10px;"><img title="${svd.schoolview_id }" width="548px"height="308px" src="${svd.schoolview_url}"/><br/>使用:<input style="width:20px;height:20px" type="radio" name="${svd.schoolview_url}" value="1"  <c:if test="${svd.schoolview_enable==1 }">checked="checked"</c:if>/>停用:<input style="width:20px;height:20px" type="radio" name="${svd.schoolview_url}" value="0"<c:if test="${svd.schoolview_enable==0 }">checked="checked"</c:if>/></div>
				</c:forEach>
			</div>
			<input class="button2"  style="width:100px;height:50px;position:fixed;left:1700px;top:300px;" type="button" value="校景图片提交"/>
		</div>
		
			
		</div>
		<div class="click_2_4">
			
		</div>
		<div class="click_2_5">
			
		</div>
	</div>
  </body>
  <script>
	var index=["首页管理","校景管理","社团管理","话题管理","敬请期待",]
	var j;
	
	$(document).ready(function(){
		$(".whole_1_1").mouseenter(function(){
			var i = $(".whole_1_1").index(this);
			j=i;
			i+=250+i*279;
			$(".whole_1_Shadow").css("left",i);
			$(".whole_1_Shadow").show();
			$(".whole_1_Shadow p").html(index[j]);
		});
		$(".whole_1_Shadow").mouseleave(function(){
			$(".whole_1_Shadow").hide();
		});
		
		$(".whole_1_Shadow").click(function(){
			$(".click_2").show();
			switch(j){
				case 0:$(".click_2_1").show(100);
					break;
				case 1:$(".click_2_2").show(100);
					break;
				case 2:$(".click_2_3").show(100);
					break;
				case 3:$(".click_2_4").show(100);
					break;
				case 4:$(".click_2_5").show(100);
					break;
			}
			$(".click").show(100);
			
			
		});
		$(".click_1 img").click(function(){
			$(".click").hide();
			$(".click_2").hide();
			switch(j){
				case 0:$(".click_2_1").hide();
					break;
				case 1:$(".click_2_2").hide();
					break;
				case 2:$(".click_2_3").hide();
					break;
				case 3:$(".click_2_4").hide();
					break;
				case 4:$(".click_2_5").hide();
					break;
			}
		});
		$(".buttonaa").click(function(){
			var baseComputer='[';
			var basePhone ='[';
			var baseLongin ='[';
			var a=0;
			var b=0;
			var c=0;
			var aa=0;
			var bb=0;
			var cc=0;
			$(".lonin_form input").each(function(){

				if($(this).is(":checked"))
           		 {
					baseComputer+="{\"computer_id\":\"" + $(".lonin_form img").eq(aa++).attr("title") + "\",\"computer_enable\":\"" + $(this).val() + "\"}"; 
             		if($(this).val()==1){
						a++;
					}

						if(aa<$(".lonin_confirm img").length){
							baseComputer+=',';
					}
					
           		 }
			});
			baseComputer+=']';
			$(".phone_form input").each(function(){
				if($(this).is(":checked"))
           		 {
					basePhone+="{\"phone_id\":\"" + $(".phone_form img").eq(bb++).attr("title") + "\",\"phone_enable\":\"" + $(this).val() + "\"}"; 
					if($(this).val()==1){
						b++;
					}
						if(bb<$(".lonin_phone img").length){
							basePhone+=",";
						}
           		 }
			});
			basePhone+=']';
			$(".roll_form input").each(function(){
				if($(this).is(":checked"))
           		 {
					baseLongin+="{\"longin_id\":\"" + $(".roll_form img").eq(cc++).attr("title") + "\",\"longin_enable\":\"" + $(this).val() + "\"}"; 
					if($(this).val()==1){
						c++;
					}
					if(cc<$(".lonin_roll img").length){
						baseLongin+=",";
					}
           		 }
			});
			baseLongin+=']';
			if(a!=6){alert("电脑壁纸出错")};
			if(b!=5){alert("手机壁纸出错")};
			if(c!=5){alert("轮换壁纸出错")};
			if(a==6&&b==5&&c==5){
				$.ajax({
					type:"get",
					url:"<%=basePath%>entry/change.action",
					data:{"baseLongin":baseLongin,"baseComputer":baseComputer,"basePhone":basePhone},
					success:function(data) {
						if(data==1){
							alert("提交成功");
						}else if(data==0){
							alert("提交失败");
						}	
					},
					error:function(data){
		            	alert("提交失败");
			        }
				});
				
				
				
			
			};
		});
		
		$("#Submission1").click(function(){
			$.ajaxFileUpload({
	            url:"<%=basePath%>entry/computerfile.action",
	            fileElementId: "computerfile", //文件上传域的ID，这里是input的ID，而不是img
	            dataType:'text',
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            success: function (data) {
	            	if(data==1){
	            		alert("提交成功");
	            	}else if(data==0){
	            		alert("提交失败");
	            	}
	            },
	            error:function(data){
	            	alert("提交失败");
		        }
	        });
			
		});
		$("#Submission2").click(function(){
		 $.ajaxFileUpload({
	            url:"<%=basePath%>entry/phonefile.action",
	            fileElementId: "phonefile", //文件上传域的ID，这里是input的ID，而不是img
	            dataType:'text',
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            success: function (data) {
	            	if(data==true){
	            		alert("提交成功");
	            	}else if(data==false){
	            		alert("提交失败");
	            	}
	            },
	            error:function(data){
	            	alert("提交失败");
		        }
	        });
		});
		$("#Submission3").click(function(){
		 $.ajaxFileUpload({
	            url:"<%=basePath%>entry/longinfile.action",
	            fileElementId: "longinfile", //文件上传域的ID，这里是input的ID，而不是img
	            dataType:'text',
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            success: function (data) {
	            	if(data==1){
	            		alert("提交成功");
	            	}else if(data==0){
	            		alert("提交失败");
	            	}
	            },
	            error:function(data){
	            	alert("提交失败");
		        }
	        });
		});
		$(".button2").click(function(){
			var baseSchoolView='[';
			var aa=0;
			$(".click_2_2_1 input").each(function(){

				if($(this).is(":checked"))
           		 {
					baseSchoolView+="{\"schoolview_id\":\"" + $(".click_2_2_1 img").eq(aa++).attr("title") + "\",\"schoolview_enable\":\"" + $(this).val() + "\"}"; 
						if(aa<$(".lonin_SchoolView img").length){
							baseSchoolView+=',';
					}
           		 }
			});
			baseSchoolView+=']';
			$.ajax({
				type:"get",
				url:"<%=basePath%>entry/SchoolView.action",
				data:{"baseSchoolView":baseSchoolView},
				success:function(data) {
					if(data==1){
	            		alert("提交成功");
	            	}else if(data==0){
	            		alert("提交失败");
	            	}
					
				},
				error:function(data){
	            	alert("提交失败");
		        }
			});
		});
		
	});
  </script>
 </html>