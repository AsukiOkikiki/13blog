<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"
	import="dataQuery.BlogQuery,blogDao.BlogInfo,java.util.List"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="SHORTCUT ICON" href="css/photo/me.jpg" />
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="dist/css/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquert.main.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>我的博客</title>
<style type="text/css">
</style>
</head>
<body>
	<%
		Object obj = session.getAttribute("admin");
		if (obj == null) {
			response.sendRedirect("login.jsp");
		}
		BlogQuery bq = new BlogQuery();
		List<BlogInfo> list = bq.getAllText();
	%>
	<nav id="nav_div"
		class="navbar navbar-default index_head navbar-fixed-top">
	<div class="container head">
		<div class="row">
			<div class="container-fluid">
				<div class="col-sm-12 head_logo">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a id="head_logo" class="navbar-brand" href="index.jsp">我的博客首页</a>
					</div>
					<ul class="nav navbar-nav">
						<li class="active"><a href="modifyBlog.jsp">编辑博客 </a></li>
						<li><a href="editBlog.jsp">写博客</a></li>
						<li><a href="modifyAbout.jsp">修改关于我</a></li>
					</ul>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="/Blog/test?op=logout">退出登录</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<div class="modify_page">
		<table class="modify_page_table">
			<tr>
				<th class="modify_page_id">id</th>
				<th class="modify_page_common">title</th>
				<th class="modify_page_text">text</th>
				<th class="modify_page_common">type</th>
				<th class="modify_page_common">author</th>
				<th class="modify_page_btm">操作</th>
			</tr>
			<%
				for (int i = list.size() - 1; i >= 0; i--) {
					BlogInfo bi = list.get(i);
			%>
			<tr>
				<td><%=bi.getId()%></td>
				<td><%=bi.getTitle()%></td>
				<td>
					<%
						if (bi.getText() == null) {
								out.print(bi.getText());
							} else if (bi.getText().length() > 60) {
								for (int j = 0; j < 60; j++) {
									out.print(bi.getText().charAt(j));
								}
								out.print("<a id='text_more'> [...]</a>");
							} else {
								out.print(bi.getText());
							}
					%>
				</td>
				<td><%=bi.getType()%></td>
				<td><%=bi.getAuthor()%></td>
				<td>
					<div>
						<form action="modifyEdit.jsp?id=<%=bi.getId()%>" method="post"
							class="modify_btm_form">
							<button class="btn btn-primary " data-toggle="modal"
								data-target="#myModal">编辑</button>
						</form>
						<form action="/Blog/test?op=delete&id=<%=bi.getId()%>"
							method="post" class="modify_btm_form">
							<button class="btn btn-danger">删除</button>
						</form>
					</div>
				</td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
	<script>
		$(function() {
			$('#myModal').modal('hide')
		});
	</script>
</body>
</html>