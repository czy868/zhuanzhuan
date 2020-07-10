<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function changepwd(){
	var newpwd=$("#newpwd").val();
	alert(newpwd);
		$.ajax({
	        url: "${pageContext.request.contextPath}/changepwd.do",
	        traditional: true,
	        dataType:"text",
	        data:{
	        	newpwd:newpwd,
	        	rn:Math.floor(Math.random()*100+1)
			},
	        success:function(data){
	        	window.location.href = "${pageContext.request.contextPath}/login.jsp"

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

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>

			<li><a href="#">个人中心</a></li>
			<li class="active">修改密码</li>
		</ul>
		<!-- .breadcrumb -->
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">新密码</span> <input
			id="newpwd" text-align="center" type="text" class="form-control"
			placeholder="" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="btn-group" role="group" aria-label="...">
		<button type="button" class="btn btn-default" onclick="changepwd()">重置</button>
	</div>
</div>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>