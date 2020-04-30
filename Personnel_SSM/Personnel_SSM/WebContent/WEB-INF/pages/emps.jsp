<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="love.china.bean.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>employees</title>
<meta charset="utf-8">

<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui.css" />
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/templatemo_style.css">

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/templatemo_custom.js"></script>
<script src="js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>

<script type="text/javascript">
	function empById() {
		var id = $("#id").val();
		$.ajax({
			url : "getEmpById",
			data : {
				"empid" : id
			},
			success : function(data) {
				$("#newtr").empty();
				if ("" == data) {
					$("#newtr").append("<td  colspan=\"13\" style=\"color: red\">"+"该ID对应员工不存在"+"</td>");
				}else{
					$("#newtr").append("<td>"+data.depid+"</td>");
					$("#newtr").append("<td>"+data.empid+"</td>");
					$("#newtr").append("<td>"+data.empname+"</td>");
					$("#newtr").append("<td>"+data.gender+"</td>");
					$("#newtr").append("<td>"+data.hiredate+"</td>");
					$("#newtr").append("<td>"+data.address+"</td>");
					$("#newtr").append("<td>"+data.birthdate+"</td>");
					$("#newtr").append("<td>"+data.phone+"</td>");
					$("#newtr").append("<td>"+data.jobid+"</td>");
					$("#newtr").append("<td>"+data.salary+"</td>");
					$("#newtr").append("<td>"+data.password+"</td>");
					$("#newtr").append("<td colspan=\"2\" style=\"color: red\">查找结果</td>");
				}
				
			}
		})
	}
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="templatemo_about_top shadow">
					<h3 align="center">员工列表</h3>
					<table border="1" width="95%" style="color: black;" id="mytable">
						<tr>
							<th>部门ID</th>
							<th>员工ID</th>
							<th>姓名</th>
							<th>性别</th>
							<th>入厂日期</th>
							<th>地址</th>
							<th>生日</th>
							<th>联系方式</th>
							<th>职位ID</th>
							<th>薪水</th>
							<th>密码</th>
							<th colspan="3" style="text-align: center">基本操作</th>
						</tr>

						<c:forEach items="${emppageInfo.list }" var="emp">
							<tr>
								<td>${emp.depid }</td>
								<td>${emp.empid }</td>
								<td>${emp.empname }</td>
								<td>${emp.gender }</td>
								<td>${emp.hiredate }</td>
								<td>${emp.address }</td>
								<td>${emp.birthdate }</td>
								<td>${emp.phone }</td>
								<td>${emp.jobid }</td>
								<td>${emp.salary }</td>
								<td>${emp.password }</td>
								<td><a
									href="${pageContext.request.contextPath}/emp_updatepage/${emp.empid}">修改</a></td>
								<td><a class="delbtn"
									href="${pageContext.request.contextPath}/Emp/${emp.empid}">删除</a></td>
							</tr>
						</c:forEach>
						<tr>
						<tr>
							<td colspan="4" align="center"><a href="getEmps">首页</a>&nbsp;
								<a href="getEmps?pn=${emppageInfo.prePage}">上一页</a> &nbsp;
								【${emppageInfo.prePage+1}】&nbsp; <a
								href="getEmps?pn=${emppageInfo.nextPage}">下一页</a>&nbsp; <a
								href="getEmps?pn=${emppageInfo.pages}">末页</a>&nbsp;</td>
							<td colspan="1">总页数:&nbsp;【${emppageInfo.pages }】</td>
							<td colspan="1">员工总数：&nbsp;【${emppageInfo.total }】</td>
							<td colspan="3" align="center">
								<form action="getEmps">
									页码查找:&nbsp;<input type="text" name="pn"> <input
										type="submit" value="查找">
								</form>
							</td>
							<td colspan="4" align="center">员工ID查找:&nbsp;<input
								type="text" id="id"> <input type="submit" value="查找"
								onclick="empById()">
							</td>

						</tr>
						<tr id="newtr"></tr>
					</table>

					<br /> <a href="${pageContext.request.contextPath}/empadd"
						style="color: white;">添加员工</a>
				</div>

			</div>
		</div>
	</div>

	<form id="delform" action="" method="post">
		<input type="hidden" name="_method" value="delete">
	</form>
	<script type="text/javascript">
		$(function() {
			$(".delbtn").click(function() {
				$("#delform").attr("action", this.href);
				$("#delform").submit();
				return false;
			})
		})
	</script>
</body>
</html>