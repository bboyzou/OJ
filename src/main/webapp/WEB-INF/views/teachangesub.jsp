<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="teahead.jsp"%>
<style>
#problemContent {
	margin: 50px;
}

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
<script>
	function CartController($scope) {
		$scope.items = $
		{
			info
		}
	}
</script>
<div id="problemContent" ng-controller="problemCtr">
	<div class="panel panel-success">
		<div class="panel-heading">设置题目</div>
		<div class="panel-body">
			<form action="teaAddSub" method="post">
				<center>
					<div>题名</div>
				</center>
				<center>
					<div>
						<input style="width: 500px" type="text" id="problem_name"
							name="problem_name" value=${subInfo.problem_name } />
					</div>
				</center>
				<center>
					<div>题目内容</div>
				</center>
				<center>
					<div>
						<textarea rows="6" cols="60" id="content" name="content">
						${subInfo.content }
					</textarea>
					</div>
				</center>
				<center>
					<div>时间限制</div>
				</center>
				<center>
					<div>
						<input style="width: 500px" type="text" id="time_lim"
							name="time_lim" value=${subInfo.time_lim } />
					</div>
				</center>
				<center>
					<div>空间限制</div>
				</center>
				<center>
					<div>
						<input style="width: 500px" type="text" id="memory_lim"
							name="memory_lim" value=${subInfo.memory_lim } />
					</div>
				</center>
				<center>
					<div>
						<input type="submit" value="确定修改" />
					</div>
				</center>

			</form>
		</div>
	</div>
	<div class="panel panel-success">
		<div class="panel-heading">修改测试数据</div>
		<div ng-app="myApp" class="panel-body">
			<table id="tb1" ng-controller="CartController" border="1">
				<thead>
					<tr>
						<th class="col-md-1">测试数据序号</th>
						<th class="col-md-1">测试输入</th>
						<th class="col-md-1">测试输出</th>
						<th class="col-md-1">修改</th>
						<th class="col-md-1">删除</th>
					</tr>
				</thead>
				<tr ng-repeat="item in items">
					<td class="col-md-1">{{item.data_id}}</td>
					<td class="col-md-1">{{item.data_in}}</td>
					<td class="col-md-1">{{item.data_out}}</td>
					  
					<td class="col-md-1">
						<button class="btn btn-success " onclick="detailclick(this)"
							data-toggle="modal" data-target="#detailteatdata">修改</button>
					</td>
					<td class="col-md-1">
						<button class="btn btn-success " onclick="changeclick(this)"
							data-toggle="modal" data-target="#changetestdata">删除</button>
					</td>
					
				</tr>
			</table>
			
			<script>
			function CartController($scope) {
				$scope.items = ${testdata}
			}
				function detailclick(x) {
					/*
					var b = $(x.parentNode.parentNode).find("td").eq(0).text();
					var problem_id = document.getElementById('name_id').value;
					$.ajax({
						type : 'POST',
						url : 'showtestdata',
						data : {
							problem_id : problem_id,
							data_id : b
						},
						success : function(data) {
							// showdata(data);
						}
					});*/
				}
				function changeclick(x) {
					var problem_id = document.getElementById('name_id').value;
					var b = $(x.parentNode.parentNode).find("td").eq(0).text();//获取测试数据标号
					setdivinit(problem_id, b);
				}
				function setdivinit(problem_id, b) {
					document.getElementById('problem_id').value = problem_id;
					document.getElementById('testdata_id').value = b;
				}

				function submittestdata() {
					var problem_id = document.getElementById('problem_id').value;
					var b = document.getElementById('testdata_id').value;
					var testdata_in = document.getElementById('testdata_in').value;
					var testdata_out = document.getElementById('testdata_out').value;
					$.ajax({
						type : 'POST',
						url : 'changetestdata',
						data : {
							problem_id : problem_id,
							data_id : b,
							testdata_in : testdata_in,
							testdata_out : testdata_out
						},
						success : function(data) {
							alert("修改成功");
						}
					});
				}
			</script>
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

