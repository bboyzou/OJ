<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ng-app="onlineJudgeApp">

<head>
<meta charset="UTF-8">
<title>在线评测系统</title>

<style>
#welcome {
	overflow: hidden;
	background: black;
}

canvas {
	margin: 0;
}
</style>
</head>

<body>
<div id="welcome">
	<canvas id="welcomeCanvas"></canvas>
</div>
<div load-Script ng-src="js/welcome.js"></div>
</body>

</html>
