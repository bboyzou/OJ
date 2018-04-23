<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<style>
#problemContent {
	margin: 50px;
}
</style>
<div id="problemContent" ng-controller="problemCtr">
<!--  
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
-->
	
	<div class="panel panel-success">
		<div class="panel-heading">题目信息</div>
		<div class="panel-body">
			<table class="table table-striped" ng-controller="CartController">
				<thead>
					<tr>
						<th class="col-md-1">题号</th>
						<th class="col-md-1">题目名字</th>
						<th class="col-md-1">布题老师</th>
						<th class="col-md-1">选题</th>
					</tr>
				</thead>
				<tbody>
					<tr  ng-repeat="item in items">
						<td class="col-md-1">{{item.problem_id}}</td>
						<td class="col-md-2">{{item.problem_name}}</td>
						<td class="col-md-1">{{item.name}}</td>
						<td class="col-md-1"><button class="btn btn-success "
							 onclick="validate(this)">确定选择</button></td>
					</tr>
				</tbody>
				<script>
				function validate(x){
					var b=$(x.parentNode.parentNode).find("td").eq(0).text();
                	$.ajax({
              		  type: 'POST',
              		  url: 'SureChoose',
              		  data: {
              			problem_id:b
              		  },
              		  success: function(data){
              			  if(data=="OK"){
              				alert("提交成功");
              			  }else if(data=="No"){
              				alert("提交失败");
              			  }
              			  
              		  }
              		});
				}
				</script>
				
				<script>
					function CartController($scope) {
						$scope.items = ${info}
					}
				</script>
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
