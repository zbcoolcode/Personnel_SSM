<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="love.china.bean.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jobs</title>
<meta charset="utf-8">

<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui.css" />
<link rel="stylesheet" href="css/tdeplatemo_misc.css">
<link rel="stylesheet" href="css/tdeplatemo_style.css">

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/tdeplatemo_custom.js"></script>
<script src="js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>

<style type="text/css">
.container {
	width: 80%;
	height: 50%;
	position: relative;
	top: 0;
	left: 20px;
	z-index: 999;
	background-color: #c8c8cc;
}

.showemp{
	position: absolute;
	float:inherit;
	background-color: #c8c6cf;
	left:180px;
	width: 80%;
	height: 50%;
}

#body {
	background-color: #c8c8cc
}
</style>



</head>
<body id="body">
	<div class="container">
	<h3 align="center">岗位列表</h3>
	<p> 功能和部门表相同，除了查询其他功能未实现</p>
	<table border="1" width="90%" style="color: black;">
		<tr>
			<th>岗位ID</th>
			<th>岗位类型</th>
			<th>岗位人数</th>
			<th colspan="2" style="text-align: center">基本操作</th>
		</tr>
		<c:forEach items="${jobpageInfo.list }" var="job">
			<tr>
				<td>${job.jobid }</td>
				<td>${job.jobname }</td>
				<td>${job.jobcount }</td>
				<td><a>修改</a></td>
				<td><a href="#" class="delbtn">删除</a></td>
			</tr>
		</c:forEach>
		<tr>
		<tr>
			<td colspan="5" align="center"><a href="getJobs">首页</a>&nbsp; <a
				href="getJobs?pn=${jobpageInfo.prePage}">上一页</a> &nbsp;
				【${jobpageInfo.prePage+1}】&nbsp; <a
				href="getJobs?pn=${jobpageInfo.nextPage}">下一页</a>&nbsp; <a
				href="getJobs?pn=${jobpageInfo.pages}">末页</a>&nbsp;</td>
		</tr>
	</table>

	<br />
	<a style="color: white;">添加员工</a>
</div>

	<form id="delform" action="" method="post">
		<input type="hidden" name="_method" value="delete">
	</form>
	
<script type="text/javascript">
	$(function() {
		$(".delbtn").click(function() {
			$("#delform").attr("action", this.href);
			/* $("#delform").submit(); */
			return false;
		})
	})
</script>
</body>
</html>