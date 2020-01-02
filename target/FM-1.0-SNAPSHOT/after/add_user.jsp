<%@page import="com.service.impl.UserServiceImpl"%>
<%@page import="com.service.UserService"%>
<%@page import="com.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>添加/修改用戶</title>

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
	<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
	<!--[if lt IE 9]>
	<script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
	<![endif]-->
<%
	String path=request.getContextPath();
%>
 <%
 	UserService userService=new UserServiceImpl();
    String id=request.getParameter("id");
    if(id != null && !"".equals(id)){
       User user=userService.getUserById(Integer.parseInt(id));
       request.setAttribute("user", user);
    }
 %>
 <script src="<%=path%>/js/jquery.js"></script>
 <script type="text/javascript">
 	function loginOut(){
 		if(confirm("确认退出")){
 	 		location.href="<%=path%>/userOutLogin";
 		}
 	}
 	
 </script>
</head>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<style>
	th {
		text-align: center;
	}
</style>
<script type="text/javascript">
	function showName(obj, id) {
		var jqobj = $(obj);
		$("#tn").val(jqobj.text());
		$("#id1").val(id);
	}
	
	//退出登錄
	function loginOut(){
		if(confirm("確認退出?")){
			location.href="<%=path%>/userOutLogin";
		}
	}
	//name驗證
	function checkname() {
		var username=$("#username").val();
		var namespan=$("#namespan");
		if(username !=null && username != ""){
			$.ajax({
				type:"post",
				url:"/FM/userCheckName",
				data:{"username":username},
				success:function(result){
					if(result == "nametrue"){
						namespan.css("color","red").html("該名稱已存在，請更改！");
					}else{
						namespan.css("color","green").html("OK!");
					}
				}
			});
		}else{
			namespan.css("color","red").html("名稱為必填項！");
		}
	}
	
	//電話驗證
	function checkphone(){
		var phone=$("#phone").val();
		var phonespan=$("#phonespan");
		//alert(phone);
		var mPattern = /^1(3[0-9]|4[5,7]|5[0,1,2,3,5,6,7,8,9]|6[2,5,6,7]|7[0,1,7,8]|8[0-9]|9[1,8,9])\d{8}$/;
		if(phone == null || phone == ""){
			phonespan.css("color","red").html("不能為空！");//有錯！
		}else{
			if(mPattern.test(phone)){
				phonespan.css("color","green").html("格式正確！");
			}else{
				phonespan.css("color","red").html("格式錯誤！");
			}
		}
	}
	//郵箱驗證
	function checkmail() {
		var mail=$("#mail").val();
		var mailspan=$("#mailspan");
		var ePattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		if(mail == null || mail == ""){
			mailspan.css("color","red").html("請填寫郵箱！");
		}else{
			$.ajax({
				type:"post",
				url:"/FM/userCheckMail",
				data:{"mail":mail},
				success:function(result){
					if(result == "true"){
						mailspan.css("color","red").html("該郵箱已被註冊!");
					}else{
						if(ePattern.test(mail)){
							mailspan.css("color","green").html("ok!");
						}else{
							mailspan.css("color","red").html("郵箱格式錯誤！");							
						}
					}
				}
			});
		}
	}
	
	//密碼驗證,第一次輸入時
	function checkpws1() {
		var password1=$("#password1").val();
		var pwdspan1=$("#pwdspan1");
		if(password1 == null || password1 == ""){
			pwdspan1.css("color","red").html("密碼不能為空！");
		}else{
			if(password1.length<4){
				pwdspan1.css("color","yellow").html("密碼安全性低");
			}else{
				pwdspan1.css("color","green").html("密碼安全OK!");
			}
		}
	}
	//密碼第二次輸入
	function  checkpwd2() {
		var password1=$("#password1").val();
		var password2=$("#password2").val();
		var pwdspan2=$("#pwdspan2");
		if(password2 == null || password2 == ""){
			pwdspan2.css("color","red").html("密碼不能為空！");
		}else{
			if(password2.length<4){
				pwdspan2.css("color","yellow").html("密碼安全性低");
			}else{
				if(password1==password2){
					pwdspan2.css("color","green").html("密碼安全OK!");
				}else{
					pwdspan2.css("color","red").html("密碼前後輸入不一致！");
				}
			}
		}
	}
</script>

</head>
<body>
<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=path%>/goodsGetAllByPageFuzzy">锋迷網管理系统</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			 id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=path%>/goodsGetAllByPageFuzzy">商品管理 <span class="sr-only">(current)</span></a></li>
				<li><a href="<%=path%>/goodsTypeGetAll">商品類型管理</a></li>
				<li  class="active"><a href="<%=path%>/userListSevlet">用户管理</a></li>
				<li><a href="#">訂單管理</a></li>
				<li><a href="<%=path%>/goodsGetAllByPageFuzzy">直通蜂迷網</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="<%=path%>/userListSevlet">${user.username}</a></li>
					<li><a onclick="loginOut()">
						<span class="glyphicon glyphicon-log-in" style="padding-left:0px"></span>
					</a>
				</li>
				<li>
					<a onclick="loginOut()" style="padding-left:0px">退出</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<div class="jumbotron" style="padding-top:20px;padding-bottom:25px">
	<div class="container">
		<c:if test="${empty admin.id}">
		<h2>添加用戶</h2>
		</c:if>
		<c:if test="${not empty admin.id}">
		<h2>修改用戶信息</h2>
		</c:if>
	</div>
</div>

<div class="container">
	<form class="form-horizontal" action="<%=path%>/userUpdateOrAdd" method="post">
		<input type="hidden" name="id" value="${user.id}" />
		
		<div class="form-group">
			<label class="col-sm-2 control-label">名稱</label>
				<div class="col-sm-6">
				<input type="text" class="form-control"
					   placeholder="請輸入名稱" name="username" id="username" 
					   value="${user.username}"
					   onblur="checkname()" required="required">
				</div>
				<span id="namespan"></span>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">電話</label>
				<div class="col-sm-6">
				<input type="text" class="form-control"  
					   placeholder="請輸入電話" name="phone" id="phone"
					   value="${user.phone}"
					   onblur="checkphone()"/>
				</div>
				<span id="phonespan"></span>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">郵箱</label>
				<div class="col-sm-6">
				<input type="text" class="form-control" 
					   placeholder="請輸入郵箱" name="mail" id="mail"
					   value="${user.mail}"
					   onblur = "checkmail()" required="required">
				</div>
				<span id="mailspan"></span>
		</div>
	
		<div class="form-group">
			<label class="col-sm-2 control-label">密碼</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" 
					   placeholder="请输入密码" name="password" id="password1"
					   value="${user.password}" 
					   onblur="checkpws1()" required="required">
				</div>
				<span id="pwdspan1"></span>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">密碼</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" 
					   placeholder="请確認密码" name="password2" id="password2" 
					   value="${user.password}" 
					   onblur = "checkpwd2()" required="required"/>
			</div>
			<span id="pwdspan2"></span>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">保存</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>

