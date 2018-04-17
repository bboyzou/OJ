<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ng-app="onlineJudgeApp">

<head>
<meta charset="UTF-8">
<title>在线评测系统</title>
<link rel="SHORTCUT ICON" href="static/img/logo.png">
<link rel="BOOKMARK" href="static/img/logo.png">
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="static/css/responsive.css" />
<link rel="stylesheet" type="text/css" href="static/css/animate.min.css" />
<link rel="stylesheet" type="text/css" href="static/css/main.css" />
<script src="static/js/angular.min.js"></script>
<script src="static/js/angular-route.min.js"></script>
<script src="static/js/app.js"></script>
<script src="static/js/controllers.js"></script>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<style>
body,html {
	width: 100%;
	height: 100%;
	background: #444 url("static/img/loginBg.png");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
}


#loginDialog {
	margin: 0;
	top: 10%;
	text-align: center;
}

#registerDialog {
	margin: 0;
	top: 10%;
	text-align: center;
}

#loginDialog .modal-header, #registerDialog .modal-header, #forgetDialog .modal-header
	{
	border-bottom: 0;
}

#userTip {
	color: white;
	margin-top: 15px;
	margin-left: 20px;
}

.index-top-button {
	margin-top: 12px;
	margin-left: 20px;
	padding-left: 25px;
	padding-right: 25px;
}

.width70 {
	display: inline-block;
	width: 78%;
}

.form-bg {
	background: #00b4ef;
}

.form-horizontal {
	background: #fff;
	padding-bottom: 40px;
	border-radius: 15px;
	text-align: center;
}

.form-horizontal .heading {
	display: block;
	font-size: 35px;
	font-weight: 700;
	padding: 35px 0;
	border-bottom: 1px solid #f0f0f0;
	margin-bottom: 30px;
}

.form-horizontal .form-group {
	padding: 0 40px;
	margin: 0 0 25px 0;
	position: relative;
}

.form-horizontal .form-control {
	background: #f0f0f0;
	border: none;
	border-radius: 20px;
	box-shadow: none;
	padding: 0 20px 0 45px;
	height: 40px;
	transition: all 0.3s ease 0s;
}

.form-horizontal .form-control:focus {
	background: #e0e0e0;
	box-shadow: none;
	outline: 0 none;
}

.form-horizontal .form-group i {
	position: absolute;
	top: 12px;
	left: 60px;
	font-size: 17px;
	color: #c8c8c8;
	transition: all 0.5s ease 0s;
}

.form-horizontal .form-control:focus+i {
	color: #00b4ef;
}

.form-horizontal .fa-question-circle {
	display: inline-block;
	position: absolute;
	top: 12px;
	right: 60px;
	font-size: 20px;
	color: #808080;
	transition: all 0.5s ease 0s;
}

.form-horizontal .fa-question-circle:hover {
	color: #000;
}

.form-horizontal .main-checkbox {
	float: left;
	width: 20px;
	height: 20px;
	background: #11a3fc;
	border-radius: 50%;
	position: relative;
	margin: 5px 0 0 5px;
	border: 1px solid #11a3fc;
}

.form-horizontal .main-checkbox label {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
}

