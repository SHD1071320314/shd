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
<title>管理界面</title>
</head>
	<body style="width:100%;height:100%;margin:0px;padding:0px;">
		<!--forech  list-->
		<c:forEach items="${listmap }" var="li">
		<div style="width:100%;border:2px solid;margin:10px 0px 0px 0px;float:left;">
		<c:forEach items="${li }" var="map">
		
			<div style="width:50%;float:left;">
				<input type="button" style="height:50px;margin: 0 20px;" value="子图片上传" onclick="addzitupasd(${map.key.product_id })"/><input id="canpingname_${map.key.product_id }" type="text" onfocus="this.select()" placeholder="产品名称" value="${map.key.product_name }" /><a class="deleteasd" style="margin: 0 0;cursor:pointer;background:#cc99cc;"onclick="adeleteasd(${map.key.product_id },${map.key.product_correspondname })">更改</a><a class="delete" style="margin: 0 17%;cursor:pointer;background:#cc99cc;"onclick="adelete(${map.key.product_id })">产品删除</a>
				<br/>
				<input id="product_taobao_${map.key.product_id }" type="text" style="width:40%;"name="product_taobao" onfocus="this.select()" class="product_taobao" placeholder="淘宝链接" value="${map.key.product_taobao }"/>
				<a class="pudel" style="margin: 0 100px;cursor:pointer;background:#cc99cc;"onclick="pudel(${map.key.product_id },${map.key.product_correspond })">增加链接</a><br/><br/>
				<img name="1"style="width:100%;" src="<%=basePath%>${map.key.product_url }"/>
				<c:forEach items="${map.key.url}" var="ul"><!-- list -->
				<img style="width:48%;margin:0 0 0 5px; " src="<%=basePath%>${ul }"/>
				</c:forEach>
			</div>
			<div style="width:50%;float:left;margin:10px 0 0 0 ;">
			<div class="producttext">
			<c:forEach items="${map.value }" var="ke"><!-- 第一个map的value的list -->
		  	  <c:forEach items="${ke}" var="kes"><!-- map -->
		  	 <div >
		  	 	<h2 style="margin:0 50px;">${kes.key }</h2>
		  	 </div>
		  	 <div style="width:100%">
		  	  		<table style="width:100%">
		  	  			 <c:forEach items="${kes.value }" var="val">
		  	  			<tr>
		  	  			  <td style="font-size:150%;width:50%;text-align:center;">${val.producttext_name }</td>
		  	  			  <td style="font-size:120%;width:50%;text-align:center;">${val.producttext_parameter }</td>
		  	  			</tr>
		  	  			</c:forEach>
		  	  		</table>
				
		  	  </div>
			  <hr/>
			  </c:forEach>
			  </c:forEach>
		  	 </div>
		  	 
		  	 
			 <div style="height:50px;width:100%;float:left;margin:10px 0 0 0 ;">
				<a class="tianjia" style="cursor:pointer;margin:100%;margin:0 45%;"onclick="editCustomer(${map.key.product_id })">添加标题</a>
			 </div>
			</div>
			</c:forEach>
		</div>
		</c:forEach>
		<div id="displaynone"style="border:2px solid;position:fixed;display:none;left:1100px;top:190px;width:500px;background:#cc99cc">
				<div id="tjqq">
				标题：<input type="text" name="producttable_table" id="producttable_table"/><br/>
				<div class="fortext">内容：<input type="text" name="producttext_name" id="producttext_name"/>参数：<input type="text" name="producttext_parameter" id="producttext_parameter"/><br/></div>
				</div>
				<h2 id="add"style="cursor:pointer;width:50px;float:left;">添加</h2>
				<h2 id="close"style="cursor:pointer;width:50px;float:left;margin:22px 0 0 50px;">关闭</h2>
			 </div>
			 <div id="displaynones"style="border:2px solid;position:fixed;display:none;left:550px;top:190px;height:80px;background:#cc99cc">
				子图片图片添加:<input id="ziproductfile" name="ziproductfile" type="file" style="margin:10px 0;"/><a class="zitup" style="margin:0 50px;cursor:pointer;background:#cc99cc;">增加</a><a class="zitups" style="margin:0 50px;cursor:pointer;background:#cc99cc;">关闭</a>
			 </div>
			<div>
			<input id="productfile" type="file" name="productfile" style="margin: 0 0 0 50%;height: 50px;"/><input id="Submission1" type="button" value="产品提交"/>
		</div> 
	</body>
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>
  <script>
	
	$(document).ready(function(){
	  
		
	  });
	  
	  function editCustomer(id){
		$("#displaynone").show();
		
		
		$("#close").click(function(){
			
			var j=1;
			$(".fortext input").each(function(){
				if($(this).val()==""||$(this).val()==null){
					j=0;
				}
			});
			if(j==1){
			var i=1;
			var producttable_table=$("#producttable_table").val();
			var producttext="[";
			$(".fortext").each(function(){
				producttext+="{\"producttext_name\": \""+$(this).find("input").eq(0).val()+"\",\"producttext_parameter\":\""+$(this).find("input").eq(1).val()+"\"}";	
				if(i!=$(".fortext").length){
					producttext+=",";
				}
				i++;
			});
			producttext+="]";
			$.ajax({
				type:"post",
				url:"<%=basePath%>change/producttable.action",
				data:{"producttable_correspond":id,"producttable_table":producttable_table,"producttext":producttext},
				success:function(data) {
					if(data==true){
	            		alert("提交成功");
	        			window.location.reload();
	            	}else if(data==0){
	            		alert("提交失败");
	            		$("#displaynone").html("<div id='tjqq'>标题：<input type='text' name='producttable_table' id='producttable_table'/><br/><div class='fortext'>内容：<input type='text' name='producttext_name' id='producttext_name'/>参数：<input type='text' name='producttext_parameter' id='producttext_parameter'/><br/></div></div><h2 id='add'style='cursor:pointer;width:50px;float:left;'>添加</h2><h2 id='close'style='cursor:pointer;width:50px;float:left;margin:22px 0 0 50px;'>关闭</h2>	");
	            		$("#displaynone").hide();
	            	}
				},
				error:function(data){
	            	alert("提交失败");
	            	$("#displaynone").html("<div id='tjqq'>标题：<input type='text' name='producttable_table' id='producttable_table'/><br/><div class='fortext'>内容：<input type='text' name='producttext_name' id='producttext_name'/>参数：<input type='text' name='producttext_parameter' id='producttext_parameter'/><br/></div></div><h2 id='add'style='cursor:pointer;width:50px;float:left;'>添加</h2><h2 id='close'style='cursor:pointer;width:50px;float:left;margin:22px 0 0 50px;'>关闭</h2>	");
	            	$("#displaynone").hide();
				}
			});
			}else{
				$("#displaynone").html("<div id='tjqq'>标题：<input type='text' name='producttable_table' id='producttable_table'/><br/><div class='fortext'>内容：<input type='text' name='producttext_name' id='producttext_name'/>参数：<input type='text' name='producttext_parameter' id='producttext_parameter'/><br/></div></div><h2 id='add'style='cursor:pointer;width:50px;float:left;'>添加</h2><h2 id='close'style='cursor:pointer;width:50px;float:left;margin:22px 0 0 50px;'>关闭</h2>	");
				$("#displaynone").hide();
			}
		});
		
		
		$("#add").click(function(){
			$("#tjqq").append("<div class='fortext'>内容：<input type='text' name='producttext_name' id='producttext_name'/>参数：<input type='text' name='producttext_parameter' id='producttext_parameter'/><br/></div>");
		});
		
	  }	
	  
	  function pudel(id,product_correspond){
		  
		  $.ajax({
				type:"post",
				url:"<%=basePath%>change/pudel.action",
				data:{"product_id":id,"product_taobao":$("#product_taobao_"+id).val(),"product_correspond":product_correspond},
				success:function(data) {
					alert("链接增加/更改成功");
					window.location.reload();
				},
				error:function(data){
					window.location.reload();
				}
			});
	   }
	  function adelete(id){
		  $.ajax({
				type:"post",
				url:"<%=basePath%>change/dellte.action",
				data:{"product_id":id},
				success:function(data) {
					window.location.reload();
				},
				error:function(data){
					window.location.reload();
				}
			});
	  }
	  $("#Submission1").click(function(){
			$.ajaxFileUpload({
	            url:"<%=basePath%>change/productfile.action",
	            fileElementId: "productfile", //文件上传域的ID，这里是input的ID，而不是img
	            dataType:'text',
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",

	            success: function (data) {
	            	if(data==true){
	            		alert("提交成功");
	            		window.location.reload();
	            	}else{
	            		alert("提交失败");
	            		window.location.reload();
	            	}
	            },
	            error:function(data){
	            	alert("提交失败");
	            	window.location.reload();
		        }
	        });
			
		});
	  function addzitup(id){
		  
	  }
	  function addzitupasd(id){
		  $("#displaynones").show();
		  $(".zitup").click(function(){
			  $.ajaxFileUpload({
		            url:"<%=basePath%>change/ziproductfile.action",
		            fileElementId: "ziproductfile", 
		            dataType:'text',
		            contentType: "application/x-www-form-urlencoded; charset=utf-8",
		            data:{"productid_correspond":id},
		            success: function (data) {
		            	if(data==true){
		            		window.location.reload();
		            	}else{
		            		alert("提交失败");
		            		window.location.reload();
		            	}
		            },
		            error:function(data){
		            	alert("提交失败");
			        }
		        });
		  });
		  $(".zitups").click(function(){
			  $("#ziproductfile").val("");
			  $("#displaynones").hide();
		  });
	  }
	  function adeleteasd(id,name){
		  $.ajax({
				type:"post",
				url:"<%=basePath%>change/canpingname.action",
				data:{"product_id":id,"product_name":$("#canpingname_"+id).val(),"product_correspondname":name},
				success:function(data) {
					if(data==true){
						alert("提交/更改成功");
	            		window.location.reload();
	            	}else{
	            		alert("提交失败");
	            		window.location.reload();
	            	}
				},
				error:function(data){
					alert("提交失败");
				}
			});
	  }
  </script>
	</html>