<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script type="text/javascript">
	function next() {
		$
				.ajax({
					url : "pfnextpage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "b") {
							alert("这是最后一页了");
						} else {
							window.location.href = "${pageContext.request.contextPath}/pages/pf/selectfypf.jsp";
						}
					},
					error : function() {
						alert("错误");
					}
				})
	}
	function ago() {
		$
				.ajax({
					url : "pfagopage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "b") {
							alert("这是第一页了");
						} else {
							window.location.href = "${pageContext.request.contextPath}/pages/pf/selectfypf.jsp";
						}
					},
					error : function() {
						alert("错误");
					}
				})
	}
	function first() {
		$
				.ajax({
					url : "pffirstpage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						window.location.href = "${pageContext.request.contextPath}/pages/pf/selectfypf.jsp";
					},
					error : function() {
						alert("错误");
					}
				})
	}
	function last() {
		$
				.ajax({
					url : "pflastpage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						window.location.href = "${pageContext.request.contextPath}/pages/pf/selectfypf.jsp";
					},
					error : function() {
						alert("错误");
					}
				})
	}
	function sousuo() {
		alert("aaa");
		var pfname = $("#pfname").val();
		alert(pfname);
		$
				.ajax({
					url : "sousuopfname.do",
					dataType : "text",
					traditional : true,
					data : {
						pfname : pfname,
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "a") {
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
<c:forEach items="${curpfauthority}" var="curpfauthority">
	<c:if test="${curpfauthority.authorityid ==  1}">
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

					<li><a href="#">人事管理</a></li>
					<li class="active">查看人员</li>
				</ul>
				<!-- .breadcrumb -->
			</div>
			<div class="input-group input-group-sm">
				<input id="pfname" text-align="center" type="text"
					class="form-control" placeholder=""
					aria-describedby="sizing-addon3" style="width: 500px;"> <a
					type="button" onclick="sousuo()">搜索</a>
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
											<c:forEach items="${pffylist}" var="pffylist">
												<%
													String n = String.valueOf(i);
																request.setAttribute("i", n);
																i++;
												%>
												<tr>
													<th>${i}</th>
													<th>${pffylist.usernumber}</th>
													<th>${pffylist.username}</th>
													<th><a
														href="selectpfxq.do?usernumber=${pffylist.usernumber}">详情</a></th>
													<th><a
														href="deletepf.do?usernumber=${pffylist.usernumber}">删除</a></th>
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
	</c:if>
</c:forEach>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>