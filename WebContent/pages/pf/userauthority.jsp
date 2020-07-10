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
	
</script>
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
						try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
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
										<th>已有权限</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ccurpfauthority}" var="ccurpfauthority">
										<%
										String m = String.valueOf(j);
										String mm = String.valueOf(j);
										request.setAttribute("m", m);
										request.setAttribute("mm", mm);
										j++;
									%>
										<tr>
											<td>${m}</td>
											<td>${ccurpfauthority.authority}</td>
											<td><a href="deletpfau.do?usernumber=${ccurpfauthority.usernumber}&authorityid=${ccurpfauthority.authorityid}">删除</a></td>
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
<!-- /.main-content -->
</body>
</html>