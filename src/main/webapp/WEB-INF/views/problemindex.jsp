<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<style>
#problemContent {
	margin: 50px;
}
</style>
<div id="problemContent" ng-controller="problemCtr">
	<div class="panel panel-primary">
		<div class="panel-heading">题目搜索</div>
		<div class="panel-body">
			<table class="table">
				<tr>
					<td>题目编号：<input type="number" ng-model="searchId">
						<button class="btn btn-success" type="button"
							ng-click="searchById()">搜索</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题目名称（支持模糊查询）：<input
						type="text" ng-model="searchName">
						<button class="btn btn-success" type="button"
							ng-click="searchByName()">搜索</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题目类型：<select
						ng-model="searchTypeId">
							<option ng-repeat="type in allProblemType"
								value="{{type.problemTypeId}}">{{type.problemTypeName}}</option>
					</select>
						<button class="btn btn-success" type="button"
							ng-click="searchByType()">搜索</button></td>
				</tr>
				<tr>
					<td>题目价值：<input type="number" ng-model="searchValue">
						<button class="btn btn-success" type="button"
							ng-click="searchByValue()">搜索</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题目难度：<input
						type="number" ng-model="searchDifficulty">
						<button class="btn btn-success" type="button"
							ng-click="searchByDifficulty()">搜索</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-success" type="button" ng-click="search()">无条件搜索</button></td>
				</tr>
			</table>
		</div>
	</div>

	<div class="panel panel-primary">
		<div class="panel-heading">题目信息</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-md-1">编号</th>
						<th class="col-md-1">题目类型</th>
						<th class="col-md-2">题目名字</th>
						<th class="col-md-1">题目价值</th>
						<th class="col-md-1">题目难度</th>
						<th class="col-md-1">答对率</th>
						<th class="col-md-3">题目标签</th>
						<th class="col-md-1">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="problem in page.datas">
						<td class="col-md-1">{{problem.problemId}}</td>
						<td class="col-md-1">{{problem.problemTypeId |
							problemTypeFilter : allProblemType}}</td>
						<td class="col-md-2">{{problem.problemName}}</td>
						<td class="col-md-1">{{problem.problemValue}}</td>
						<td class="col-md-1">{{problem.problemDifficulty}}</td>
						<td class="col-md-1">{{problem.totalRightCount/problem.totalSubmitCount|
							number:2}}({{problem.totalRightCount}}/{{problem.totalSubmitCount}})</td>
						<td class="col-md-3">{{problem.problemLabel}}</td>
						<td class="col-md-1"><a class="btn btn-success "
							type="button" href="#/problem/detail"
							ng-click="jumpDetail($index)">详情</a></td>
					</tr>
				</tbody>
			</table>
		</div>
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
</div>
