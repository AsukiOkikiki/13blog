<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"
	import="dataQuery.BlogQuery,blogDao.BlogInfo,java.util.List,blogDao.AboutMe"%>
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
<script type="text/javascript" src="dist/css/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquert.main.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>我的博客</title>
<style type="text/css">
</style>
</head>
<body id="editBlog_bg">
	<%
		Object obj = session.getAttribute("admin");
		if (obj == null) {
			response.sendRedirect("login.jsp");
		}
		AboutMe am = BlogQuery.getAboutMe();
	%>
	<nav class="navbar navbar-default index_head navbar-fixed-top">
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
						<li><a href="modifyBlog.jsp">编辑博客 </a></li>
						<li><a href="editBlog.jsp">写博客</a></li>
						<li class="active"><a href="modifyAbout.jsp">修改关于我</a></li>
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
	<%
		if (request.getAttribute("editAboutReturn") != null) {
	%>
	<div>
		<h1 class="system_cue">
			系统提示：<%=request.getAttribute("editAboutReturn")%></h1>
	</div>
	<%
		}
	%>
	<form action="/Blog/test?op=editAbout&id=<%=am.getId()%>" method="post">
		<div class="edit_text">
			<div>
				<textarea name="text" placeholder="这里是正文" class="edit_textarea"><%=am.getText()%></textarea>
			</div>
			<div class="modify_aboutme">
				<button type="submit" class="btn btn-danger">提交</button>
			</div>
			<div></div>
		</div>
	</form>
	<div class="index_foot">
		<div class="index_foot_head"></div>
	</div>
</body>
</html>