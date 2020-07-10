<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script src="js/pfmanage/add.js"></script>
<%@ include file="../common.jsp"%>
<script type="text/javascript">
function addpf(){
	var usernumber=$("#usernumber").val();
	//alert(usernumber);
	var username=$("#username").val();
	//alert(username);
	var sex=$("#sex").val();
	//alert(sex);
	var birthday=$("#date").val();
	//alert(birthday);
	var idnumber=$("#idnumber").val();
	//alert("e");
	var jg=$("#jg").val();
	//alert("f");
	var hometown=$("#hometown").val();
	//alert("g");
	var phone=$("#phone").val();
	//alert("h");
	var remarks=$("#remarks").val();
	//alert("i");
	var idcardReg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
	if(idcardReg.test(idnumber)) {
		$.ajax({
	        url: "updatepf.do",
	        traditional: true,
	        dataType:"text",
	        data:{
	        	usernumber:usernumber,
	        	username:username,
	        	sex:sex,
	        	birthday:birthday,
	        	idnumber:idnumber,
	        	jg:jg,
	        	hometown:hometown,
	        	phone:phone,
	        	remarks:remarks
			},
	        success:function(data){
	        	if(data=="a"){
	        		alert("更新成功");
	        		window.location.href = "ppffirstpage.do?rn=1";
	        	}	
	        	else{
	        		alert("更新失败");
	        	}	
	        },
	        error : function() {
	            
	        }
	    });
	}
	else{
		alert("身份证不合法");
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

			<li><a href="#">物料管理</a></li>
			<li class="active">添加物料</li>
		</ul>
		<!-- .breadcrumb -->
	</div>
	<c:forEach items="${pfxqlist}" var="pfxqlist">
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">人员代码</span> <input
			id="usernumber" text-align="center" type="text" class="form-control"
			value="${pfxqlist.usernumber}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">姓名 </span> <input
			id="username" text-align="center" type="text" class="form-control"
			value="${pfxqlist.username}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">性别</span> <input
			id="sex" text-align="center" type="text" class="form-control"
			value="${pfxqlist.sex}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">出生日期</span> <input
			id="birthday" text-align="center" type="text" class="form-control"
			value="${pfxqlist.birthday}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">身份证号</span> <input
			id="idnumber" text-align="center" type="text" class="form-control"
			value="${pfxqlist.idnumber}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">籍贯 </span> <input
			id="jg" text-align="center" type="text" class="form-control"
			value="${pfxqlist.jg}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">家庭住址</span> <input
			id="hometown" text-align="center" type="text" class="form-control"
			value="${pfxqlist.hometown}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">练习电话</span> <input
			id="phone" text-align="center" type="text" class="form-control"
			value="${pfxqlist.phone}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="input-group input-group-sm">
		<span class="input-group-addon" id="sizing-addon3">其他情况</span> <input
			id="remarks" text-align="center" type="text" class="form-control"
			value="${pfxqlist.remarks}" aria-describedby="sizing-addon3" style="width: 500px;">
	</div>
	<div class="btn-group" role="group" aria-label="...">
		<button type="button" class="btn btn-default" onclick="addpf()">添加</button>
		<a type="button" href="selectfypf.do?pageNum=1&pageSize=5" class="btn btn-default">取消</a>
	</div>
	</c:forEach>
	<!-- /.page-content -->
</div>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>