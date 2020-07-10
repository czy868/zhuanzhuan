<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user.identity ==0 }">
	<body>
</c:if>
<c:if test="${sessionScope.user.identity ==1 }">
	<body class="skin-2">
</c:if>
<c:if test="${sessionScope.user.identity ==2 }">
	<body class="skin-3">
</c:if>


<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}

				</script>


<!--                             判断用户的角色，进入不同的页面                                                                             -->

				<ul class="nav nav-list">
					<li>
						<a href="courseListByStudent.do?pageNum=1&pageSize=5&isFinish=1" class="dropdown-toggle">
							<i class="icon-list"></i>
							<span class="menu-text">人事管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>
						<!-- 二级菜单开始 -->
						<ul class="submenu">
								<li>
									<a href="addpf.do">
										<i class="icon-double-angle-right"></i>
										添加人员
									</a>
								</li>
								<li>
									<a href="selectfypf.do?pageNum=1&pageSize=5">
										<i class="icon-double-angle-right"></i>
										查看人员
									</a>
								</li>
								
						</ul>
						<!-- 二级菜单结束 -->
					
					</li>
					
					<li>
						<a href="" class="dropdown-toggle">
							<i class="icon-list"></i>
							<span class="menu-text">权限管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>
						<!-- 二级菜单开始 -->
						<ul class="submenu">
								<li>
									<a href="adda.do">
										<i class="icon-double-angle-right"></i>
										添加权限
									</a>
								</li>
								<li>
									<a href="selectallfypf.do?pageNum=1&pageSize=5">
										<i class="icon-double-angle-right"></i>
										赋予权限
									</a>
								</li>
								<li>
									<a href="selectAuthority.do?pageNum=1&pageSize=5">
										<i class="icon-double-angle-right"></i>
										查看权限
									</a>
								</li>
								
						</ul>
						<!-- 二级菜单结束 -->
					
					</li>
					
					<li>
						<a href="" class="dropdown-toggle">
							<i class="icon-list"></i>
							<span class="menu-text">物料管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>
						<!-- 二级菜单开始 -->
						<ul class="submenu">
								<li>
									<a href="mf.do">
										<i class="icon-double-angle-right"></i>
										添加物料
									</a>
								</li>
								<li>
									<a href="selectallmf.do?pageNum=1&pageSize=5">
										<i class="icon-double-angle-right"></i>
										查看物料
									</a>
								</li>
						</ul>
					</li>
					<li>
						<a href="mfout.do?pageNum=1&pageSize=5">
							<i class="icon-text-width"></i>
							<span class="menu-text">物料出仓</span>
						</a>
					</li>
					<li>
						<a href="mfin.do?pageNum=1&pageSize=5">
							<i class="icon-text-width"></i>
							<span class="menu-text">物料入仓</span>
						</a>
					</li>	
					<li>
						<a href="" class="dropdown-toggle">
							<i class="icon-list"></i>
							<span class="menu-text">统计 </span>

							<b class="arrow icon-angle-down"></b>
						</a>
						<!-- 二级菜单开始 -->
						<ul class="submenu">
								<li>
									<a href="selectinandoutrq.do?pageNum=1&pageSize=15">
										<i class="icon-double-angle-right"></i>
										日期
									</a>
								</li>
								<li>
									<a href="selectinandoutmf.do?pageNum=1&pageSize=15">
										<i class="icon-double-angle-right"></i>
										物料
									</a>
								</li>
						</ul>
					</li>
					<li id="nav-7">
						<a href="myselfPage.do" class="dropdown-toggle">
							<i class="icon-desktop"></i>
							<span class="menu-text">个人中心 </span>

							<b class="arrow icon-angle-down"></b>
						</a>
						
					<ul class="submenu">
							
							<li>
								<a href="myselfPage.do">
									<i class="icon-double-angle-right"></i>
									我的主页
								</a>
							</li>
						
							<li>
								<a href="updatePwdPage.do">
									<i class="icon-double-angle-right"></i>
									修改密码
								</a>
							</li>

						</ul>
					</li>
					</ul>
				
	
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>


		<!-- 设置开始 -->
				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
								
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">切换到左边</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								切换窄屏
								<b></b>
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			<!-- 设置结束 -->
		</div><!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div><!-- /.main-container -->

	<script type="text/javascript">
		window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
	</script>

	<script type="text/javascript">
		if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	
