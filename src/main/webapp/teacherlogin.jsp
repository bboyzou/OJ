<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>源代码在线编译系统教师登陆界面</title>
	<link rel="SHORTCUT ICON" href="static/image/logo.png">
		<link rel="BOOKMARK" href="static/image/logo.png">
			<link href="static/css/bootstrap.min.css" rel="stylesheet">
				<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	background: #444 url("static/img/loginBg.png");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: center center;
}

#content {
	position: absolute;
	top: 50%;
	height: 300px;
	margin-top: -150px;
	width: 100%;
	text-align: center;
}

#title {
	position: relative;
	top: -32%;
	display: inline-block;
	width: 300px;
	height: 100%;
	color: white;
	text-align: right;
	margin-right: 30px;
}

#round {
	width: 100px;
	height: 100px;
	border-radius: 50px 50px 50px 50px;
	background: rgba(55, 236, 186, 1);
	text-align: center;
	display: inline-block;
}

#round h3 {
	margin: 0;
	padding: 0;
	margin-top: 25px;
}

#form {
	position: relative;
	background: rgb(255, 255, 255);
	width: 300px;
	height: 100%;
	display: inline-block;
	margin-right: 180px;
	text-align: left;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 50px;
}

#form div div {
	padding-bottom: 20px;
}

#submitButton {
	width: 100%;
}

#author {
	color: black;
	position: absolute;
	bottom: 0;
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<div id="content">
		<div id="title">
			<h1>教师登陆</h1>
			<div id="round">
				<h3>
					用户<br>登录 
				</h3>
			</div>
		</div>
		<div id="form">
			<div class="form-group">
				<div>教师账号：</div>
				<form action="log">
					<div>
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div>密码：</div>
					<div>
						<input type="password" class="form-control" id="password" name="password">
					</div>
					<p id="message"></p>
					<button id="submitButton" class="btn btn-primary" type="submit">登陆</button>
				</form>
			</div>

		</div>


	</div>
</body>

</html>

</html>