.form-horizontal .main-checkbox label:after {
	content: "";
	width: 10px;
	height: 5px;
	position: absolute;
	top: 5px;
	left: 4px;
	border: 3px solid #fff;
	border-top: none;
	border-right: none;
	background: transparent;
	opacity: 0;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.form-horizontal .main-checkbox input[type=checkbox] {
	visibility: hidden;
}

.form-horizontal .main-checkbox input[type=checkbox]:checked+label:after
	{
	opacity: 1;
}

.form-horizontal .text {
	float: left;
	margin-left: 7px;
	line-height: 20px;
	padding-top: 5px;
	text-transform: capitalize;
}

.form-horizontal .btn {
	float: right;
	font-size: 14px;
	color: #fff;
	background: #00b4ef;
	border-radius: 30px;
	padding: 10px 25px;
	border: none;
	text-transform: capitalize;
	transition: all 0.5s ease 0s;
	border-radius: 30px;
}

@media only screen and (max-width: 479px) {
	.form-horizontal .form-group {
		padding: 0 25px;
	}
	.form-horizontal .form-group i {
		left: 45px;
	}
	.form-horizontal .btn {
		padding: 10px 20px;
	}
}
</style>
</head>

<body ng-controller="indexCtr">
	<header id="header">
		<nav class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="javascript:;">
						<p>在线评测系统</p>
					</a>
				</div>

				<div >
					<ul class="nav navbar-nav">
						<li ></li>
						<li ></li>
						<li onclick="selectLi(this)"><a href="welcome">首页</a></li>
						<li ></li>
						<li onclick="selectLi(this)"><a href="announcementindex">公告</a></li>
						<li ></li>
						<li onclick="selectLi(this)"><a href="problemindex">题目</a></li>
						<li ></li>
						<li onclick="selectLi(this)"><a href="userindex">个人信息</a></li>
						<li></li>
					</ul>
					<label >
						<button class="btn btn-primary index-top-button" type="button"
							ng-click="showLogin()">登陆</button>
						<button class="btn btn-success index-top-button" type="button"
							ng-click="showRegister()">注册</button>
						<button class="btn btn-info index-top-button" type="button"
							ng-click="showForget()">忘记密码</button>
				</div>
			</div>
			<!--/.container-->
		</nav>
		<!--/nav-->
	</header>
	<!--/header-->
	<div ng-view></div>

	<!-- 登录弹出框 开始-->
	<div class="modal fade dialog" id="loginDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
				</div>
				<div class="modal-body">
					<form action="log" class="form-horizontal" ng-submit="loginSubmit()">
						<span class="heading">用户登录</span>
						<div class="form-group">
							<i class="icon-user"></i><input id="id" name="id" type="text" class="form-control"
								placeholder="账号：长度为6-20位的，数字" ng-model="loginData.account"
								pattern="[a-zA-Z0-9]{6,20}" required>{{error.accountError}}
						</div>
						<div class="form-group">
							<i class="icon-key"></i><input id="password" name="password" type="password"
								class="form-control" placeholder="密码：长度为6-20位的，数字或者英文字母"
								ng-model="loginData.password" pattern="[a-zA-Z0-9]{6,20}"
								required>{{error.passwordError}}
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success form-control">登录</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 登录弹出框 结束-->

	<!-- 忘记密码弹出框 开始-->
	<div class="modal fade dialog" id="forgetDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
				</div>
				<div class="modal-body">
					<form action="findPassword" class="form-horizontal" ng-submit="forgetUpdate()">
						<span class="heading">忘记密码-修改密码</span>
						<div class="form-group">
							<i class="icon-user"></i><input id="id" name="id" type="text" class="form-control"
								placeholder="账号：长度为6-20位的，数字或者英文字母"
								ng-model="forgetData.account" pattern="[a-zA-Z0-9]{6,20}"
								required>{{error.accountError}}
						</div>
						
						<div class="form-group">
							<i class="icon-font"></i><input id="name" name="name" type="text" class="form-control"
								placeholder="你的姓名" ng-model="registerData.nickname" "
								required>{{error.accountError}}
						</div>
						
						<div class="form-group">
							<i class="icon-key"></i><input id="password" name="password" type="password"
								class="form-control" placeholder="新密码：长度为6-20位的，数字或者英文字母"
								ng-model="forgetData.newPassword" pattern="[a-zA-Z0-9]{6,20}"
								required>{{error.passwordError}}
						</div>
						<div class="form-group">
							<i class="icon-key"></i><input id="password2" name="password2" type="password"
								class="form-control" placeholder="确认新密码：长度为6-20位的，数字或者英文字母"
								ng-model="forgetData.confirmNewPassword"
								pattern="[a-zA-Z0-9]{6,20}" required>{{error.passwordError}}
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success form-control">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 忘记密码弹出框 结束-->
	<!-- 注册弹出框 开始-->
	<div class="modal fade dialog" id="registerDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
				</div>
				<div class="modal-body">
					<form action="regist" class="form-horizontal" ng-submit="registerSubmit()">
						<span class="heading">用户注册</span>
						<div class="form-group">
							<i class="icon-user"></i><input id="id" name="id" type="text" class="form-control"
								placeholder="账号：长度为6-20位的，数字或者英文字母"
								ng-model="registerData.account" pattern="[a-zA-Z0-9]{6,20}"
								required>{{error.accountError}}
						</div>
						<div class="form-group">
							<i class="icon-font"></i><input id="name" name="name" type="text" class="form-control"
								placeholder="你的姓名" ng-model="registerData.nickname" "
								required>{{error.accountError}}
						</div>
						
						<div class="form-group">
							<i class="icon-key"></i><input id="password" name="password" type="password"
								class="form-control" placeholder="密码：长度为6-20位的，数字或者英文字母"
								ng-model="registerData.password" pattern="[a-zA-Z0-9]{6,20}"
								required>{{error.passwordError}}
						</div>
						<div class="form-group">
							<i class="icon-key"></i><input id="password2" name="password2" type="password"
								class="form-control" placeholder="确认密码：长度为6-20位的，数字或者英文字母"
								ng-model="registerData.confirmPassword"
								pattern="[a-zA-Z0-9]{6,20}" required>{{error.confirmPasswordError}}
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success form-control">注册</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 注册弹出框 结束-->

	<script type="text/javascript">
		function selectLi(li) {
			var allLi = $("#header .nav li");
			for (var n = 0; n < allLi.length; n++) {
				$(allLi[n]).removeClass("active");
			}

			$(li).addClass("active");
		};

		function check() {
			var allLi = $("#header .nav li");
			// 获取#后面的内容
			var path = window.location.hash;
			if (path == "") {
				$(allLi[0]).addClass("active");
				return;
			}
			for (var n = 0; n < allLi.length; n++) {
				if ($(allLi[n]).html().indexOf(path) > -1) {
					$(allLi[n]).addClass("active");
				}
			}
		}

		check();
	</script>
</body>

</html>

