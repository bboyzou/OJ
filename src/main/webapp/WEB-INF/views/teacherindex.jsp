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
<style>
#problemContent {
	margin: 50px;
}
</style>
</head>
<body>
<div class="panel panel-primary">
		<div class="panel-heading">成绩查询</div>
		<div class="panel-body">
			<table class="table">
				<tr>
					<td>题目编号：<input type="number" ng-model="searchId">
                                                             题目名称（支持模糊查询）：<input type="text" ng-model="searchName">
                                                            学生姓名：<input type="text" ng-model="searchName">
					 <button class="btn btn-success" type="button"
							ng-click="searchStudentScore()">搜索</button></td>
				</tr>

			</table>
		</div>
	</div>

	<div class="panel panel-primary">
		<div class="panel-heading">设置题目信息</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-md-1">编号</th>
						<th class="col-md-1">题目类型</th>
						<th class="col-md-2">题目名字</th>
						<th class="col-md-1">题目内容</th>
						<th class="col-md-1">题目测试数据</th>
						<td class="col-md-1">测试题目</td>
						<td class="col-md-1">提交题目</td>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="problem in page.datas">
						<td class="col-md-1">编号设置</td>
						<td class="col-md-1">类型设置</td>
						<td class="col-md-2">名字设置</td>
						<td class="col-md-1">内容设置</td>
						<td class="col-md-1">测试数据设置</td>
						<td class="col-md-1"><a class="btn btn-success "
							type="button" href="problemtest"
							ng-click="jumpDetail(problemtest)">测试详情</a></td>
						<td class="col-md-1"><button class="btn btn-success" type="button" ng-click="submit()">提交题目</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
