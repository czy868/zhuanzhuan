<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <c:set var="ctx" value="${pageContext.request.contextPath}"/> --%>
<!DOCTYPE html>
<html lang="ch">
<%@ include file="../common.jsp" %>
	<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
					</script>

					<ul class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a href="#">首页</a>
						</li>

						<li>
							<a href="#">个人中心</a>
						</li>
						<li class="active">个人信息</li>
					</ul><!-- .breadcrumb -->

					<!-- <div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div> --><!-- #nav-search -->
				</div>
				<c:forEach items="${pflist}" var="pflist" >
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<form class="form-horizontal" role="form">
						
<!-- 								<div class="form-group"> -->
<!-- 										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">编号</label> -->
<!-- 										<div class="col-sm-9"> -->
<!-- 											<label class="col-sm-5 col-xs-10" for="form-field-1"> -->
<%-- 											${sessionScope.pflist.usernumber}</label> --%>
<!-- 										</div> -->
<!-- 								</div> -->
									
									<div class="space-4"></div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">姓名:</label>

										<div class="col-sm-9">
											<label class="col-sm-5 col-xs-10" for="form-field-1">
											${pflist.username}</label>
										</div>
									</div>
										
									<div class="space-4"></div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 性别:</label>
										<div class="col-sm-9">
											<label class="col-sm-5 col-xs-10" for="form-field-1">
											${pflist.sex}</label>
										</div>
									</div>
										
						
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 出生日期 :</label>
										<div class="col-sm-9">
											<label class="col-sm-5 col-xs-10" for="form-field-1">
											${pflist.birthday}</label>
										</div>

									</div>

									<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 身份证:</label>
										<div class="col-sm-9">
											<label class="col-sm-5 col-xs-10" for="form-field-1">
											${pflist.idnumber}</label>
										</div>
									</div>
							
									
				<!---------------------------------提交按钮结束      ------------------------------->		
							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
				</c:forEach>
			</div><!-- /.main-content -->
		<script type="text/javascript">
		
		if("${message}"){
	        layer.msg('${message}', {
	            offset: 0,
	        });
	    }
	    if("${error}"){
	        layer.msg('${error}', {
	            offset: 0,
	            shift: 6
	        });
	    }
		
			/*设置日历颜色*/
			laydate.skin('molv');
		</script>
</body>
</html>