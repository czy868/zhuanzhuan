<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script src="js/pfmanage/add.js"></script>
<%@ include file="../common.jsp"%>
<script type="text/javascript">
	function addauthority() {
		var authorityid = $("#authorityid").val();
		var authority = $("#authority").val();
		alert(authorityid + authority);
		$.ajax({
			url : "addAuthority.do",
			traditional : true,
			dataType : "text",
			data : {
				authorityid : authorityid,
				authority : authority
			},
			success : function(data) {
				alert(data);
			},
			error : function() {

			}
		})
	}
</script>
<c:forEach items="${curpfauthority}" var="curpfauthority">
	<c:if test="${curpfauthority.authorityid ==  2}">
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

					<li><a href="#">权限管理</a></li>
					<li class="active">添加权限</li>
				</ul>
				<!-- .breadcrumb -->
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="sizing-addon3">权限代码</span> <input
					id="authorityid" text-align="center" type="text"
					class="form-control" placeholder=""
					aria-describedby="sizing-addon3" style="width: 500px;">
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="sizing-addon3">权限功能解释 </span> <input
					id="authority" text-align="center" type="text" class="form-control"
					placeholder="" aria-describedby="sizing-addon3"
					style="width: 500px;">
			</div>
			<div class="btn-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default"
					onclick="addauthority()">添加</button>
				<button type="button" class="btn btn-default">取消</button>
			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</c:if>
</c:forEach>
<script type="text/javascript">
	
</script>
</body>
</html>