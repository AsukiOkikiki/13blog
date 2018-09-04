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
<script type="text/javascript" src="dist/css/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquert.main.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>我的博客</title>
<style type="text/css">
</style>
</head>
<body class="bgColor">
	<div class="container">
		<div class="row">
			<div class="col-md-push-4 col-md-4 login_div">
				<form action="/Blog/test?op=login" method="post" class="form-inline"
					role="form">
					<div class="login_inner">
						<div class="form-group">
							<%
								if (request.getAttribute("error") != null) {
							%>
							<div>
								系统提示：<%=request.getAttribute("error")%></div>
							<%
								}
							%>
							<div class="login_line">
								账号:<input name="username" type="text" class="form-control"
									id="name" placeholder="请输入账号">
							</div>
							<div class="login_line">
								密码:<input name="password" type="password" class="form-control"
									id="name" placeholder="请输入密码">
							</div>
						</div>
						<div class="login_botton">
							<button type="submit" class="login_btn btn btn-danger">登录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>