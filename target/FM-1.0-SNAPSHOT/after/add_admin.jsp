<%@page import="com.entity.Admin"%>
<%@page import="com.service.AdminService"%>
<%@page import="com.service.impl.AdminServiceImpl"%>
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
	<title>修改admin</title>

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
 
 <script src="<%=path%>/js/jquery.js"></script>
 
 <script type="text/javascript">
 	function logout(){
 		if(confirm("确认退出")){
 	 		location.href="<%=path%>/adminOutLogin";
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
	
	function checkname() {
		var username=$("#username").val();
		if(username ==null || username==""){
			$("#span1").css("color","red").html("不能为空！");
		}else{
			$.ajax({
				type:"post",
				url:"/FM/adminCheckName",
				data:{"username":username},
				success:function(data){
					if(data=="true"){
						$("#span1").css("color","red").html("该用户已存在！");
					}else{
						$("#span1").css("color","green").html("OK！");
					}
				}
				/* error:function(){
					
				} */
			});
		}
	}
	
	function checkpwd1() {
		var password1=$("#password1").val();
		var pwdspan1=$("#pwdspan1");
		
		if(password1 == null || password1 == ""){
			pwdspan1.css("color","red").html("不能为空！！");
		}else {
			pwdspan1.css("color","green").html("");
		}
	}
	function checkpwd2() {
		var password1=$("#password1").val();
		var password2=$("#password2").val();
		var	pwdspan2=$("#pwdspan2");
		if(password2 == null || password2 == ""){
			pwdspan2.css("color","red").html("不能为空！");
		}else if(password1 != password2){
			pwdspan2.css("color","red").html("两次密码不一致，请重新输入");
		}else{
			pwdspan2.css("color","red").html("");
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
			<a class="navbar-brand" href="<%=path%>/goodsGetAllByPageFuzzy">锋迷网管理系统</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			 id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=path%>/goodsGetAllByPageFuzzy">商品管理 <span class="sr-only">(current)</span></a></li>
				<li><a href="<%=path%>/goodsTypeGetAll">商品类型管理</a></li>
				<li><a href="<%=path%>/userListSevlet">用户管理</a></li>
				<li class="active"><a href="<%=path%>/adminList">管理员信息</a></li>
				<li><a href="<%=path%>/goodsGetAllByPageFuzzy">直通锋迷网</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="<%=path%>/adminList">${admin.username}</a></li>
				<li><a onclick="logout()"><span class="glyphicon glyphicon-log-in"
						      style="padding-left:0px"></span></a></li>
				<li><a style="padding-left:0px" onclick="logout()">退出</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<!--用於更改信息回顯  -->
<% 
	AdminService adminService=new AdminServiceImpl();
	String ID=request.getParameter("aid");
	Admin admin=new Admin();
	int id=0;
	if(ID != null && !"".equals(ID)){
		id=Integer.parseInt(ID);
		admin=adminService.getAdminById(id);
		request.setAttribute("admin", admin);
	}
%>


<div class="jumbotron" style="padding-top:20px;padding-bottom:25px">
	<div class="container">
		<c:if test="${empty admin.id}">
		<h2>添加admin</h2>
		</c:if>
		<c:if test="${not empty admin.id}">
		<h2>修改admin</h2>
		</c:if>
	</div>
</div>

<div class="container">
	<form class="form-horizontal" action="<%=path%>/adminUpdateOrAdd" method="post">
		<input type="hidden" name="id" value="${admin.id}" />
		
		<div class="form-group">
			<label class="col-sm-2 control-label">admin名称</label>
				<div class="col-sm-6">
				<input type="text" class="form-control" id="username"
					   placeholder="请输入用户名" name="username"
					   value="${admin.username}"
					   onblur="checkname()"
					   required="required">
				</div>
		<span name="span1" id="span1"></span>
		</div>
	
		<div class="form-group">
			<label class="col-sm-2 control-label">admin密码</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="password1"
					   placeholder="请输入密码" name="password"
					   value="${admin.password}" 
					    onblur="checkpwd1()"
					    required="required">
				</div>
				<span  id="pwdspan1"></span>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">admin密码</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="password2"
					   placeholder="请再次输入密码" name="password2"
					   value="${admin.password}"
					    onblur="checkpwd2()" 
					    required="required">
			</div>
			<span  id="pwdspan2"></span>
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

