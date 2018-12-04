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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/student.css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.3&key=3df877a70685dac5ecb3afa375d4c305"></script>
	<title>学生信息填写</title>
	<style>
	</style>
	<body>
	  <div class="whole">
		<div class="tou">
		  <h1>学生签到信息填写</h1><br/>
		  <hr/>
		</div>
		<div class="neir">
			<ul>
			  <li><span class="span">姓名：</span><input id="student_name" type="text" name="student_name"  autocomplete="off"/></li>
			  <li><span class="span">学号：</span><input id="student_school" type="text" name="student_school"  autocomplete="off"/></li>
			  <li><span class="span">班级：</span><input id="student_class" type="text" name="student_class"  autocomplete="off"/></li>
			  <li><span class="span">座位号：</span><input id="student_seat" type="text" name="student_seat"  autocomplete="off"/></li>
			</ul>
			  <span class="span" style="font-size:40px;">当前位置：</span><textarea id="student_position" name="student_position"rows="5" cols="25" style="resize:none;font-size:40px;"readonly>	</textarea>
			<br/><br/><br/><input id="button" style="width:100px;height:60px;font-size:40px;margin:0 10%;"type="button" value="提交"/>
		</div>
		
		<div id="Deposit" style="display:none;">
	 	  <input id="Deposit_id"type="text" value="${Teacher_name}"/>
		</div>
		<div id="Success" style="border-radius:5px;border-style:ridge;border-width:10px;display:none;width:100%;height:100%;position:absolute;left:0px;top:0px;background:#ffffff;">
	 	  <h1 style="margin:0 30%;font-size:80px;">提交成功</h1><br/>  <hr/>
		  <div class="operation">
			<a id="Refresh" href="#" style="font-size:80px;">再次添加</a><br/><br/><br/><a id="close" href="#" style="font-size:80px;">关闭</a>
		  </div>
		
		</div>
	  </div>
	</body>
	<script>
		var teacher_id="";
		var stringify="";
	   $(document).ready(function(){
		   teacher_id=$("#Deposit_id").val();
		   if(teacher_id==""||teacher_id==null||teacher_id==0){
			   location.href='${pageContext.request.contextPath}/ewm/jinzhi.action';
		   }
	    var mapObj = new AMap.Map('iCenter');
		mapObj.plugin('AMap.Geolocation', function () {
        geolocation = new AMap.Geolocation({
            enableHighAccuracy: true, // 是否使用高精度定位，默认:true
            timeout: 10000,           // 超过10秒后停止定位，默认：无穷大
            maximumAge: 0,            // 定位结果缓存0毫秒，默认：0
            convert: true,            // 自动偏移坐标，偏移后的坐标为高德坐标，默认：true
            showButton: false,         // 显示定位按钮，默认：true
            buttonPosition: 'LB',     // 定位按钮停靠位置，默认：'LB'，左下角
            buttonOffset: new AMap.Pixel(10, 20), // 定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            showMarker: false,         // 定位成功后在定位到的位置显示点标记，默认：true
            showCircle: false,         // 定位成功后用圆圈表示定位精度范围，默认：true
            panToLocation: false,      // 定位成功后将定位到的位置作为地图中心点，默认：true
            zoomToAccuracy:false       // 定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
        });
        mapObj.addControl(geolocation);
        geolocation.getCurrentPosition();
        AMap.event.addListener(geolocation, 'complete', onComplete); // 返回定位信息
        AMap.event.addListener(geolocation, 'error', onError);       // 返回定位出错信息
    });
    function onComplete(obj){
        stringify=obj.formattedAddress+'精度范围：' + obj.accuracy + '米';
		document.getElementById("student_position").value=stringify;
    }
    function onError(obj) {
		document.getElementById("student_position").value="定位失败！！这位学生你很皮";
    }
	$("#button").click(function(){
		var student="{";
		var student_name=$("#student_name").val();
		var student_school=$("#student_school").val();
		var student_class=$("#student_class").val();
		var student_seat=$("#student_seat").val();
		var student_position=$("#student_position").val();
		var student_id=$("#Deposit_id").val();
		if(student_name==""||student_school==""||student_class==""||student_seat==""){
		  alert("信息填写不完整");
		}else{
		  student+="\"student_id\":\""+student_id+"\",\"student_name\":\""+student_name+"\",\"student_school\":\""+student_school+"\",\"student_class\":\""+student_class+"\",\"student_seat\":\""+student_seat+"\",\"student_position\":\""+student_position+"\"}";
		//学生签到提交信息
		  $.ajax({
					type:"post",
					url:"<%=basePath%>ewm/submission.action",
					data:{"student":student,"teacher_id":teacher_id},
					success:function(data) {
						if(data==true){
							$("#Success").show();
						}else{
							 location.href='${pageContext.request.contextPath}/ewm/jinzhi.action';
						}
					},
					error:function(data){
						location.href='${pageContext.request.contextPath}/ewm/jinzhi.action';
			        }
		
	});
		}
	});
	$("#close").click(function(){
	  window.open("about:blank","_self").close();
	});
	$("#Refresh").click(function(){
	  location.reload();
	});
	});
	</script>
  </head>