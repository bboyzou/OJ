<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="teahead.jsp" %>
<style>
#problemContent {
	margin: 50px;
}
</style>
<div id="problemContent" ng-controller="problemCtr">
	<div class="panel panel-success">
		<div class="panel-heading">学生选题信息</div>
		<div class="panel-body">
			<table class="table table-striped" ng-controller="CartController">
				<thead>
					<tr>
						<th class="col-md-1">题号</th>
						<th class="col-md-1">题目名字</th>
						<th class="col-md-1">学号</th>
						<th class="col-md-1">姓名</th>
						<th class="col-md-1">学生成绩</th>
						<th class="col-md-1">选用语言</th>
						<th class="col-md-1">代码</th>
						<th class="col-md-1">提交日期</th>
					</tr>
				</thead>
				<tbody>
					<tr  ng-repeat="item in items">
						<td class="col-md-2">{{item.problem_id}}</td>
						<td class="col-md-2">{{item.problem_name}}</td>
						<td class="col-md-2">{{item.user_id}}</td>
						<td class="col-md-2">{{item.name}}</td>
						<td class="col-md-2">{{item.result}}</td>
						<td class="col-md-2">{{item.language}}</td>
						<td class="col-md-2"><button class="btn btn-success " id="btn"
							 onclick="validate(this)" data-toggle="modal" data-target="#loginDialog11">详情</button></td>
						<td class="col-md-2">{{item.submit_date}}</td>
					</tr>
				</tbody>
				<script>
				function validate(x){
					var b=$(x.parentNode.parentNode).find("td").eq(0).text();
					var c=$(x.parentNode.parentNode).find("td").eq(2).text();
					//模拟点击事件，弹出代码框
					/*
				    var oBtn = document.getElementById('btn');
				    oBtn.onclick = function(data){
				        alert(data);
				    };
				    */
                	$.ajax({
              		  type: 'POST',
              		  url: 'lookCode',
              		  data: {
              			problem_id:b,
              			user_id:c
              		  },
              		  success: function(data){
              			    showcode(data);
              				//alert(data);  
              				//oBtn.click();//弹出代码显示框
              		  }
              		});
				}
				   function showcode(data){
					     //alert("aaa");函数已经调用了，但是div不显示
					     //$("#loginDialog").css("display","block");
					     //$("#textarea_id").css("display","block");
					     //document.getElementById('loginDialog').style.display='block';
					     //document.getElementById('textarea_id').style.display='block';
					     document.getElementById('textarea_id').value=data;
					   }
				</script>
				<script>
					function CartController($scope) {
						$scope.items = ${info}
					}
				</script>
			</table>
		</div>
		<div>
				<center><a class="btn btn-success "type="button" href="teacher">返回上一级</a>
	            </center>
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
   <!-- 详情弹出框运动的是插件，需要点击按钮显示时，需要在按钮出增加两个属性data-toggle="modal" data-target="#loginDialog11" -->
	<div class="modal fade dialog" id="loginDialog11">
		<div class="modal-dialog"  >
			<div class="modal-content" style="background-image:url('static/img/loginBg.png')">
				<div class="modal-header" >
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
				</div>
				<div class="modal-body" >
					<form class="form-horizontal" >
						<p><font size="5">学生代码</font></p>
						<div class="form-group" >
							<textarea rows="6" cols="60" id="textarea_id">
                             <!-- 预留代码展示位置 -->                   
                            </textarea>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