<!--  
<div id="userContent" ng-controller="userCtr">
	<div class="col-md-4">
		<div class="panel panel-info">
			<div class="panel-heading">设置题目</div>
		<div class="panel-body" >
			<form action="teaAddSub" method="post">				
					<center><div >题名</div></center>
					<center><div><input  style="width:500px" type="text" id="problem_name" name="problem_name" /></div></center>
					<center><div>题目内容</div></center>
					<center><div><textarea rows="6" cols="60" id="content" name="content">
					</textarea></div></center>
					<center><div >时间限制</div></center>
					<center><div ><input style="width:500px" type="text" id="time_lim" name="time_lim" /></div></center>
					<center><div >空间限制</div></center>
					<center><div ><input style="width:500px" type="text" id="memory_lim" name="memory_lim" /></div></center>
					<center><div><input type="submit" value="增加题目" />
					</div></center>
					
			</form>
		</div>
		</div>
	</div>

	<div class="col-md-8">
		<div class="panel panel-success">
			<div class="panel-heading">修改测试数据</div>
			<div ng-app="myApp" class="panel-body">
				<table id="tb1" ng-controller="CartController" border="1">
				    <thead>
						<tr>
							<th class="col-md-1">测试数据序号</th>
							<th class="col-md-1">测试数据详情</th>
							<th class="col-md-1">修改测试数据</th>
						</tr>
					</thead>
					<tr  ng-repeat="item in items">
						<td class="col-md-1" >{{item.testdata_id}}</td>
						<td class="col-md-1" >
						<button  class="btn btn-success " onclick="detailclick(this)" data-toggle="modal" data-target="#detailteatdata">详情
						</button></td>
			            <td class="col-md-1" >
						 <button  class="btn btn-success " onclick="changeclick(this)" data-toggle="modal" data-target="#changetestdata">修改
						</button></td>
					</tr>
				</table>
				<script>
				function detailclick(x){
                    var b=$(x.parentNode.parentNode).find("td").eq(0).text();
                    var problem_id=document.getElementById('name_id').value;
                	$.ajax({
              		  type: 'POST',
              		  url: 'showtestdata',
              		  data: {
              			problem_id:problem_id,
              			data_id:b
              		  },
              		  success: function(data){
              			   // showdata(data);
              		  }
              		});
				}
				function changeclick(x){
					var problem_id=document.getElementById('name_id').value;
					var b=$(x.parentNode.parentNode).find("td").eq(0).text();//获取测试数据标号
                    setdivinit(problem_id,b); 
				}
				function  setdivinit(problem_id,b){
					document.getElementById('problem_id').value=problem_id;
					document.getElementById('testdata_id').value=b;
				}
				
				function CartController($scope) {
						$scope.items = ${info};
					}
				function submittestdata(){
						var problem_id=document.getElementById('problem_id').value;
						var b=document.getElementById('testdata_id').value;
						var testdata_in=document.getElementById('testdata_in').value;
						var testdata_out=document.getElementById('testdata_out').value;
	                	$.ajax({
	              		  type: 'POST',
	              		  url: 'changetestdata',
	              		  data: {
	              			problem_id:problem_id,
	              			data_id:b,
	              			testdata_in:testdata_in,
	              			testdata_out:testdata_out
	              		  },
	              		  success: function(data){
	              			    alert("修改成功");
	              		  }
	              		});
					}
				</script>
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
		
    <!-- 测试数据详情弹出框 开始-->
<div class="modal fade dialog" id="detailteatdata">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title">测试数据详情</h4>
			</div>
			<div class="modal-body">
				<div>题目编号：{{submitDetails.problem_id}}</div>
				<div>测试数据编号：{{submitDetails.testdata_id}}</div>
				<div>输入：{{submitDetails.in}}</div>
				<div>输出：{{submitDetails.out}}</div>
			</div>
		</div>
	</div>
</div>
<!-- 测试数据详情弹出框 结束-->

<!-- 修改数据弹出框 开始-->
<div class="modal fade dialog" id="#changetestdata">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title">修改测试数据</h4>
			</div>
			<div class="modal-body">
				<form action="log" class="form-horizontal"
					ng-submit="submittestdata()">
					<span class="heading">修改数据</span>
					<div class="form-group">
						<i class="icon-user"></i><input id="problem_id" name="problem_id"
							type="text" class="form-control" placeholder="问题编号，不可改变"
							readonly="readonly">
					</div>
					<div class="form-group">
						<i class="icon-key"></i><input id="testdata_id" name="testdata_id"
							type="text" class="form-control" placeholder="测试数据序号"
							readonly="readonly">
					</div>
					<div class="form-group">
						<i class="icon-key"></i><input id="testdata_in" name="testdata_in"
							type="text" class="form-control" placeholder="输入">
					</div>
					<div class="form-group">
						<i class="icon-key"></i><input id="testdata_out"
							name="testdata_out" type="text" class="form-control"
							placeholder="输出">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-success form-control">修改</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 修改数据弹出框 结束-->
</div>
