<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width; initial-scale=1; user-scalable=no">
<title>选课系统</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
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
	function yzm() {
		var yx = $("#yx").val();
		alert(yx);
		var yxyz = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if (yxyz.test(yx)) {
			$.ajax({
				url : "fsyzm.do",
				traditional : true,
				dataType : "text",
				data : {
					yx : yx,
					rn : Math.floor(Math.random() * 100 + 1)
				},
				success : function(data) {
					var index = 60;
					$("#sendSms").text(index + 'S');
					$("#sendSms").attr("disabled", true);
					var timer = setInterval(function() {
						if (--index <= 0) {
							$("#sendSms").text('发送验证码');
							$("#sendSms").attr("disabled", false);
							/*清除定时器*/
							clearInterval(timer)
						} else {
							$("#sendSms").text(index + 'S');
						}
					}, 1000);
				},
				error : function() {

				}
			});
		} else {
			alert("邮箱格式有误");
		}
	}
	function tjyzm() {
		var yzm = $("#pwdyzm").val();
		alert(yzm);
		$
				.ajax({
					url : "yzyzm.do",
					traditional : true,
					dataType : "text",
					data : {
						yzm : yzm,
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "a")
							window.location.href = "${pageContext.request.contextPath}/pages/user/changepwd.jsp";
						else
							alert("验证码错误");
					},
					error : function() {

					}
				});
	}
</script>
</head>

<body style="background-image: url('images/bj6.jpg')">

	<div class="login_m">
		<div class="text">
			<p class="login_logo">仓库系统</p>
		</div>
		<div class="login_boder">
			<div class="login_padding">
				<label>邮箱</label> <input type="text" id="yx"
					class="txt_input txt_input2" value="" placeholder="邮箱" /> <br>
				<label>验证码</label> <input type="password" name="textfield2"
					id="pwdyzm" class="txt_input"  value="" placeholder="验证码" />
				<div class="rem_sub">
					<label> <button type="button" id="sendSms" class="sub_button"
						name="button" onclick="yzm()" style="opacity: 0.7;">发生验证码</button>
					</label>
					<label> <input type="submit" class="sub_button"
						name="button" onclick="tjyzm()" value="提交" style="opacity: 0.7;">
					</label>
					<label>  <a type="button" id="sendSms" href="user.do" class="sub_button">回到登录</a>
					</label>
				</div>
			</div>
		</div>
		<!--login_boder end-->
	</div>
	<!--login_m end-->
	<br />
	<br />
</body>
</html>
