<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script src="js/pfmanage/add.js"></script>
<%@ include file="../common.jsp"%>
<script type="text/javascript">
	function addmf() {
		var mnumber = $("#mnumber").val();
		//alert(usernumber);
		var mname = $("#mname").val();
		//alert(username);
		var model = $("#model").val();
		var unit = $("#select option:selected").val();
		//alert(sex);
		var number = $("#number").val();
		var Remarks = $("#Remarks").val();
		$.ajax({
			url : "addmf.do",
			traditional : true,
			dataType : "text",
			data : {
				mnumber : mnumber,
				mname : mname,
				model : model,
				unit : unit,
				number : number,
				Remarks : Remarks
			},
			success : function(data) {

			},
			error : function() {

			}
		});
	}
</script>
<c:forEach items="${curpfauthority}" var="curpfauthority">
	<c:if test="${curpfauthority.authorityid ==  3}">
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

					<li><a href="#">物料管理</a></li>
					<li class="active">添加物料</li>
				</ul>
				<!-- .breadcrumb -->
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="sizing-addon3">物料代码</span> <input
					id="mnumber" text-align="center" type="text" class="form-control"
					placeholder="" aria-describedby="sizing-addon3"
					style="width: 500px;">
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="sizing-addon3">物料名称 </span> <input
					id="mname" text-align="center" type="text" class="form-control"
					placeholder="" aria-describedby="sizing-addon3"
					style="width: 500px;">
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="sizing-addon3">规格型号 </span> <input
					id="model" text-align="center" type="text" class="form-control"
					placeholder="" aria-describedby="sizing-addon3"
					style="width: 500px;">
			</div>
			<div class="dropdown">
				<select id="select" style="width: 100px; text-align: center;">
					<option value="米">米</option>
					<option value="千克">千克</option>
					<option value="升">升</option>
				</select>
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="sizing-addon3">库存数量</span> <input
					id="number" text-align="center" type="text" class="form-control"
					placeholder="" aria-describedby="sizing-addon3"
					style="width: 500px;">
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="sizing-addon3">备注 </span> <input
					id="Remarks" text-align="center" type="text" class="form-control"
					placeholder="" aria-describedby="sizing-addon3"
					style="width: 500px;">
			</div>
			<div class="btn-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default" onclick="addmf()">添加</button>
			</div>
			<!-- /.page-content -->
		</div>
	</c:if>
</c:forEach>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>