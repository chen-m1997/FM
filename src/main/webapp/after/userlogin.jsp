<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>用户登录</title>
	<script type="text/javascript" src="js/jquery.js"></script>
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
	<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
	<!--[if lt IE 9]>
	<script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
	<![endif]-->
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

	<%
    	String path=request.getContextPath();
  	%>

</head>
<!-- 导入用户自定义css -->
<style type="text/css">
/* 	@import url("../css/login.css"); */
	body{background: #ebebeb;font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;color: #222;font-size: 12px;}
*{padding: 0px;margin: 0px;}
.logo{margin-top: 30px}
.top_div{background: #008ead;width: 100%;height: 360px;}
.login_div{background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;}
.ipt{border: 1px solid #d3d3d3;padding: 10px 10px;	width: 290px;border-radius: 4px;	padding-left: 35px;	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);box-shadow: inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s}
.ipt:focus{border-color: #66afe9;outline: 0;-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)}
.u_logo{background: url("../images/login/username.png") no-repeat;padding: 10px 10px;	position: absolute;	top: 43px;	left: 60px;}
.p_logo{background: url("../images/login/password.png") no-repeat;	padding: 10px 10px;	position: absolute;	top: 12px;	left: 60px;}
a{text-decoration: none;}
.tou{background: url("../images/login/tou.png") no-repeat;width: 97px;height: 92px;position: absolute;top: -87px;left: 140px;}
.left_hand{background: url("../images/login/left_hand.png") no-repeat;width: 32px;height: 37px;position: absolute;top: -38px;left: 150px;}
.right_hand{background: url("../images/login/right_hand.png") no-repeat;width: 32px;height: 37px;position: absolute;top: -38px;right: -64px;}
.initial_left_hand{background: url("../images/login/left-handing.png") no-repeat;width: 30px;height: 20px;position: absolute;top: -12px;left: 100px;}
.initial_right_hand{background: url("../images/login/right_handing.png") no-repeat;width: 30px;height: 20px;position: absolute;top: -12px;right: -112px;}
.left_handing{background: url("../images/login/left-handing.png") no-repeat;width: 30px;height: 20px;position: absolute;top: -24px;left: 139px;}
.right_handinging{background: url("../images/login/right_handing.png") no-repeat;width: 30px;height: 20px;position: absolute;top: -21px;left: 210px;}
.submit_div{height: 20px; line-height: 20px; margin-top: 10px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;}
.submit{background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold; cursor:pointer;}
.copy{text-align:center; position:absolute; z-index:1; bottom:10px; width:100%;line-height:25px; font-family:tahoma,'寰蒋闆呴粦'}
.copy a{color:#333}
.copy a:hover{color:#000}
</style>


<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript">
	
	function seleNameByJquery(){
		var amilTest=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		var name=$("#name").val();
		var leng=name.length;//依据输入数据长度判断数据，大于6为姓名，否则为邮箱
		if(name==null || name==""){
			$("#namespan").css("color","red").html("请输入用户名或邮箱！");
		} else if(leng>6){
			if(amilTest.test(name)){
				$("#namespan").css("color","green").html("邮箱OK√");
			}else{
				$("#namespan").css("color","red").html("请输入正确格式邮箱！");
			}
		}else{
			$("#namespan").css("color","green").html("用户名OK√");
		} 
	} 
	function selepassword() {
		var pwdleng=$("#password").val().length;
		var pwdlspan=$("#pwdspan");
		if(pwdleng<4){
			pwdlspan.css("color","red").html("密码小于4位，请重新输入");
		}else{
			pwdlspan.css("color","green").html("密码格式正确");
		}
	}
	function register(){
		location.href="<%=path%>/after/add_user.jsp";
	}
	
</script>



<body>
<div class="top_div" style="padding-top:100px;text-align:center">
   <span style="font-size:40px;color:white;" class="logo">锋迷网用户登录</span>
</div>
<div class="login_div">
	<div style="width: 165px; height: 96px; position: absolute;">
		<div class="tou"></div>
		<div class="initial_left_hand" id="left_hand"></div>
		<div class="initial_right_hand" id="right_hand"></div>
	</div>
	<form action="<%=path%>/userLoginServlet" method="post">
		<p style="padding: 30px 0px 10px; position: relative;">
			<span class="u_logo"></span>
			<input class="ipt" id="name" type="text" name="username" required="required" placeholder="请输入用户名或邮箱" onblur="seleNameByJquery()"> <br>
			<span id="namespan"></span>
		</p>
		<p style="position: relative;">
			<span class="p_logo"></span>         
			<input class="ipt" id="password" name="password" required="required" type="password" placeholder="请输入密码"  onblur="selepassword()" >   
		</p>
		<span id="pwdspan"></span>
		<div class="submit_div">
			<p style="margin: 0px 55px 20px 45px;">
				<span style="float: right;">
					<input type="submit" class="submit" value=" 登 录 ">
					<input type="button" class="submit" value=" 注册 "  onclick="register()">
				</span>
			</p>
		</div>
	</form>
</div>
<div class="copy">郑州千峰 &copy;2019  版权所有</a> 提供技术支持</div>
</body>
</html>