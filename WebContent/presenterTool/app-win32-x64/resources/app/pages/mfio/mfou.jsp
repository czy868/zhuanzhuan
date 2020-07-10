<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script type="text/javascript">
	function next() {
		$
				.ajax({
					url : "mnextpage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "b") {
							alert("这是最后一页了");
						} else {
							window.location.href = "${pageContext.request.contextPath}/pages/mfio/mfou.jsp";
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
					url : "magopage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "b") {
							alert("这是第一页了");
						} else {
							window.location.href = "${pageContext.request.contextPath}/pages/mfio/mfou.jsp";
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
					url : "mfirstpage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						window.location.href = "${pageContext.request.contextPath}/pages/mfio/mfou.jsp";
					},
					error : function() {
						alert("错误");
					}
				})
	}
	function last() {
		$
				.ajax({
					url : "mlastpage.do",
					dataType : "text",
					traditional : true,
					data : {
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						window.location.href = "${pageContext.request.contextPath}/pages/mfio/mfou.jsp";
					},
					error : function() {
						alert("错误");
					}
				})
	}
	function sousuo() {
		var mname = $("#mname").val();
		alert(mname);
		$
				.ajax({
					url : "sousuomfname.do",
					dataType : "text",
					traditional : true,
					data : {
						mname : mname,
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "a") {
							window.location.href = "${pageContext.request.contextPath}/pages/mfio/sousuomfou.jsp"
						} else {
							alert("查无此物料");
						}
					},
					error : function() {
						alert("错误");
					}
				})
	}
	function chuku(obj) {
		var idd = $(obj).parent().parent().find('td');
		var mnumber = idd.eq(1).text();
		alert(mnumber);
		var mname = idd.eq(2).text();
		alert(mname);
		var ms = idd.eq(3).text();
		alert(ms);
		var cksl = document.getElementById(mnumber).value;
		alert(cksl);
		$
				.ajax({
					url : "chuku.do",
					dataType : "text",
					traditional : true,
					data : {
						mnumber : mnumber,
						mname : mname,
						ms : ms,
						cksl : cksl,
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						if (data == "a")
							window.location.href = "${pageContext.request.contextPath}/pages/mfio/mfou.jsp";
						else
							alert("数量异常");
					},
					error : function() {
						alert("错误");
					}
				})
	}
</script>
<%@ include file="../common.jsp"%>
<c:forEach items="${curpfauthority}" var="curpfauthority">
	<c:if test="${curpfauthority.authorityid ==  4}">
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

					<li><a href="#">物料出库</a></li>
					<li class="active">物料出库</li>
				</ul>
				<!-- .breadcrumb -->
			</div>
			<div class="input-group input-group-sm">
				<input id="mname" text-align="center" type="text"
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
												<th>物料代码</th>
												<th>物料名称</th>
												<th>库存</th>
												<th>出库数量</th>
												<th>出库</th>
											</tr>
										</thead>
										<%
											int i = 1;
										%>
										<tbody>
											<c:forEach items="${mflist}" var="mflist">
												<%
													String n = String.valueOf(i);
																request.setAttribute("i", n);
																i++;
												%>
												<tr>
													<td>${i}</td>
													<td>${mflist.mnumber}</td>
													<td>${mflist.mname}</td>
													<td>${mflist.number}</td>
													<td><input type="text" id=${mflist.mnumber}></td>
													<td><a type="button" onclick="chuku(this)">+</a></td>
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
			<h3>订单表</h3>
			<a type="button" href="daochucc.do">导出</a><a type="button"
				href="tuichudd.do">退出</a>
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
												<th>物料代码</th>
												<th>物料名称</th>
												<th>出库数量</th>
											</tr>
										</thead>
										<%
											int j = 1;
										%>
										<tbody>
											<c:forEach items="${dlist}" var="dlist">
												<%
													String nn = String.valueOf(j);
																request.setAttribute("j", nn);
																j++;
												%>
												<tr>
													<th>${j}</th>
													<th>${dlist.mnumber}</th>
													<th>${dlist.mname}</th>
													<th>${dlist.shuliang}</th>
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
			<!-- /.page-content -->
		</div>
	</c:if>
</c:forEach>
<!-- /.main-content -->
<script type="text/javascript">
	
</script>
</body>
</html>