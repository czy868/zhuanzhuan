<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script type="text/javascript">
function sousuo() {
	alert("aaa");
	var pfname = $("#pfname").val();
	alert(pfname);
	$.ajax({
				url : "sousuopfname.do",
				dataType : "text",
				traditional : true,
				data : {
					pfname : pfname,
					rn : Math.floor(Math.random() * 100 + 1)
				},
				success : function(data) {
					if (data == "a") {
						alert("a");
						window.location.href = "${pageContext.request.contextPath}/pages/pf/selectonepf.jsp"
					} else {
						alert("查无此人");
					}
				},
				error : function() {
					alert("错误");
				}
			})
}
</script>
<%@ include file="../common.jsp"%>
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
			<li class="active">查看物料</li>
		</ul>
		<!-- .breadcrumb -->
	</div>
	<div class="input-group input-group-sm">
		<input id="mname" text-align="center" type="text" class="form-control"
			placeholder="" aria-describedby="sizing-addon3" style="width: 500px;">
		<a type="button" onclick="sousuo()">搜索</a>
	</div>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-12">
						<div class="table-responsive">
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>id</th>
										<th>人员代码</th>
										<th>姓名</th>
										<th>操作</th>
										<th>删除</th>
									</tr>
								</thead>
								<%
											int i = 1;
										%>
								<tbody>
									<c:forEach items="${sousuopflist}" var="sousuopflist">
										<%
													String n = String.valueOf(i);
																request.setAttribute("i", n);
																i++;
										%>
										<tr>
											<th>${i}</th>
											<th>${sousuopflist.usernumber}</th>
											<th>${sousuopflist.username}</th>
											<th><a
												href="selectpfxq.do?usernumber=${sousuopflist.usernumber}">详情</a></th>
											<th><a
												href="deletepf.do?usernumber=${sousuopflist.usernumber}">删除</a></th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<div>
		<button type="button" onclick="first()">首页</button>
		<button type="button" onclick="ago()">上一页</button>
		<button type="button" onclick="next()">下一页</button>
		<button type="button" onclick="last()">尾页</button>
	</div>
	<!-- /.page-content -->
</div>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>