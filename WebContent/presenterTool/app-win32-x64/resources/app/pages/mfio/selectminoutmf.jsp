<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<script type="text/javascript">
	function next() {
		$
				.ajax({
					url : "mionextpage.do",
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
					url : "mioagopage.do",
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
					url : "miofirstpage.do",
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
					url : "mioslastpage.do",
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
	function sx() {
		var year = $("#selectyear option:selected").val();
		var mother = $("#selectmother option:selected").val();
		var mfname = $("#mfname");
		$
				.ajax({
					url : "mfnamesx.do",
					dataType : "text",
					traditional : true,
					data : {
						year : year,
						mother : mother,
						mfname : mfname,
						rn : Math.floor(Math.random() * 100 + 1)
					},
					success : function(data) {
						window.location.href = "${pageContext.request.contextPath}/pages/mfio/sxxls.jsp";
					},
					error : function() {
						alert("错误");
					}
				})
	}
</script>
<%@ include file="../common.jsp"%>
<c:forEach items="${curpfauthority}" var="curpfauthority">
	<c:if test="${curpfauthority.authorityid ==  6}">
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

					<li><a href="#">统计报表</a></li>
					<li class="active">统计报表</li>
				</ul>
				<!-- .breadcrumb -->
			</div>
			<div class="input-group input-group-sm">
				<select id="selectyear" style="width: 100px; text-align: center;">
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
				</select> <select id="selectmother" style="width: 100px; text-align: center;">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> <input id="mfname" text-align="center" type="text"
					class="form-control" placeholder=""
					aria-describedby="sizing-addon3"> <a type="button"
					onclick="sx()">筛选</a>
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
												<th>订单号</th>
												<th>物料名字</th>
												<th>状态</th>
												<th>数量</th>
											</tr>
										</thead>
										<%
											int i = 1;
										%>
										<tbody>
											<c:forEach items="${miolist}" var="miolist">
												<%
													String n = String.valueOf(i);
																request.setAttribute("i", n);
																i++;
												%>
												<tr>
													<th>${i}</th>
													<th>${miolist.dnumber}</th>
													<th>${miolist.mname}</th>
													<th>${miolist.stauts}</th>
													<th>${miolist.shuliang}</th>
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