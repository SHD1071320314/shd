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
<link rel="shortcut icon" href="<%=basePath%>image/registeredlogin/12138.png" />
<title>回忆茂职</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/Registeredlogin.css"></link>
<style>
	a{text-decoration:none;}
	 .head a:hover {color:#FFFFFF;background:#000000;}  
	.head a {display:block;height:30px;padding:8px 0px 0px 0px ;}
	.head1 a {display:block;height:30px;padding:8px 0px 0px 0px ;}
	.prev{cursor:pointer}
	.next{cursor:pointer}
	.tabs{cursor:pointer}
	.tabss{cursor:pointer}
	.guide li{cursor:pointer}
	.display_picture_delete img{cursor:pointer}
	.guangdong1 li{cursor:pointer}
	.guides li{cursor:pointer}
	.guides{z-index:1;}
	.layer1_img img{cursor:pointer}
	.black_frame{cursor:pointer}
	#wenzi{cursor:pointer}
	.layer2_img{cursor:pointer}
	.black_frame_img img{cursor:pointer}
	.shouji img{cursor:pointer}
	</style>
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<!--头部-->
	  <div class="head">
		<ul >
		  <li><a title="记忆茂职" href="#" class="head_hy" /><i>记忆茂职</i>&nbsp;&nbsp;首页&nbsp;&nbsp;</a></li>
		  <li><a title="介绍" href="https://baike.baidu.com/item/%E8%8C%82%E5%90%8D%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2/2400824?fr=aladdin" target="_blank" class="head_hy1 head_hy" />介绍</a></li>
		  <li><a title="校景" href="<%=basePath%>index/regis/schoolview.action" class="head_hy1 head_hy" />校景</a></li>
		</ul>
		<div class="head1">
		 
		</div>
		<div class="art"><h1 class="art1">记忆茂职</h1></div>
	  </div>
	  <!--内容+导航部-->
	  <hr/>
	  <div class="middle">
		<div class="images">
			<c:forEach items="${longin}" var="log">
				<a  href="#" ><img  class="imagesid" style="display:block;" width="1600px" height="300px" src="<%=basePath%>${log.longin_url}"/></a>
			</c:forEach>
		</div>
		<div class="imagess">
			<a class="prev"><img src="../../image/registeredlogin/prev.png"/></a>
			<a class="next"><img src="../../image/registeredlogin/next.png"/></a>
		</div>
			
		<div class="tabsaa" id="tabss">
		<a class="tabss tabsa" id="tabs1" ></a>
		<a class="tabs tabsa" id="tabs2" ></a>
		<a class="tabs tabsa" id="tabs3" ></a>
		<a class="tabs tabsa" id="tabs4" ></a>
		<a class="tabs tabsa" id="tabs5" ></a>
		</div>
		
	  </div>
	  <hr class="hr"/>
	  
	  <!--底部-->
	  <div class="bottom_content">
		
		
		<div class="iframe">
			<div class="overall">
		<div class="layer1">
			<div class="layer1_title">
				<img width="50px" height="50px" src="../../image/registeredlogin/z7.ico"/>
				<p style="position:absolute;left:60px;top:10px;">精选手机壁纸</p>
			</div>
				<c:forEach items="${phone}" var="ph">
					<div class="layer1_img">
						<a ><img height="270px" width="192px" src="<%=basePath%>${ph.phone_url }"/></a>
					</div>
				</c:forEach>
		</div>
		<div class="layer2">
			<div class="layer1_title">
				<img width="50px" height="50px" src="../../image/registeredlogin/z7.ico"/>
				<p style="position:absolute;left:60px;top:393px;">精选电脑壁纸</p>
			</div>
				<c:forEach items="${computer}" var="com">
					<div class="layer2_img">
						<a ><img height="216px" width="384px" src="<%=basePath%>${com.computer_url }"/></a>
					</div>
				</c:forEach>
		</div>
	</div>
		</div>
	  </div>
	  <div class="bottom">
			<hr/>
			<div class="bottom_1"> 
				<a href="#"><p>技术提供者————茂职院机电系学生</p></a>
				<a href="https://mail.qq.com"><p>有改善建议请联系邮箱1372727770@qq.com</p></a>
			</div>
	  </div>
	  <div class="display_picture">
		<div class="display_picture_delete">
			<img src="../../image/registeredlogin/delete.png">
		</div>
	  </div>
	  <div id="diannao"class="black_frame_img" style="display:none" >
			<img width="1152px" height="648px" src="">
		</div>
		<div id="shouji" class="shouji" style="display:none" >
			<img width="475px" height="844px" src="">
		</div>
	  
</body>
<script>
var index;
var guide = -1;
var rotation = 0;
var rotations = false;
var time;
$(document).ready(function(){
	$(".imagesid").mouseenter(function(){
		$(".prev").show(200);
		$(".next").show(200);
		$(".prev").css("display","block");
		$(".prev").css("background","#000000");
		$(".prev").css("opacity","0.4");
		$(".next").css("display","block");
		$(".next").css("background","#000000");
		$(".next").css("opacity","0.4");
		$(".tabs").mouseenter(function(){
		$(".prev").css("display","block");
		$(".next").css("display","block");
		$(".next").css("opacity","0.4");
		$(".prev").css("opacity","0.4");
		});
		$(".prev").mouseenter(function(){
			$(".prev").css("display","block");
			$(".next").css("display","block");
			$(".next").css("opacity","0.8");
			$(".prev").css("opacity","0.8");
			clearInterval(time);
		});
		$(".next").mouseenter(function(){
			$(".prev").css("display","block");
			$(".next").css("display","block");
			$(".next").css("opacity","0.8");
			$(".prev").css("opacity","0.8");
			clearInterval(time);
		});
		 clearInterval(time);
	});
	$(".imagesid").mouseleave(function(){
		$(".prev").css("display","none");
		$(".next").css("display","none");
		time = setInterval(function(){ttimaaa(++rotation)},5000);
		
	});
	$(".middle").mouseleave(function(){
		$(".prev").css("display","none");
		$(".next").css("display","none");
	});
	
	$(".prev").click(function(){
	rotation--;
	//alert(rotation);
	ttimaaa(rotation);
	});
	$(".next").click(function(){
	rotation++;
	ttimaaa(rotation);
	});
	
	$(".tabsaa").mouseenter(function(){
	 clearInterval(time);
	});
	
	
	time = setInterval(function(){ttimaaa(++rotation)}, 5000);
	
	$(".tabsaa a").mouseenter(function(){
		rotations=true;
		$(this).css("background-color","#228B22");
	
	});
	$(".tabsaa a").mouseleave(function(){
	
	if(rotations==true){
	if($(".tabsaa a").index(this)!=rotation){
		$(this).css("background-color","#778899");
		}
	}
	});
	
	
	$("#tabs1").click(function(){
		rotation=0;
		ttimaaa(rotation);
	});
	$("#tabs2").click(function(){
		rotation=1;
		ttimaaa(rotation);
	});
	$("#tabs3").click(function(){
		rotation=2;
		ttimaaa(rotation);
	});
	$("#tabs4").click(function(){
		rotation=3;
		ttimaaa(rotation);
	});
	$("#tabs5").click(function(){
		rotation=4;
		ttimaaa(rotation);
	});
	function ttimaaa(i){
		if(i==5){i=0;rotation=0;}
		if(i==-1){i=4;rotation=4;}
		rotations=false;
		var img=$(".images img");
		img.animate({opacity:'0.4'},100);
		
		setTimeout(function () { 
		$(".images a img").eq(i).css("display","block");
		$(".tabsaa a").eq(i).css("background-color","#228B22");
		for(var j=0; j<i; j++){
		$(".images a img").eq(j).css("display","none");
		$(".tabsaa a").eq(j).css("background-color","#778899");
		}
		for(var j=i+1; j<5; j++){
		$(".images a img").eq(j).css("display","none");
		$(".tabsaa a").eq(j).css("background-color","#778899");
		}
		img.animate({opacity:'1'},50);
		}, 150);
		
		
		
	}
	
	
	$(".guide li").mouseenter(function(){
		guide = $(".guide li").index(this);
		$(this).css("background","#D2691E");
		$(this).css("opacity","0.7");
		$(this).css("color","#ffffff");
		//alert(guide);
		guides();
	});
	$(".guide li").mouseleave(function(){
		$(this).css("background","#E0FFFF");
		$(this).css("color","#000000");
		//$(".guides").css("display","none");
		//setInterval(function(){}, 3000);
	});
	$(".guides li").mouseenter(function(){
		$(this).css("background","#D2691E");
		$(this).css("opacity","0.7");
		$(this).css("color","#ffffff");
		//alert(guide);
	});
	$(".guides li").mouseleave(function(){
		$(this).css("background","#E0FFFF");
		$(this).css("color","#000000");
		//$(".guides").css("display","none");
		//setInterval(function(){}, 3000);
	});
	$(".guide").mouseleave(function(){
		$(".guides").css("display","none");
	});
	$(".guides").mouseenter(function(){
		$(this).css("display","block");
		$(".guides ul").eq(guide).css("display","block");
	});
	$(".guides").mouseleave(function(){
		$(this).css("display","none");
	});
	
	function guides(){
		$(".guides").show(200);
		$(".guides").css("display","block");
		$(".guides").css("background","#E0FFFF");
		$(".guides ul").css("display","none");
		//$(".guides").css("display","none");
		
		//$(".guides").css("display","none");
		
		$(".guides ul").eq(guide).css("display","block");
		//alert(guide);
	}
	
	$(".layer2_img img").click(function(){
		var i = $(".layer2_img img").index(this);
		/*alert(i);
		alert($(".layer2_img img")[i].src);*/
		var src = $(".layer2_img img")[i].src; 
		$(".black_frame_img img").attr("src",src);
		$(".display_picture").css("display","block");
		$(".black_frame_img").show(100);
		
	});
	$(".display_picture_delete img").click(function(){
		$(".display_picture").css("display","none");
		$(".black_frame_img").css("display","none");
	});
	$(".layer1_img img").click(function(){
		var i = $(".layer1_img img").index(this);
		/*alert(i);
		alert($(".layer2_img img")[i].src);*/
		var src = $(".layer1_img img")[i].src; 
		$(".shouji img").attr("src",src);
		$(".display_picture").css("display","block");
		$(".shouji").show(100);
		
	});
	$(".display_picture_delete img").click(function(){
		$(".display_picture").css("display","none");
		$(".shouji").css("display","none");
	});
	
	$(window).keyup(function(e){
　  　　if(e.keyCode==27){//此处代表按的是键盘的Esc键
 　　　 　　clearLogs();
　　　　}   
　　});
});
function clearLogs(){
	$(".display_picture").css("display","none");
	$(".black_frame_img").css("display","none");
	$(".shouji").css("display","none");
}
</script>
</html>