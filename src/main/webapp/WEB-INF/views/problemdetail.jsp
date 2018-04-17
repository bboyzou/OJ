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
#problemDetailContent {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	word-break: break-all;
	text-align: center;
}

#answerDialog {
	margin: 0;
	width: 100%;
	text-align: center;
}

#answerDialog .modal-header {
	border-bottom: 0;
}

#problemDetailContent .modal-dialog {
	width: 90%;
}

#problemDetailContent textarea {
	width: 90%;
}
</style>
</head>
<body>
<div id="problemDetailContent" ng-controller="problemDetailCtr">
	<h2>{{problemDetailObj.problemName}}</h2>
	<p>类型：{{problemDetailObj.typeName}}</p>
	<p>标签：{{problemDetailObj.problemLabel}}</p>
	<p>内存限制：{{problemDetailObj.memoryLimit}}KB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间限制：{{problemDetailObj.timeLimit}}毫秒</p>
	<p>难度：{{problemDetailObj.problemDifficulty}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价值：{{problemDetailObj.problemValue}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版本：{{problemDetailObj.problemVersion}}</p>
	<br />
	<p id="detailProblemContent">{{problemDetailObj.problemContent |
		formatToHtml : "detailProblemContent"}}</p>
	<br />
	<p>
		<button class="btn btn-success" type="button"
			ng-click="answerDialogShow()">提交答案</button>
		</td>
	</p>

	<!-- 提交代码弹出框 开始-->
	<div class="modal fade dialog" id="answerDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
				</div>
				<div class="modal-body">
					<p>题目编号：{{problemDetailObj.problemId}}</p>
					<p>题目名字：{{problemDetailObj.problemName}}</p>
					<p>代码语言：java</p>
					<textarea rows="20" cols="100" ng-model="answerData.code"></textarea>
					<br /> <br /> <br />
					<button class="btn btn-success" type="button"
						ng-click="answerSubmit()" ng-disabled="answerStatus.disabled">{{answerStatus.buttonText}}</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 提交代码弹出框 结束-->
</div>
</body>
</html>
