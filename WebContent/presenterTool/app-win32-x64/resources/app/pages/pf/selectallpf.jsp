<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<%@ include file="../common.jsp"%>
<%
	int j = 1;
%>
<script type="text/javascript">
	function addpfauthority(obj) {
		var idd = $(obj).parent().parent().find('td');
		var m = idd.eq(0).text();
		var usernumber = idd.eq(1).text();
		var authority = document.getElementById(m).value;
		$.ajax({
			url : "addpfauthority.do",
			traditional : true,
			dataType : "text",
			data : {
				usernumber : usernumber,
				authority : authority,
				rn : Math.floor(Math.random() * 100 + 1)
			},
			success : function(data) {
				if (data == "b")
					alert("权限已经存在");
				else
					alert("赋予权限成功");
			},
			error : function() {
				alert("error！");
			}
		});
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
					<li class="active">赋予权限</li>
				</ul>
				<!-- .breadcrumb -->
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
												<th>用户代码</th>
												<th>用户名字</th>
												<th>操作</th>
												<th>完成</th>
												<th>详情</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pflist}" var="pflist">
												<%
													String m = String.valueOf(j);
																String mm = String.valueOf(j);
																request.setAttribute("m", m);
																request.setAttribute("mm", mm);
																j++;
												%>
												<tr>
													<td>${m}</td>
													<td>${pflist.usernumber}</td>
													<td>${pflist.username}</td>
													<td><select id=${m}>
															<c:forEach items="${apflist}" var="apflist">
																<option value="${apflist.authorityfeatures}">${apflist.authorityfeatures}</option>
															</c:forEach>
													</select></td>
													<td><a onclick="addpfauthority(this)">完成</a></td>
													<td><a
														href="selectpfauthority.do?usernumber=${pflist.usernumber}">详情</a></td>
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
</body>
</html>