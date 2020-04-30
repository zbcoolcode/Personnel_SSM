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
					<h3 align="center">添加部门</h3>
					<form action="${pageContext.request.contextPath }/Dep" method="post">
						部门姓名:
							<input type="text" name="depname" style="color: black;">
							<br/><br/>
						部门经理:
							<input type="text" name="depmanager" style="color: black;">
							<br/><br/>
						办公地址:
							<input type="text" name="depaddress" style="color: black;"><br />
							<br/><br/>
						<input type="submit" value="提交修改">
					</form>
					<br/><br/>
					<a href="${pageContext.request.contextPath }/getDeps">返回</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>