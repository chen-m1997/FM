<%@page import="com.util.PageUtil"%>
<%@page import="com.entity.Admin"%>
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
    <title>admin主页</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
 <% 
    String path=request.getContextPath();//获取上下文地址
 %>
 
 <script type="text/javascript">
 //退出登錄	
 function logout(){
 		if(confirm("确认退出")){
 	 		location.href="<%=path%>/adminOutLogin";
 		}
 	} 
 	
	// 全/反选
	function checkAll() {
		var ids=document.getElementsByName("adminids");
		var all=document.getElementById("all");
		if(all.checked){
			for (var i = 0; i < ids.length; i++) {
				ids[i].checked=true;
			}
		}else{
			for (var i = 0; i < ids.length; i++) {
				ids[i].checked=false;
			}
		}
	}
	//解决未全选 全选按钮显示问题
	function checkNoAll() {
		var ids=document.getElementsByName("adminids");
		var all=document.getElementById("all");
		var count = 0;
		for (var i = 0; i < ids.length; i++) {
			if(ids[i].checked){
				count++;
			}
		}
		if(count==ids.length){
			all.checked=true;
		}else{
			all.checked=false;
		}
	}
	//批量删除上标/选中数据总条数
	function doit() {
		var n = 0;
		var objs = document.getElementsByName("adminids");
		for (var i = 0; i < objs.length; i++) {
			if (objs[i].checked) {
				n++;
			}
		}
		document.getElementById("number").innerText =n;
	}
	//批量删除
	function checkDelete(){
		var aids = document.getElementsByName("adminids");
		var ids=[];
		var j=0;
		for (var i= 0; i < aids.length; i++) {
			if(aids[i].checked){
				ids[j]=aids[i].value;
				j++;
			}
		}
		if(j>0){
			if(window.confirm("您确定要删除这些用户？")){
				 window.location.href="<%=path%>/adminDelById?ids="+ids; 
			}
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
                <li><a href="<%=path%>/goodsGetAllByPageFuzzy">商品管理</a></li>
                <li><a href="<%=path%>/goodsTypeGetAll">商品类型管理</a></li>
                <li><a href="<%=path%>/userListSevlet">用户管理</a></li>
                <li class="active"><a href="<%=path%>/adminList">管理员信息</a></li>
                <li><a href="<%=path%>/goodsGetAllByPageFuzzy">直通锋迷网</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="<%=path%>/adminList">${admin.username}<span class="sr-only">(current)</span></a></li>
                <li><a onclick="logout()"><span class="glyphicon glyphicon-log-in"
                                      style="padding-left:0px"></span></a></li>
                <li><a style="padding-left:0px" onclick="logout()">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="jumbotron" style="padding-top:20px;padding-bottom:25px">
    <div class="container">
        <h2>管理员主页</h2>
    </div>
</div>

<script type="text/javascript">
	function addAdmin(){
		var falg=confirm("确认添加");
		if(falg){ 
			location.href="<%=path%>/after/add_admin.jsp";
		 } 
	}
</script>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <!-- <button type="submit" onclick="addAdmin()"   
             class="btn btn-info">添加Admin</button> -->
             <button type="button" class="btn btn-primary" onclick="checkDelete()">批量删除<span class="badge" id=number></span></button>
        </div>
        <form class="form-inline"  action="<%=path%>/adminList" method="post">
						<div class="form-group">
							<input type="text" class="form-control"  name="username" id="exampleInputName1" value="${username}" placeholder="用户名">
						</div>
						<button type="submit" class="btn btn-info">查询</button>
		</form>
    </div>
</div>
<!--获取查询框输入内容-->
	 <script type="text/javascript">
	 	var inputname=document.getElementById("exampleInputName1").value;
	 </script>		 
<!--以下显示表格-->
<div class="container" style="margin-top:20px;">
    <form id="deleteFrom" action="<%=path%>/adminUpdateOrAdd" method="post">
        <table style="text-align: center;margin-right:10px;width:99%"
               class="table table-striped table-hover table-bordered"
               onclick="checkNoAll()">
            <thead style="text-align: center;">
            <tr>
            	<th><input type="checkbox" id="all" onclick="checkAll(),doit()"/></th>
                <th>序号</th>
                <th>Admin名称</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${adminList}" var="admin" varStatus="obj">
            <tr>
           		<td><input type="checkbox" name="adminids" value="${admin.id}"  onclick="doit()"/></td>
                <td>${obj.count}</td>
                <td>${admin.username}</td>
                <td>
                	 <a href="<%=path%>/after/add_admin.jsp?aid=${admin.id}" >
                	 	<span class="glyphicon glyphicon-edit"  color="#5BC0DE"
                	 	onclick="if(confirm('确认修改'+'${admin.username}')==false) return false">
                       </span>
                     </a>
                </td>
                <td>
                	<a class="glyphicon glyphicon-trash" color="#5BC0DE" style="text-decoration:none" 
                		href="<%=path%>/adminDelById?ids=${admin.id}" 
                		onclick="if(confirm('是否删除'+'${admin.username}')==false) return false">
                	</a>
                </td>

            </tr>
          </c:forEach>
            </tbody>
        </table>
    </form>
</div>


<div class="container">
			<nav aria-label="..." class="navbar-right" style="margin-right:15px">
			  <ul class="pagination">
	
	
		<%/*获取搜索框输入内容 searchName  传入URl 解决跳页搜索框内容改变问题*/
			String searchName=request.getParameter("username");
			if(searchName==null || searchName.equals("null")){//解决输入框为 null 问题
				searchName="";
			}
		%>
<!--  分页-->
		<%
			Object objNo=request.getAttribute("pu");
	  		PageUtil pu=(PageUtil)objNo;
	    	int pageNo = pu.getPageNo();
			int pageCount = pu.getPageCount();
				if(pageNo>1){
		%>
				<li class="disabled"><a href="<%=path%>/adminList?pageNo=${pu.pageNo-1}&username=<%=searchName%>" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li class="active">  <a href="<%=path%>/adminList?pageNo=1&username=<%=searchName%>">首页<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo<=pageCount){
			%>
				<li class="active">  <a href="<%=path%>/adminList?pageNo=${pu.pageNo}&username=<%=searchName%>">${pu.pageNo}<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo+1<=pageCount){
			%>	
				<li class="active">  <a href="<%=path%>/adminList?pageNo=${pu.pageNo+1}&username=<%=searchName%>">${pu.pageNo+1}<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo+2<=pageCount){
			%>
				<li class="active">  <a href="<%=path%>/adminList?pageNo=${pu.pageNo+2}&username=<%=searchName%>">${pu.pageNo+2}<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo<pageCount){
			%>
				<li class="active">  <a href="<%=path%>/adminList?pageNo=${pu.pageCount}&username=<%=searchName%>">尾页<span class="sr-only">(current)</span></a></li>
				<li><a href="<%=path%>/adminList?pageNo=${pu.pageNo+1}&username=<%=searchName%>" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			<%
				}
			%>
			
			 </ul>
			</nav>
		</div>
</body>
</html>

