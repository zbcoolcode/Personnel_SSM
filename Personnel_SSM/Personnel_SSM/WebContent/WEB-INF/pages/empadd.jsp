<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="love.china.bean.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工修改界面</title>
<meta charset="utf-8">

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/employeeadd.js"></script>
	

<script type="text/javascript">
		
		function islegal() {
			$("#span").empty();
			var empid = $("#empid").val();
			var reg = /^[1-9]{1}\d{3}$/;

			if (reg.test(empid)) {
				$.ajax({
					url : "${pageContext.request.contextPath}/islegal",
					type : "post",
					async : false,
					datatype : "json",
					data : {
						"empid" : empid
					},
					success : function(data) {
						isExist = data.isExist;
					}
				})

				if (!isExist) {
					$("#span").append("√");
					return true;
				} else {
					$("#span").append("×,该id已经存在");
					return false;
				}
			} else {
				$("#span").append("非零开头四位数");
				return false;
			}
		}

		function check() {
			if (islegal()) {
				return true;
			} else {
				return false;
			}
		}
		$("#empadd").submit(function() {
			if (islegal()) {
				return false;
			} else {
				return false;
			}
		})
	</script>

	

<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui.css" />
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/templatemo_style.css">


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="templatemo_about_top">
					<h3 align="center">员工入职注册</h3>
					<form onsubmit="return check(this)" action="${pageContext.request.contextPath }/emp"
						method="post">
						员工&nbsp;&nbsp;ID:&nbsp;&nbsp; 
						<input type="text"
							name="empid" style="color: black;width: 120px;" id="empid" onblur="islegal()" required="required">
						<small id="span">非零开头四位数</small>
						
						<br /> <br /> <br /> 
						
						员工姓名:<input type="text" name="empname" 
							style="color: black;width: 120px;" required="required">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						联系方式:<input type="text" name="phone"
							style="color: black;width: 120px;" required="required">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						性&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;
							男<input type="radio"  name="gender"  value="男" required="required">
							女：<input type="radio" name="gender" value="女" required="required">	
							<br /> <br /> <br />
						出生日期:<input type="date" name="birthdate"
							style="color: black;width: 120px;"  required="required">
						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						就职时间:<input type="date" name="hiredate"
							style="color: black;width: 120px;" required="required">
							
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						部门&nbsp;I&nbsp;D:&nbsp;&nbsp;&nbsp;<select
							name="depid" style="color: black;width: 120px;" required="required">
							<c:forEach items="${deps }" var="dep">
								<option value="${dep.depid }">${dep.depid },${dep.depname }</option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						职位ID:<select
							name="jobid" style="color: black;width: 120px;" required="required">
							<c:forEach items="${jobs }" var="job">
								<option value="${job.jobid }">${job.jobid },${job.jobname }</option>
							</c:forEach>
						</select>
						
						<br /> <br /> <br /> 
						
						家庭住址:<input
							type="text" name="address" style="color: black;width: 120px;" required="required">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						默认薪水:<input
							type="number" name="salary" style="color: black;width: 120px;" value="5000" required="required">
							<small>可修改</small>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						默认密码:<input type="text" name="password" value="123456"
						 style="color: black;width: 120px;"><small>可修改</small><br /> <br /> 
						 
						<input type="submit" value="提交修改">
					</form>
					<br/>
					<a href="${pageContext.request.contextPath }/getEmps">返回</a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>