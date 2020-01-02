<%@page import="com.entity.Admin"%>
<%@page import="com.entity.Goods"%>
<%@page import="com.service.impl.GoodsServiceImpl"%>
<%@page import="com.service.GoodsService"%>
<%@page import="com.service.impl.GoodsTypeServiceImpl"%>
<%@page import="com.service.GoodsTypeService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
 	String path=request.getContextPath();
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加/修改商品</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
   <script type="text/javascript" src="<%=path %>/js/jquery2.js"></script> 
   
 <%
    Admin admin=(Admin)session.getAttribute("admin");//获取用户（admin.username）名
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

<style type="text/css">
    th {
        text-align: center;
    }
</style>
<script type="text/javascript">
    //解决选择下拉框内容到输入框内容的问题
    function showName(obj, id) {
        var name = $(obj).text();
        $("#typeName").val(name);
        $("#typeId").val(id);
    }
    //商品添加
    function checkGoodsNameByJquery(){
    	var goodsName=$("#goodsName").val();
    	var namespan=$("#namespan");
    	if(goodsName==null || goodsName==""){
    		namespan.css("color","red").html("商品名不能为空");
    	}else {
			$.ajax({
				url:"/FM/checkGoodsName",
				data:{"goodsName":goodsName},
				type:"post",
				success:function(res){
					if(res=="true"){
						namespan.css("color","red").html("商品已存在！");
					}else{
						namespan.css("color","green").html("OK！");
					}
				}
			});
		}
    }

</script>
<body>

<%
	String goodids=request.getParameter("id");
	if(goodids!=null && !"".equals(goodids)){
		int id=Integer.parseInt(goodids);
		GoodsService gsi=new GoodsServiceImpl();
		GoodsTypeService gts=new GoodsTypeServiceImpl();
		Goods goods =gsi.getGoods(id);
		GoodsType goodsType=gts.getAGoodsTypeById(goods.getTypeId());
		goods.setGoodsType(goodsType);
		request.setAttribute("goods", goods); 
	}
%>

<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1"
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
                <li><a href="<%=path%>/goodsGetAllByPageFuzzy">直通锋迷网</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
               	<li class="active"><a href="<%=path%>/adminList">${user.username}<span class="sr-only">(current)</span></a></li>
                <li><a onclick="logout()"><span class="glyphicon glyphicon-log-in" style="padding-left:0px"></span></a></li>
                <li><a onclick="logout()" style="padding-left:0px">退出</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
    <div class="container">
       <c:if test="${empty goods.id}">
        <h2>添加商品信息</h2>
       </c:if>
      <c:if test="${not empty goods.id}">
        
        <h2>修改商品信息</h2>
      </c:if>
    </div>
</div>
<div class="container" style="margin-top: 20px;">

    <form class="form-horizontal" enctype="multipart/form-data"
          action="<%=path%>/goodsSaveOrUpdate" method="post">

        <input type="hidden" name="id" value="${goods.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" 
                 value="${goods.goodsName}"
                 id="goodsName" 
                 name="goodsName"
                 placeholder="起一个靓名" onblur="checkGoodsNameByJquery()" 
                 required="required">
                 <span id="namespan"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">商品价格</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="price" value="${goods.price}"
                 placeholder="价格"  required="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">商品类别</label>
            <div class="col-sm-10">
                <div class="input-group">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">下拉菜单<span class="caret"></span></button>
                        <ul id="selectSpeaker" class="dropdown-menu">
                           <%
									List<GoodsType> typelist=new  ArrayList<GoodsType>();
									GoodsTypeService gts =new GoodsTypeServiceImpl();
									typelist=gts.getAllGoodsType();
									request.setAttribute("typeList", typelist);
							%>

                            <c:forEach items="${typeList}" var="type">
                                <li><a onclick="showName(this,${type.id})" value="${type.typename}" >${type.typename}</a></li>
                            	<input type="hidden" class="form-control" id="typeId" name="typeId" value="${goods.typeId}">
                            </c:forEach>

                        </ul>
                        
                    </div><!-- /btn-group -->
                    
                    <input type="text" class="form-control" disabled id="typeName" value ="${goods.goodsType.typename}"
                           aria-label="...">
                </div><!-- /input-group -->
            </div>
        </div>

        <div class="form-group">
            <laobel class="col-sm-2 control-label">商品图片</laobel>
            <div class="col-sm-10">
                <c:if test="${not empty goods.id}">
                    <input id="input" type="file" name="imgPath" onchange="isPicFile()"> <br/>
                    <img id="img" src="http://localhost:8081/uploadfile/images/${goods.imgPath}" alt="..."
                         class="img-thumbnail" height="130px" width="130px"
                         >
                </c:if>
                <c:if test="${empty goods.id}">
                    <input id="input" type="file" name="imgPath" onchange="isPicFile()"> <br/>
                    <img id="img" src="${pageContext.request.contextPath}/images/default.jpg" alt="..."
                         class="img-thumbnail"
                         height="130px" width="130px">
                </c:if>
                <script type="text/javascript">
                    $("#input").change(function () {
                        var files = this.files;
                        if (!files.length) {
                            return;
                        }
                        $("#img").attr("src", window.URL.createObjectURL(files[0]));
                        /*  $("#img").get(0).play(); */
                    });
                </script>
                <input type="hidden" name="img" value="${goods.imgPath}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">商品描述</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="description" rows="3">${goods.description}</textarea>
            </div>
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