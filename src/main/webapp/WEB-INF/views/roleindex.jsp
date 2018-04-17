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

<style>
#addDialog,#updateDialog {
	margin: 0;
}

.dialog .modal-content {
	width: 800px;
}

.dialog .width200 {
	width: 150px;
}

.dialog p {
	display: inline-block;
	margin: 10px;
}
</style>
<div>
	<div id="loadingTip" class="alert alert-success alert-dismissable"
		ng-if="isLoadingData">加载数据中，请稍等</div>

	<div ng-if="!isLoadingData">
		<button class="btn btn-primary common-topButton" type="button"
			ng-click="add()">添加角色</button>
		<button class="btn btn-success common-topButton" type="button"
			ng-click="refresh()">刷新数据</button>

		<table
			class="table table-bordered table-hover table-striped common-dataTable">
			<thead>
				<tr>
					<th class="span1">编号</th>
					<th class="span2">角色名字</th>
					<th class="span8">拥有的权限</th>
					<th class="span2">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="role in page.datas">
					<td class="span1">{{role.roleId}}</td>
					<td class="span2">{{role.roleName}}</td>
					<td class="span8">{{role.permissions | permissionExplain :
						allPermission }}</td>
					<td class="span2">
						<button class="btn btn-info " type="button"
							ng-click="edit($index)">修改</button>
						<button class="btn btn-danger " type="button"
							ng-click="delete($index)">删除</button>
					</td>
				</tr>
			</tbody>
		</table>

		<ul class="pager">
			<li><a href="javascript:;" ng-if="isCanPre"
				ng-click="changePage(false)">&laquo;上一页</a></li>
			<li class="active"><span>页码：{{page.currentPage}}/{{page.totalPage}}
					&nbsp; &nbsp;总条数：<span class="badge">{{page.totalCount}}</span>
			</span></li>
			<li><a href="javascript:;" ng-if="isCanNext"
				ng-click="changePage(true)">下一页&raquo;</a></li>
		</ul>
	</div>
	<!-- 修改弹出框 开始-->
	<div class="modal fade dialog" id="updateDialog">
		<div class="modal-dialog">
			<form ng-submit="editSubmit()">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only"></span>
						</button>
						<h4 class="modal-title">角色信息修改窗口</h4>
					</div>
					<div class="modal-body">
						<table class="table table-bordered table-hover ">
							<tbody>
								<tr>
									<td class="width200">角色名字：</td>
									<td><input type="text"
										ng-model="currentUpdateObj.roleName" required maxlength="20">{{error.roleNameError}}</td>
								</tr>
								<tr>
									<td class="width200">角色拥有权限：</td>
									<td><p
											ng-repeat="permission in updateMaterial.allPermission">
											<input type="checkbox"
												ng-model="updateMaterial.allPermission[$index].isCheck">{{permission.explanation}}
										</p></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 修改弹出框 结束-->

	<!-- 添加弹出框 开始-->
	<div class="modal fade dialog" id="addDialog">
		<div class="modal-dialog">
			<form ng-submit="addSubmit()">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only"></span>
						</button>
						<h4 class="modal-title">角色添加窗口</h4>
					</div>
					<div class="modal-body">
						<table class="table table-bordered table-hover ">
							<tbody>
								<tr>
									<td class="width200">角色名字：</td>
									<td><input type="text" ng-model="currentAddObj.roleName"
										maxlength="20" required>{{error.roleNameError}}</td>
								</tr>
								<tr>
									<td class="width200">角色拥有权限：</td>
									<td><p ng-repeat="permission in addMaterial.allPermission">
											<input type="checkbox"
												ng-model="addMaterial.allPermission[$index].isCheck">{{permission.explanation}}
										</p></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">添加</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 添加弹出框 结束-->
</div>
</body>
</html>