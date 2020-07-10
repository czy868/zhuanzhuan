<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script src="js/pfmanage/add.js"></script>
<%@ include file="../common.jsp"%>
<script type="text/javascript">
function addmf(){
	var mnumber=$("#mnumber").val();
	//alert(mnumber);
	var mname=$("#mname").val();
	//alert(mname);
	var model=$("#model").val();
	//alert(model);
	var unit=$("#unit").val();
	//alert(unit);
	var number=$("#number").val();
	//alert(number);
	var Remarks=$("#Remarks").val();
	//alert(Remarks);
		$.ajax({
	        url: "changemf.do",
	        traditional: true,
	        dataType:"text",
	        data:{
	        	mnumber:mnumber,
	        	mname:mname,
	        	model:model,
	        	unit:unit,
	        	number:number,
	        	Remarks:Remarks
			},
	        success:function(data){
	        	if(data=="a"){
	        		alert("更新成功");
	        		window.location.href = "mmfirstpage.do?rn=1";
	        	}	
	        	else{
	        		alert("更新失败");
	        	}
	        },
	        error : function() {
	        	alert("error");
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

			<li><a href="#">物料管理</a></li>
			<li class="active">物料详情</li>
		</ul>
		<!-- .breadcrumb -->
	</div>
	<c:forEach items="${mfxqlist}" var="mfxqlist">
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">物料代码</span> <input
			id="mnumber" text-align="center" type="text" class="form-control" readonly="readonly"
			value="${mfxqlist.mnumber}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">物料名称 </span> <input
			id="mname" text-align="center" type="text" class="form-control"
			value="${mfxqlist.mname}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">规格型号 </span> <input
			id="model" text-align="center" type="text" class="form-control"
			value="${mfxqlist.model}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">单位 </span> <input
			id="unit" text-align="center" type="text" class="form-control"
			value="${mfxqlist.unit}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">库存数量</span> <input
			id="number" text-align="center" type="text" class="form-control"
			value="${mfxqlist.number}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">备注 </span> <input
			id="Remarks" text-align="center" type="text" class="form-control"
			value="${mfxqlist.getRemarks()}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="btn-group" role="group" aria-label="...">
		<button type="button" class="btn btn-default" onclick="addmf()">保存</button>
	</div>
	</c:forEach>
	<!-- /.page-content -->
</div>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>