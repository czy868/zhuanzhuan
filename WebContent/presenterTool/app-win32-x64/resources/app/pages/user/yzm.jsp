<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function yzm(){
	var yx=$("#yx").val();
	alert(yx);
	var yxyz=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	if(yxyz.test(yx)){
		$.ajax({
	        url: "fsyzm.do",
	        traditional: true,
	        dataType:"text",
	        data:{
	        	yx:yx,
	        	rn:Math.floor(Math.random()*100+1)
			},
	        success:function(data){
	        	var index = 60;
                $("#sendSms").text(index + 'S');
                $("#sendSms").attr("disabled",true);
                var timer = setInterval(function () {
                    if (--index <= 0) {
                        $("#sendSms").text('发送验证码');
                        $("#sendSms").attr("disabled",false);
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
	}
	else{
		alert("邮箱格式有误");
	}
}
function tjyzm(){
	var yzm=$("#pwdyzm").val();
	alert(yzm);
		$.ajax({
	        url: "yzyzm.do",
	        traditional: true,
	        dataType:"text",
	        data:{
	        	yzm:yzm,
	        	rn:Math.floor(Math.random()*100+1)
			},
	        success:function(data){
	        	if(data=="a")
	        		window.location.href = "${pageContext.request.contextPath}/pages/user/changepwd.jsp";
	        	else
	        		alert("验证码错误");
	        },
	        error : function() {
	            
	        }
	    });
}
</script>
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>

		<!-- .breadcrumb -->
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">邮箱</span> <input
			id="yx" text-align="center" type="text" class="form-control"
			placeholder="" aria-describedby="sizing-addon3" style="width: 500px;">
		<button type="button" id="sendSms" class="send-sms" onclick="yzm()">发送验证码</button>
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">验证码 </span> <input
			id="pwdyzm" text-align="center" type="password" class="form-control"
			placeholder="" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="btn-group" role="group" aria-label="...">
		<button type="button" class="btn btn-default" onclick="tjyzm()">提交</button>
	</div>
</div>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>