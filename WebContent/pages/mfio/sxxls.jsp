<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   response.setHeader("Content-disposition","attachment; filename=test.xls");
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<table id="sample-table-1"
		class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>id</th>
				<th>订单号</th>
				<th>日期</th>
				<th>物料名字</th>
				<th>状态</th>
				<th>数量</th>
			</tr>
		</thead>
		<% 
			int i = 1;
		%>
		<tbody>
			<c:forEach items="${sxlist}" var="sxlist">
				<%
					String n = String.valueOf(i);
					request.setAttribute("i", n);
					i++;
				%>
				<tr>
					<th>${i}</th>
					<th>${sxlist.dnumber}</th>
					<th>${sxlist.date}</th>
					<th>${sxlist.mname}</th>
					<th>${sxlist.stauts}</th>
					<th>${sxlist.shuliang}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
