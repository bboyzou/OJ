<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ng-app="managerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>源代码在线编译系统管理后台</title>

<link rel="SHORTCUT ICON" href="static/img/logo.png">
<link rel="BOOKMARK" href="static/img/logo.png">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href=""static/css/index.css" rel="stylesheet">
<link href=""static/css/common.css" rel="stylesheet">
<link href="static/css/font-awesome.min.css" rel="stylesheet">
<link href="static/css/umeditor.css" type="text/css" rel="stylesheet">
<script src="static/js/angular.min.js"></script>
<script src="static/js/angular-route.min.js"></script>
<script src="static/js/app.js"></script>
<script src="static/js/controllers.js"></script>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script charset="utf-8" src="static/umeditor.config.js"></script>
<script charset="utf-8" src="static/umeditor.min.js"></script>
<script src="static/js/zh-cn.js"></script>
</head>

<body ng-controller="managerIndexCtr">

	<div id="topNav">
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a> <a class="brand" href="javascript:;"><i
						class="icon-laptop icon-large"></i>&nbsp;源代码在线编译系统&nbsp;管理后台</a>
					<div class="nav-collapse collapse">
						<ul class="nav pull-right">
							<li class="dropdown"><a href="javascript:;"
								class="dropdown-toggle"> <i class="icon-user"></i>
									欢迎：{{nickname}}
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="leftNav">
		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			<li onclick="selectLi(this)"><a href="managerindex">管理员管理<i
					class="icon-chevron-right"></i></a></li>
			<li onclick="selectLi(this)"><a href="roleindex">教师角色管理<i
					class="icon-chevron-right"></i></a></li>
			<li onclick="selectLi(this)"><a href="userindex">学生用户管理<i
					class="icon-chevron-right"></i></a></li>
			<li onclick="selectLi(this)"><a href="announcementindex">公告管理<i
					class="icon-chevron-right"></i></a></li>
		</ul>
	</div>

	<div id="content">
		<div ng-view></div>
	</div>
	<!-- 	为了方便，直接写这里了 -->
	<script type="text/javascript">
		function selectLi(li) {
			var allLi = $("#leftNav ul li");
			for (var n = 0; n < allLi.length; n++) {
				$(allLi[n]).removeClass("active");
			}

			$(li).addClass("active");
		};

		function check() {
			var allLi = $("#leftNav ul li");
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