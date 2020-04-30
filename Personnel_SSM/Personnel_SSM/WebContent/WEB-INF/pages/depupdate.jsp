<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="love.china.bean.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门修改</title>
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

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="templatemo_about_top shadow">
					<h3 align="left">部门更新列表</h3>
					<form action="${pageContext.request.contextPath}/Dep" method="post">
						<input type="hidden" name="_method" value="put"/> 
						
						部门ID:<input type="text" name="depid" value="${dep.depid }" readonly="readonly"><br />
						部门姓名：<input type="text" name="depname" value="${dep.depname }" readonly="readonly"><br /> 
						部门经理:<input type="text" name=depmanager value="${dep.depmanager }"><br />
						部门地址:<input type="text" name="depaddress" value="${dep.depaddress}"><br />
						部门人数:<input type="text" name="depcount" value="${dep.depcount }" readonly="readonly"><br />
						<input type="submit" value="提交修改">
					</form>
					<a href="${pageContext.request.contextPath }/getDeps">返回</a>
					<br/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>