<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="teahead.jsp"%>
<style>
#problemContent {
	margin: o auto;
	width:100%;
	text-align:cnter;
}


</style>

<div id="problemContent" ng-controller="problemCtr">
	<div class="panel panel-success">
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
