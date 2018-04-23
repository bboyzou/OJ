<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<script  src="static/jquery.min.js"></script>
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
				<p>账号：{{${stuInfo}.id}}</p>
				<br />
				<p>昵称：{{${stuInfo}.name}}</p>
				<br />
<!--  
				<p>做过的题目：{{userData.haveDoneProblem}}</p>
				<br />
				<p>做对的题目：{{userData.rightProblemCount}}</p>
-->
				<br />
			</div>
		</div>
	</div>

	<div class="col-md-8">
		<div class="panel panel-success">
			<div class="panel-heading">做题记录</div>

			<div ng-app="myApp" class="panel-body">


				<table id="tb1" ng-controller="CartController" border="1">
				    <thead>
						<tr>
							<th class="col-md-1">题号</th>
							<th class="col-md-1">题目名字</th>
							<th class="col-md-1">提交时间</th>
							<th class="col-md-1">分数</th>
							<th class="col-md-1">操作</th>
						</tr>
					</thead>
					<tr  ng-repeat="item in items">
						<td class="col-md-1" >{{item.problem_id}}</td>
						<td class="col-md-1" >{{item.problem_name}}</td>
						<td class="col-md-1" >{{item.submit_date}}</td>
						<td class="col-md-1" >{{item.result}}</td>
						<td class="col-md-1" >
						<button  class="btn btn-success " onclick="doclick(this)">详情
						</button></td>
			                <script type="text/javascript">
			                function doclick(x){
			                	var b=$(x.parentNode.parentNode).find("td").eq(0).text();
			                	window.location.href="inSubmit?problem_id="+b;

			                	//alert(b);
			                	/*
			                	$.ajax({
			                		  type: 'POST',
			                		  url: 'inSubmit',
			                		  data: {
			                			  pid:b//注意传送参数时，前后台的参数名字和类型需要一样
			                		  },
			                		  "dataType" : 'json',
			                		  success: function(data){
			                			  //alert("aaa");
			                		  },
			                		  dataType: 'text'
			                		});
			                	*/
			                	
			                	/*
			                	  var xmlobj=new XMLHttpRequest();
			                	  var parm = "id=" + b;//构造URL参数
			                	  xmlobj.open("POST", "submit.jsp", true); //调用weather.php
			                	  xmlobj.setRequestHeader("cache-control","no-cache");
			                	  xmlobj.setRequestHeader("contentType","text/html;charset=uft-8") //指定发送的编码
			                	  xmlobj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");  //设置请求头信息
			                	  xmlobj.onreadystatechange = StatHandler;  //判断URL调用的状态值并处理
			                	  xmlobj.send(parm); //设置为发送给服务器数据
                               */
                               /*
                               var temp = document.createElement("form");
                               temp.action ="inSubmit";
                               temp.method = "post";
                               temp.style.display = "none";
                               var opt = document.createElement("textarea");
                               opt.name ="id";
                               opt.value = b;
                               // alert(opt.name)
                               temp.appendChild(opt);
                               document.body.appendChild(temp);
                               temp.submit();
                               return temp;
                                */
                                   /*
				                	var myForm = document.createElement("form");  
				                    myForm.method = "post";  
				                    myForm.action = "inSubmit"; 
				            
				                    var myInput = document.createElement("input");  
						            myInput.setAttribute("id", b);
						  
						            myForm.appendChild(myInput);
				                     
				                    document.body.appendChild(myForm);  
				                    myForm.submit();  
				                    document.body.removeChild(myForm); 
				                    */
			                  /*
			                	var b=$(this).closest("tr").find("input[name='sid']").val()
			                	alert(b);
			                	var table = document.getElementById("tb1");
			                	var id = table.rows[a].cells[1].id;
			                	var table = document.getElementById("表格ID");
			                	var id = table.rows[行号].cells[列号].id;
			                    var tab=document.getElementById("tbl");
			                    for(var i=1;i<=a;i++){ //遍历表格的行
			                       alert(rows[i].cells[0].innerHTML);
			                    }*/
			                 }
                            </script>
					</tr>
				</table>
				<script>
					function CartController($scope) {
						$scope.items = ${info};
					}
				</script>



				<!--  
				<table class="table table-striped" ng-controller="myCtrl" border="1">
					<thead>
						<tr>
							<th class="col-md-1">题号</th>
							<th class="col-md-1">题目名字</th>
							<th class="col-md-1">提交时间</th>
							<th class="col-md-1">分数</th>
							<th class="col-md-1">操作</th>
						</tr>
					</thead>
				
					<tr ng-repeat="x in records">
						<td class="col-md-1">{{x.problem_id}}</td>
						<td class="col-md-1">{{x.problem_name}}</td>
						<td class="col-md-1">{{x.submit_date}}</td>
						<td class="col-md-1">{{x.result}}</td>
						<td class="col-md-1">
								<button class="btn btn-success " type="button"
									ng-click="detail($index)">详情</button>
							</td>
					</tr>
				</table>

				<script>
					var app = angular.module("myApp", []);
					app.controller("myCtrl", function($scope) {
						$scope.records = ${info}
					});
				</script>

-->



				<!--  
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
							<td class="col-md-1">{{${info}.problem_id}}</td>
							<td class="col-md-1">{{${info}.problem_name}}</td>
							<td class="col-md-1">{{${info}.submit_date |
								stringDateFormat:'yyyy-MM-dd ' }}</td>
							<td class="col-md-1">{{${info}.result}}</td>
							<td class="col-md-1">
								<button class="btn btn-success " type="button"
									ng-click="detail($index)">详情</button>
							</td>
						</tr>
					</tbody>
				</table>
-->
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
	<a><font>${info}</font></a>
	<a><font>${stuInfo}</font></a>
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
