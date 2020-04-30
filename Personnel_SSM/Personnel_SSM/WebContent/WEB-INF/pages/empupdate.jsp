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

<!-- 原本的样式在这个页面没效果，自己定义 -->
<style type="text/css">
	.container{
		width:100%;
		height:100%;
		position:fixed;
		top:0;
		left:0px;
		z-index:999;
		background-color: #c8c8cc;
		}
	.row{
		width:100%;
		height:100%;
		position:fixed;
		top:0;
		left:200px;
	}
</style>
<script type="text/javascript">
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="templatemo_about_top shadow">
					<h3 align="left">员工更新列表</h3>
					<form action="${pageContext.request.contextPath}/Emp" method="post">
						<input type="hidden" name="_method" value="put" /> 
						
						员工&nbsp;&nbsp;ID:&nbsp;&nbsp;
							<input type="text" name="empid" value="${emp.empid }" readonly="readonly">
							<span>不可该</span><br /> 
						员工姓名:&nbsp;
							<input type="text" name="empname" value="${emp.empname }"><br /> 
						部门&nbsp;&nbsp;ID:&nbsp;&nbsp;
							<input type="text" name="depid" value="${emp.depid }"><br />
						性&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;&nbsp;
						 男：<input type="radio" name="gender" value="男" ${emp.gender=="男"?"checked='checked'":""}>
                  		  女：<input type="radio" name="gender" value="女" ${emp.gender=="女"?"checked='checked'":""} ><br/>
						就职时间&nbsp;:
							<input type="date" name="hiredate" value="${emp.hiredate}"><br />
						家庭住址&nbsp;:
							<input type="text" name="address" value="${emp.address }"><br />
						出生日期&nbsp;:
							<input type="date" name="birthdate" value="${emp.birthdate }"><br />
						联系方式&nbsp;:
							<input type="text" name="phone" value="${emp.phone }"><br />
						职位&nbsp;&nbsp;ID:&nbsp;&nbsp;
							<input type="text" name="jobid" value="${emp.jobid }"><br />
						薪&nbsp;&nbsp;&nbsp;&nbsp;水:&nbsp;&nbsp;&nbsp;
							<input type="text" name="salary" value="${emp.salary }"><br />
						登录密码&nbsp;:
							<input type="text" name="password" value="${emp.password }"><br />
						<input type="submit" value="提交修改">
					</form>
					<a href="${pageContext.request.contextPath }/getEmps">返回</a>
					<br/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>