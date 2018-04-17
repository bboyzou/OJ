<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<style>
#userContent {
	margin: 50px;
}

p {
	word-break: break-all;
	display: inline-block;
}

#detailDialog {
	margin: 0;
	width: 100%;
}

#userContent .modal-dialog {
	width: 90%;
}

#userContent textarea {
	width: 90%;
}

#userContentCode {
	margin-top: 10px;
	margin-bottom: 10px;
	border: 1px solid black;
	padding: 10px;
	max-height: 450px;
	overflow: scroll;
}
</style>
<div id="userContent" ng-controller="userCtr">
	<div class="col-md-4">
		<div class="panel panel-info">
			<div class="panel-heading">个人信息</div>
			<div class="panel-body">
				<p>账号：{{userData.account}}</p>
				<br />
				<p>昵称：{{userData.nickname}}</p>
				<br />
				<p>做过的题目：{{userData.haveDoneProblem}}</p>
				<br />
				<p>做对的题目：{{userData.rightProblemCount}}</p>
				<br />
			</div>
		</div>
	</div>

	<div class="col-md-8">
		<div class="panel panel-success">
			<div class="panel-heading">做题记录</div>
			<div class="panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="col-md-1">题号</th>
							<th class="col-md-1">题目名字</th>
							<th class="col-md-1">提交时间</th>
							<th class="col-md-1">分数</th>
							<th class="col-md-1">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="record in page.datas">
							<td class="col-md-1">{{record.submitId}}</td>
							<td class="col-md-1">{{record.submitProblemId}}</td>
							<td class="col-md-2">{{record.submitTime |
								stringDateFormat:'yyyy-MM-dd HH:mm:ss' }}</td>
							<td class="col-md-2">{{record.details | omitDisplay : 10}}</td>
							<td class="col-md-1">{{record.isAccepted == true ? "通过" :
								"未通过"}}</td>
							<td class="col-md-1">{{record.score}}</td>
							<td class="col-md-1">
								<button class="btn btn-success " type="button"
									ng-click="detail($index)">详情</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="panel-foot">
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
	</div>

	<!-- 详情弹出框 开始-->
	<div class="modal fade dialog" id="detailDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
					<h4 class="modal-title">详情</h4>
				</div>
				<div class="modal-body">
					<div>题目编号：{{submitDetails.submitProblemId}}</div>
					<div>提交时间：{{submitDetails.submitTime |
						stringDateFormat:'yyyy-MM-dd HH:mm:ss' }}</div>
					<div>代码语言：{{submitDetails.codeLanguage}}</div>
					<div>通过情况：{{submitDetails.isAccepted == true ? "通过" : "未通过"}}</div>
					<div>分数：{{submitDetails.score}}</div>
					<div>
						代码：<br />
						<div id="userContentCode">{{submitDetails.code |
							formatToHtml : "userContentCode"}}</div>
					</div>
					<div ng-if="submitDetails.items">
						<table class="table table-striped ">
							<thead>
								<tr>
									<th class="col-md-2">时间消耗</th>
									<th class="col-md-2">内存消耗</th>
									<th class="col-md-6">信息</th>
									<th class="col-md-2">标准输入输出下载</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="item in submitDetails.items">
									<td class="col-md-2">{{item.useTime}}&nbsp;&nbsp;毫秒</td>
									<td class="col-md-2">{{item.useMemory}}&nbsp;&nbsp;KB</td>
									<td class="col-md-3">{{item.message}}</td>
									<td class="col-md-2">
										<button class="btn btn-success " type="button"
											ng-click="download($index)">下载</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 详情弹出框 结束-->
</div>
