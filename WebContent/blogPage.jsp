<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"
	import="dataQuery.BlogQuery,blogDao.BlogInfo,java.util.List"%>
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
<body>
	<%
		String id = request.getParameter("id");
		BlogQuery bq = new BlogQuery();
		List<BlogInfo> list1 = bq.getBlogText(id);
		BlogInfo bi1 = list1.get(0);
		List<BlogInfo> list = bq.getAllText();
		int python = 0;
		int front = 0;
		int java = 0;
		int android = 0;
		int lanqiao = 0;
		int dayLife = 0;
		int mood = 0;
		int photos = 0;
		int others = 0;
		for (BlogInfo bli : list) {
			if (bli.getType().equals("python")) {
				python++;
			} else if (bli.getType().equals("front")) {
				front++;
			} else if (bli.getType().equals("java")) {
				java++;
			} else if (bli.getType().equals("android")) {
				android++;
			} else if (bli.getType().equals("lanqiao")) {
				lanqiao++;
			} else if (bli.getType().equals("dayLife")) {
				dayLife++;
			} else if (bli.getType().equals("mood")) {
				mood++;
			} else if (bli.getType().equals("photos")) {
				photos++;
			} else if (bli.getType().equals("others")) {
				others++;
			}
		}
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
						<a id="head_logo" class="navbar-brand" href="index.jsp">我的博客</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="aboutme.jsp">关于我</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>
	</nav>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="content_left">
						<div class="left_logo" onclick="location.href='aboutme.jsp'">
							<img src="css/photo/me.jpg" class="img-responsive img-circle">
						</div>
						<div class="search">
							<form action="searchPage.jsp" method="post"
								class="bs-example bs-example-form" role="form">
								<div class="row">
									<div class="col-lg-12">
										<div class="input-group">
											<input name="search_value" type="text" class="form-control"
												placeholder="搜点什么吧..."> <span
												class="input-group-btn">
												<button type="submit"
													class="btn btn-default btn btn-default"
													data-toggle="tooltip" title="搜吧" type="button">搜索</button>
											</span>
										</div>
									</div>
								</div>
							</form>
						</div>

						<div class="left_menu">
							<h3>关于学习</h3>
							<ul>
								<li><a href="typePage.jsp?search_value=python">python</a><span
									class="badge"><%=python%></span></li>
								<li><a href="typePage.jsp?search_value=front">前端</a><span
									class="badge"><%=front%></span></li>
								<li><a href="typePage.jsp?search_value=java">java</a><span
									class="badge"><%=java%></span></li>
								<li><a href="typePage.jsp?search_value=android">Android</a><span
									class="badge"><%=android%></span></li>
								<li><a href="typePage.jsp?search_value=lanqiao">练练蓝桥</a><span
									class="badge"><%=lanqiao%></span></li>
							</ul>
						</div>
						<div class="left_menu">
							<h3>一些琐碎</h3>
							<ul>
								<li><a href="typePage.jsp?search_value=dayLife">一些伪日常</a><span
									class="badge"><%=dayLife%></span></li>
								<li><a href="typePage.jsp?search_value=mood">写写心情</a><span
									class="badge"><%=mood%></span></li>
								<li><a href="typePage.jsp?search_value=photos">这是相册</a><span
									class="badge"><%=photos%></span></li>
								<li><a href="typePage.jsp?search_value=others">其他</a><span
									class="badge"><%=others%></span></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="blog_page">
						<div>
							<h1 id="page_title"><%=bi1.getTitle()%></h1>
						</div>
						<div class="blog_ico">
							<span class="blog_foot_span"><span
								class="glyphicon glyphicon-calendar blog_foot_style"> </span><span><%=bi1.getTime()%></span></span>
							<span class="blog_foot_span"> <a href="aboutme.jsp"
								id="some_style"><span
									class="glyphicon glyphicon-user blog_foot_style"></span><span><%=bi1.getAuthor()%></span></a>
							</span> <span class="blog_foot_span"> <a
								href="typePage.jsp?search_value=<%=bi1.getType()%>"
								id="some_style"><span
									class="glyphicon glyphicon-folder-open blog_foot_style"></span><span><%=bi1.getType()%></span></a>
							</span>
						</div>
						<div class="page_para">
							<p><%=bi1.getText()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="index_foot">
		<div class="index_foot_head"></div>
	</div>
</body>
</html>