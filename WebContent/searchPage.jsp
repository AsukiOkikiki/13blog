<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"
	import="dataQuery.BlogQuery,blogDao.BlogInfo,java.util.List,java.util.ArrayList"%>
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
<%
	request.setCharacterEncoding("UTF-8");
	String term = request.getParameter("search_value");
	List list2 = new ArrayList();
	BlogQuery bq = new BlogQuery();
	List<BlogInfo> list = bq.getSearchText(term);
	List<BlogInfo> list1 = bq.getAllText();
	int python = 0;
	int front = 0;
	int java = 0;
	int android = 0;
	int lanqiao = 0;
	int dayLife = 0;
	int mood = 0;
	int photos = 0;
	int others = 0;
	for (BlogInfo bli : list1) {
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
<body>
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
					<div class="content_right">
						<%
							if (list.equals(list2)) {
								out.println("<h1>没找到你想要的哦！</h1>");
								out.print("<h3>换个关键词试试</h3>");
							} else {
								for (int i = list.size() - 1; i >= 0; i--) {
									BlogInfo bi = list.get(i);
						%>

						<div class="blog">
							<div class="blog_word">
								<div class="blog_title_div">
									<a href="blogPage.jsp?id=<%=bi.getId()%>"
										class="blog_title tooltip-test" data-toggle="tooltip"
										title="点击查看全文"><%=bi.getTitle()%></a>
								</div>
								<div class="word_div">
									<p>
										<%
											if(bi.getText()==null){
												out.print(bi.getText());
											}else if (bi.getText().length() > 90) {
														for (int j = 0; j < 90; j++) {
															out.print(bi.getText().charAt(j));
														}
														out.print("<a href='#' id='text_more'> [...]</a>");
													} else {
														out.print(bi.getText());
													}
										%>
									</p>
								</div>
								<div class="blog_ico">
									<span class="blog_foot_span"><span
										class="glyphicon glyphicon-calendar blog_foot_style"> </span><span><%=bi.getTime()%></span></span>
									<span class="blog_foot_span"> <span
										class="glyphicon glyphicon-eye-open blog_foot_style"></span><span>访客<%=bi.getVisited()%>
									</span>
									</span>
								</div>
							</div>
							<div class="blog_photo">
								<img tooltip-test" data-toggle="tooltip" title="这是插图"
									src="css/photo/rainbow.jpg" width="100%" height="100%">
							</div>
						</div>
						<%
							}
							}
						%>

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