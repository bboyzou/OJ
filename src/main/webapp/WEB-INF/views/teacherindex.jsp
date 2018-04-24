<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="teahead.jsp" %>
<style>
#problemContent {
	margin: 50px;
}
#mydiv{
width: 200px;
            height: 200px;
            background: green;
            position:absolute;
            left:50%;    /* 定位父级的50% */
            top:50%;
            top: 0;
            bottom: 0;
            right: 0;
            margin: auto;}
</style>
<div id="problemContent" ng-controller="problemCtr">
	<div class="panel panel-success">
		<div class="panel-heading">题目信息</div>
		<div class="panel-body">
			<table class="table table-striped" ng-controller="CartController">
				<thead>
					<tr>
						<th class="col-md-1">题号</th>
						<th class="col-md-1">题目名字</th>
						<th class="col-md-1">查询选题学生成绩</th>
						<th class="col-md-1">修改题目</th>
						<th class="col-md-1">删除题目</th>
						
					</tr>
				</thead>
				<tbody>
					<tr  ng-repeat="item in items">
						<td class="col-md-1">{{item.problem_id}}</td>
						<td class="col-md-1">{{item.problem_name}}</td>
						<td class="col-md-1"><a class="btn btn-success "
							type="button" 
							onclick="doclick(this)">查询 </a></td>
						<td class="col-md-1"><a class="btn btn-success "
							type="button" 
							onclick="doclick1(this)">修改</a></td>
						<td class="col-md-1"><a class="btn btn-success "
							type="button" 
							onclick="deleSub(this)">删除</a></td>
					    <script type="text/javascript">
			                function doclick(x){
			                	var b=$(x.parentNode.parentNode).find("td").eq(0).text();
			                	window.location.href="teaSearch?problem_id="+b;
			                }
			                function doclick1(x){
			                	var b=$(x.parentNode.parentNode).find("td").eq(0).text();
			                	window.location.href="teaChangeSub?problem_id="+b;
			                }
			
			                function deleSub(x){
			                	var b=$(x.parentNode.parentNode).find("td").eq(0).text();
			                	var con;
			                	con=confirm("是否删除题目?");
			                	if(con==true){
			                		$.ajax({
					              		  type: 'POST',
					              		  url: 'TeaDeleSub',
					              		  data: {
					              			problem_id:b
					              		  },
					              		  success: function(data){
					              			  if(data=="1"){
					              				alert("删除成功");
					              				window.location.reload();
					              			  }else if(data=="0"){
					              				alert("删除失败");
					              			  } 
					              			  
					              		  }
					              		});
			                	}else{
			                	}
			        		}
					    </script>
					</tr>
				</tbody>
				<script>
					function CartController($scope) {
						$scope.items = ${info}
					}
				</script>
			</table>
		</div>
		<div class="mydiv">
				<center><a class="btn btn-success "
				type="button" href="inTeaAdd"><font size="4">+</font></a>
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
</div>
