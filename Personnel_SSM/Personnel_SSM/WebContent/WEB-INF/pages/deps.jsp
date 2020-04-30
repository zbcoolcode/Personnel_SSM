<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="love.china.bean.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deprments</title>
<meta charset="utf-8">

<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<script src="js/jquery-1.11.1.min.js"></script>
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

<script type="text/javascript">
	function getEmps(depid,depname) {
		$.ajax({
			url:"${pageContext.request.contextPath}/getEmpsByDepID",
			async : false,
			data:{"depid":depid},
			success:function(data){
				$("#showemp").empty();
				if(""==data){
					$("#showemp").append("<p style=\"color:blue\">该部门暂时没有员工</p>")
				}else{
					$("#showemp").append("<p style=\"color:blue\">ID:"+depid+",部门:<b>"+depname+"</b>所有员工:"+"</p><br/>");
					var i=1;
					$.each(data,function(){
						var empinfo="员工ID:"+this.empid+",&nbsp;&nbsp;员工姓名:"+this.empname;
						empinfo=empinfo+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						$("#showemp").append(empinfo);
						if(i%5==0){
							$("#showemp").append("<br/><br/>");
						}
						i++;
					})
				}
			}
		})
		
	}
	
	
	$(function() {
		$(".delbtn").click(function() {
			$("#delform").attr("action", this.href);
			$("#delform").submit();
			return false;
		})
	})
	
	function check_delete(depid,depname){
		getEmps(depid,depname);
	}
	function noshow() {
		$("#showemp").empty();
	}
	

</script>

</head>
<body id="body">
	<div class="container">
		<h3 align="center">部门列表</h3>
		<table border="1" width="90%" style="color: black;">
			<tr>
				<th>部门ID</th>
				<th>部门名称</th>
				<th>部门经理</th>
				<th>办公地址</th>
				<th>部门人数</th>
				<th colspan="3" style="text-align: center">基本操作</th>
			</tr>
			<c:forEach items="${deppageInfo.list }" var="dep">
				<tr>
					<td>${dep.depid }</td>
					<td>${dep.depname }</td>
					<td>${dep.depmanager }</td>
					<td>${dep.depaddress }</td>
					<td>${dep.depcount }</td>
					<td><a
						href="${pageContext.request.contextPath}/dep_updatepage/${dep.depid}">修改</a>
					</td>
					<td><a class="delbtn" onmouseover="check_delete(${dep.depid},'${dep.depname}')" onmouseout="noshow()"
						href="${pageContext.request.contextPath}/Dep/${dep.depid}"><abbr title="删除该部门将删除该部门所有员工">删除（包括员工）</abbr></a>
					</td>
					<td>
						<!-- 此超链接调用getEmps中用到ajax显示员工信息 -->
						<a class="getemp" onclick="getEmps(${dep.depid},'${dep.depname}')">查看部门员工</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<tr>
				<td colspan="8" align="center">
					<a href="getDeps">首页</a>&nbsp; 
					<a href="getDeps?pn=${deppageInfo.prePage}">上一页</a> &nbsp;
					当前页:【${deppageInfo.prePage+1}】&nbsp;总页数:&nbsp;【${deppageInfo.pages }】
					<a href="getDeps?pn=${deppageInfo.nextPage}">下一页</a>&nbsp; 
					<a href="getDeps?pn=${deppageInfo.pages}">末页</a>&nbsp;
				</td>
			</tr>
		</table>
		<br /> <a href="${pageContext.request.contextPath}/depadd">添加部门</a>

	</div>
	<div class="container">
		<br/>
		<div id="showemp"></div>
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