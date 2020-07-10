<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1; user-scalable=no">
<title>选课系统</title>

<link href="css/style.css" rel="stylesheet" type="text/css"/>
<!-- <link rel="stylesheet" href="assets/css/ace.min.css" /> -->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/course/login.js"></script>

<style>
	.login_m {
		width: 100%;
		height: initial;
		margin-top: 30px;
	}
	.login_boder input.txt_input {
		width: 84%;
		max-width: 295px;
	}
	.login_boder {
		text-align: center;
		background-position: center;
	}
	.rem_sub input.sub_button {
		float: none;
	}
	.login_padding {
		padding-top: 64px;
	}
	.button-group {
		margin: 12px auto;
	}
</style>
<script type="text/javascript">
	/* $(function(){
		var cookiestr = getCookie("user");
		if(cokkiestr!=""){
			cookiestr = cookietsr.substring(1,cookiestr.length-1);
			var username = cookiestr.split("+")[0];
			var password = cookiestr.split("+")[1];
			$("#userNumber").val(username);
			$("#password").val(password);
		}
	});
	function getCookie(cookiename){
		var name=cookiename+"=";
		alert(name);
		var str = doucument.cookie.split(';');
		var le =str.lenght;
		for(var i=0;i<str.lenght;i++){
			var ind=str[i];
			while(ind.charAt(0)==' ')
				ind=ind.substring(1);
			var saf = ind.lenght;
			if(ind.indexOf(name)!=-1)
				return ind.substring(name.length,ind.lenght);
		}
		return "";
	}; */
</script>
</head>

<body style="background-image:url('images/bj6.jpg')">

<div class="login_m">
	<div class="text"><p  class="login_logo">仓库系统</p></div>
	<div class="login_boder">
		<div class="login_padding">
			<label>账号</label>
			<input type="text" id="userNumber" class="txt_input txt_input2" onfocus="if (value ==&#39;username&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;username&#39;}" value="${cookie.userCode.value}" placeholder="请输入用户名" />
			<br>
			<label>密码</label>			
			<input type="password" name="textfield2" id="userpwd" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="${cookie.userPassword.value}" placeholder="请输入密码" />

			
			<div class="rem_sub">
				<label>
					<input type="submit" class="sub_button" name="button" onclick="login()"  value="登录" style="opacity: 0.7;">
				</label>
			</div>
			<a type="button" href="yanzhengma.do" >忘记密码</a>
		</div>
	</div><!--login_boder end-->
</div><!--login_m end-->
<br />
<br />
</body>
</html>