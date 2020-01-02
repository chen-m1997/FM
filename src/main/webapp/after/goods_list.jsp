<%@page import="com.util.PageUtil"%>
<%@page import="com.service.impl.GoodsTypeServiceImpl"%>
<%@page import="com.service.GoodsTypeService"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>商品管理</title>

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
	
 <script type="text/javascript">
 	function logout(){
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

	<script>
		// 弹框初始化操作
		$(function () {
			$('[data-toggle="popover"]').popover();

		});

		function showAdd(){
			location.href="<%=path%>/after/add_goods.jsp";
		}
		
		//商品类型回显
		 function selectType(id,obj){
		       var jqLi = $(obj);
		       $("#drop").html(jqLi.text()+"<span class='caret'></span>");
		       $("#typeId").val(id);
		   }
		//全/反选
		function checkAll() {
			var obj = document.getElementsByTagName("input");
			if (document.getElementById("all").checked == true) {
				for (var i = 0; i < obj.length; i++) {
					obj[i].checked = true;
				}
			} else {
				for (var i = 0; i < obj.length; i++) {
					obj[i].checked = false;
				}
			}
		}
		
		function checkNoAll() {
			var obj = document.getElementsByName("goodids");
			var j = 0;
			for (var i = 0; i < obj.length; i++) {
				if (obj[i].id != 'all') { 
					if (obj[i].checked == true) { 
						j++;
					}
				}
			}
			if (j == (obj.length)) { 
				document.getElementById("all").checked = true;
			} else {
				document.getElementById("all").checked = false;
			}
		}
		//批量删除上标
		function doit() {
			var n = 0;
			var objs = document.getElementsByName("goodids");
			for (var i = 0; i < objs.length; i++) {
				if (objs[i].checked) {
					n++;
				}
			}
			document.getElementById("number").innerText =n;
		}
		//商品删除
		function checkDelete(){
			var goodsids=document.getElementsByName("goodids");
			var ids=[];
			for(var i=0;i<goodsids.length;i++){
				if(goodsids[i].checked){
					ids[i]=goodsids[i].value;	
				}
			}
			if(window.confirm("您确定要删除这些商品？")){
				if(ids.length>0){
				window.location.href="<%=path%>/goodsDelById?ids="+ids;			
				}
			}
		}	
		
	</script>
	<body>

		<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					 aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%=path%>/goodsGetAllByPageFuzzy">锋迷网管理系统</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="<%=path%>/goodsGetAllByPageFuzzy">商品管理 <span class="sr-only">(current)</span></a></li>
						<li><a href="<%=path%>/goodsTypeGetAll">商品类型管理</a></li>
						<li><a href="<%=path%>/userListSevlet">用户管理</a></li>
						<li><a href="#">订单管理</a></li>
						<li><a href="<%=path%>/goodsTypeGetAll">直通锋迷网</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="<%=path%>/userListSevlet">${user.username}<span class="sr-only">(current)</span></a></li>
						<li> <a onclick="logout()"><span class="glyphicon glyphicon-log-in" style="padding-left:0px"></span></a> </li>
						<li> <a onclick="logout()" style="padding-left:0px">退出</a> </li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
		<div class="jumbotron" style="padding-top:20px;padding-bottom:25px">
			<div class="container">
				<h2>商品管理</h2>

			</div>


		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<button type="button" onclick="showAdd()" id="addBtn" class="btn btn-info">添加商品</button>
					<button type="button" class="btn btn-primary" onclick="checkDelete()">批量删除<span class="badge" id=number></span></button>
				</div>
				
                <%
                	//类型遍历
                  	GoodsTypeService gtd=new GoodsTypeServiceImpl();
					List<GoodsType> goodsTypeList=gtd.getAllGoodsType();
					request.setAttribute("typelist",goodsTypeList);	
				%>
				
				<div class="col-md-6" style="text-align: right;padding-right: 25px;">
					<form class="form-inline"  action="<%=path%>/goodsGetAllByPageFuzzy" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="exampleInputName1"  
							  name="goodsName" value="${goodsName}" placeholder="商品名称">
						</div>
						<div class="form-group">
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button" id="drop" data-toggle="dropdown"
								 aria-haspopup="true" aria-expanded="false">
									--商品类型--
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" aria-labelledby="drop">
									<c:forEach items="${typelist}" var="type">
										<li>
											<a onclick="selectType(${type.id},this)" 
												name="typename" value="${type.typename}">
									${type.typename}
											</a>
										</li>
									</c:forEach>
								</ul>
								<input id="typeId" name="typeId" type="hidden" value="${type.id}" />
							</div>
						</div>
						<button type="submit" class="btn btn-info">查询</button>
					</form>
				</div>
			</div>
		</div>

		<!--以下显示表格-->
		<div class="container" style="margin-top:20px;">

			<table style="text-align: center;margin-right:10px;width:99%" 
			class="table table-striped table-hover table-bordered" onclick="checkNoAll()">
				<thead style="text-align: center;">
					<tr >
						<th><input type="checkbox" id="all" onclick="checkAll(),doit() "/></th>
						<th>序号</th>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>图片</th>
						<th>上架时间</th>
						<th>类型</th>
						<th>商品描述</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="goods" varStatus="obj">
					<tr>
						<td><input type="checkbox" name="goodids" value="${goods.id}"  onclick="doit()"/></td>
						<td>${obj.count}</td>
						<td>${goods.goodsName}</td>
						<td>${goods.price}</td>
						<td><img src="http://localhost:8081/uploadfile/images/${goods.imgPath}" class="img-rounded" height="60px" width="60px"/></td>
						<td>${goods.deployDate}</td>
						<td>${goods.goodsType.typename}</td>
						<td>
						   <button type="button" class="btn btn-primary" data-toggle="popover" data-placement="top" title="商品介绍" data-content="${goods.description}">弹详情</button>
						</td>
						<td><a href="<%=path%>/after/add_goods.jsp?id=${goods.id}" onclick="if(confirm('是否更改'+'${goods.goodsName}')==false) return false"><span class="glyphicon glyphicon-edit" color="#5BC0DE"></span></a></td>
						<td><a href="<%=path%>/goodsDelById?ids=${goods.id}" onclick="if(confirm('是否删除'+'${goods.goodsName}')==false) return false" class="glyphicon glyphicon-trash" color="#5BC0DE"></a></td>
					</tr>
					
				</c:forEach>		
				</tbody>
			</table>
		</div>

	<%
		/*获取搜索框输入内容 searchName  传入URl 解决跳页搜索框内容改变问题*/
		String typeId=request.getParameter("typeId");
		String goodsName=request.getParameter("goodsName");//解决点击页码后，输入框为null问题
		if(typeId==null || typeId.equals("null")){
			typeId="";
		}
		if(goodsName==null || goodsName.equals("null")){
			goodsName="";
		}
		String searchType="&typeId="+typeId+"&goodsName="+goodsName;
	%>
		
		<div class="container">
			<nav aria-label="..." class="navbar-right" style="margin-right:15px">
			  <ul class="pagination">
				<!-- 页码部分 -->
		<%
			Object objPu=request.getAttribute("pu");
	    	PageUtil pu=(PageUtil)objPu;
	    	int pageNo=pu.getPageNo();
	    	int pageCount = pu.getPageCount();
	    	String Url=path+"/goodsGetAllByPageFuzzy?pageNo=";
	    	if(pageNo<1){pageNo=1;}
			if(pageNo>1){
		%>
				<li class="disabled"><a href="<%=Url%>${pageNo-1}<%=searchType%>" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li class="active">  <a href="<%=Url%>1<%=searchType%>">首页<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo<=pageCount){
			%>
				<li class="active">  <a href="<%=Url%>${pu.pageNo}<%=searchType%>">${pu.pageNo}<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo+1<=pageCount){
			%>	
				<li class="active">  <a href="<%=Url%>${pu.pageNo+1}<%=searchType%>">${pu.pageNo+1}<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo+2<=pageCount){
			%>
				<li class="active">  <a href="<%=Url%>${pu.pageNo+2}<%=searchType%>">${pu.pageNo+2}<span class="sr-only">(current)</span></a></li>
			<%
				}if(pageNo<pageCount){
			%>
				<li class="active">  <a href="<%=Url%>${pu.pageCount}<%=searchType%>">尾页<span class="sr-only">(current)</span></a></li>
				<li><a href="<%=Url%>${pu.pageNo+1}<%=searchType%>" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			<%
				}
			%></ul>
			</nav>
		</div>
	</body>
</html>
