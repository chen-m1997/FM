<%@page import="com.util.PageUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>用户管理</title>

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
	//退出
	function loginOut(){
		if(confirm("确认退出")){
 			location.href="<%=path%>/userOutLogin";
		}
	}
	// 全/反选
	function checkAll() {
		var obj = document.getElementsByTagName("input");
		if(document.getElementById("all").checked){
			for(var i=0;i<obj.length;i++){
				obj[i].checked = true;
			}
		}else{
			for(var i=0;i<obj.length;i++){
				obj[i].checked = false;
			}
		}		
	}
	//解决未全选 显示问题
	function checkNoAll() {
		var userids=document.getElementsByName("userids");
		var all=document.getElementById("all");
		var count=0;
		for(var i=0;i<userids.length;i++){
			if(userids[i].checked){
				count++;
			}
		}
		if(count==userids.length){
			all.checked=true;
		}else{
			all.checked=false;
		}
	}
	//批量删除上标/选中数据总条数
	function doit() {
		var n = 0;
		var objs = document.getElementsByName("userids");
		for (var i = 0; i < objs.length; i++) {
			if (objs[i].checked) {
				n++;
			}
		}
		document.getElementById("number").innerText =n;
	}
	//批量删除
	function checkDelete(){
		var userids = document.getElementsByName("userids");
		var ids=[];
		var j=0;
		for(var i=0; i<userids.length; i++){
			if(userids[i].checked){
				ids[j]=userids[i].value;
				j++;
			}
		}
		if(j>0){
			if(window.confirm("您确定要删除这些用户？")){
				 window.location.href="<%=path%>/userDelByIdServlet?ids="+ids; 
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
				<a class="navbar-brand" href="<%=path%>/goodsGetAllByPageFuzzy">锋迷网管理系统</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="<%=path%>/goodsGetAllByPageFuzzy">商品管理 <span class="sr-only">(current)</span></a></li>
					<li><a href="<%=path%>/goodsTypeGetAll">商品类型管理</a></li>
					<li class="active"><a href="<%=path%>/userListSevlet">用户管理</a></li>
					<li><a href="#">订单管理</a></li>
					<li><a href="<%=path%>/goodsGetAllByPageFuzzy">直通锋迷网</a></li>
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
			<h2>用户列表</h2>
		</div>
	</div>
	<div class="container">
	 	<div class="col-md-6">
            <button type="button" class="btn btn-primary" onclick="checkDelete()">批量删除<span class="badge" id=number></span></button>
        </div>
		<form class="form-inline" action="<%=path%>/userListSevlet" method="post">
			<div class="col-md-4">
				<div class="form-group">
					<label for="exampleInputName2">用户姓名</label> <input type="text"
						class="form-control" id="exampleInputName2" placeholder="输入姓名" value="${username}"
						name="username">
						<button type="submit" class="btn btn-info" style="margin-left: 1px;">查询</button>
					
				</div>
			</div>
		</form>
	</div>


	<!--以下显示表格-->
	<div class="container" style="margin-top:20px;">
		<form id="deleteFrom"
			action="<%=path%>/admin/delect"
			method="post">
			<table style="text-align: center;margin-right:10px;width:99%"
				class="table table-striped table-hover table-bordered"
				 onclick="checkNoAll()">
				<thead style="text-align: center;">
					<tr>
						<th><input type="checkbox" id="all" onclick="checkAll(),doit()"/></th>
						<th>序号</th>
						<th>用户姓名</th>
						<th>手机号码</th>
						<th>邮箱</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="user" varStatus="obj">
						<tr>
							<td><input type="checkbox" name="userids" value="${user.id}"  onclick="doit()"/></td>
							<td>${obj.count}</td>
							<td>${user.username}</td>
							<td>${user.phone}</td>
							<td>${user.mail}</td>
						
							<td>
                				<a href="<%=path%>/after/add_user.jsp?id=${user.id}" >
                		  		<span class="glyphicon glyphicon-edit"  color="#5BC0DE"
                			   	onclick="if(confirm('确认修改'+'${user.username}')==false) return false">
                      			</span>
                    			</a>
               				</td>
					
							<td>
                				<a class="glyphicon glyphicon-trash" color="#5BC0DE" style="text-decoration:none" 
                					href="<%=path%>/userDelByIdServlet?ids=${user.id}" 
             				   		onclick="if(confirm('是否删除'+'${user.username}')==false) return false">
             				   	</a>
           				    </td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	
	<%
		/*获取搜索框输入内容 searchName  传入URl 解决跳页搜索框内容改变问题*/
		String searchName=request.getParameter("username");
		if(searchName==null || searchName.equals("null")){
			searchName="";
		}
	%>
<!--  分页-->
<div class="container">
			<nav aria-label="..." class="navbar-right" style="margin-right:15px">
			  <ul class="pagination">
	  <%
			Object objNo=request.getAttribute("pu");
			PageUtil pu=(PageUtil)objNo;
			int pageNo = pu.getPageNo();
			int pageCount = pu.getPageCount();
			if(pageNo>1){
		%>
			<li class="disabled"><a href="<%=path%>/userListSevlet?pageNo=${pu.pageNo-1}&username=<%=searchName%>" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
			<li class="active">  <a href="<%=path%>/userListSevlet?pageNo=1&username=<%=searchName%>">首页<span class="sr-only">(current)</span></a></li>
		<%
			}if(pageNo<=pageCount){
		%>
			<li class="active">  <a href="<%=path%>/userListSevlet?pageNo=${pu.pageNo}&username=<%=searchName%>">${pu.pageNo}<span class="sr-only">(current)</span></a></li>
		<%
			}if(pageNo+1<=pageCount){
		%>	
			<li class="active">  <a href="<%=path%>/userListSevlet?pageNo=${pu.pageNo+1}&username=<%=searchName%>">${pu.pageNo+1}<span class="sr-only">(current)</span></a></li>
		<%
			}if(pageNo+2<=pageCount){
		%>
			<li class="active">  <a href="<%=path%>/userListSevlet?pageNo=${pu.pageNo+2}&username=<%=searchName%>">${pu.pageNo+2}<span class="sr-only">(current)</span></a></li>
		<%
			}if(pageNo<pageCount){
		%>
			<li class="active">  <a href="<%=path%>/userListSevlet?pageNo=${pu.pageCount}&username=<%=searchName%>">尾页<span class="sr-only">(current)</span></a></li>
			<li><a href="<%=path%>/userListSevlet?pageNo=${pu.pageNo+1}&username=<%=searchName%>" aria-label="Next"><span aria-hidden="true">»</span></a></li>
		<%
			}
		%>
			 </ul>
			</nav>
		</div>
</body>
</html>
