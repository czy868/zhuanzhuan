<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script src="js/pfmanage/add.js"></script>
<%@ include file="../common.jsp"%>
<script type="text/javascript">
function uppwd(){
	var jiupwd=$("#jiupwd").val();
	alert(jiupwd);
	var newpwd=$("#newpwd").val();
	alert(newpwd);
	var nnewpwd=$("#nnewpwd").val();
	if(newpwd!=nnewpwd){
		alert("两次密码不一致");
	}
	else{
		$.ajax({
	        url: "updateuserpwd.do",
	        traditional: true,
	        dataType:"text",
	        data:{
	        	jiupwd:jiupwd,
	        	newpwd:newpwd,
	        	nnewpwd:nnewpwd,
	        	rn:Math.floor(Math.random()*100+1)
			},
	        success:function(data){
	        	if(data=="a")
	        		window.location.href = "${pageContext.request.contextPath}/login.jsp";
	        	else
	        		alert("旧密码错误，请重新输入");
	        },
	        error : function() {
	            
	        }
	    });
	}
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

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>

			<li><a href="#">个人中心</a></li>
			<li class="active">修改密码</li>
		</ul>
		<!-- .breadcrumb -->
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">旧密码</span> <input
			id="jiupwd" text-align="center" type="text" class="form-control"
			placeholder="" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">新密码 </span> <input
			id="newpwd" text-align="center" type="password" class="form-control"
			placeholder="" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">确认密码 </span> <input
			id="nnewpwd" text-align="center" type="password" class="form-control"
			placeholder="" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="btn-group" role="group" aria-label="...">
		<button type="button" class="btn btn-default" onclick="uppwd()">添加</button>
	</div>
</div>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>