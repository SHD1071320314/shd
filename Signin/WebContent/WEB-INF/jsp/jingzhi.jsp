<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>禁止页面</title>
	<style>
		span{font-size:240%;}
	</style>
	<body>
	 <div style="width:100%;">
		<span style="margin:0 30%">页面已被关闭，还有<span id="spanz" style="color:#FF0000;">5</span>秒即将跳转</span>
	 </div>
	</body>
		<script type="text/javascript">
		onload=function(){
			setInterval(go, 1000);
		};
		var x=5; //利用了全局变量来执行
		function go(){
		x--;
			if(x>0){
			document.getElementById("spanz").innerHTML=x;  //每次设置的x的值都不一样了。
			}else{
			location.href='${pageContext.request.contextPath}/ewm/tiaozhuan.action';
			}
		}
	</script>

  </head>