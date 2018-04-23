<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="head.jsp"%>
<div class="container">
	<hr>
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
	</div>



	<script src="static/js/jquery.pin.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(".pinned").pin();
	</script>

	<div>
		<h1 style="text-align: center">
			<font size="10">${sub.problem_name}</font>
		</h1>
		<table class="table table-striped">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-md-1">Time Limit(s)</th>
						<th class="col-md-1">Memory Limit(KB)</th>
						<th class="col-md-1">Ratio(Solve/Submit)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="col-md-1">${sub.time_lim}</td>
						<td class="col-md-1">${sub.memory_lim}</td>
						<td class="col-md-1">21.30%(49/230)</td>
					</tr>
				</tbody>
			</table>
			</div>
			<div id="problemContent">
				<div class="problemIteam">Description:</div>
				<p>
					<span style="font-size: 16px;">${sub. content}</span>
				</p>
				<div class="problemIteam">Input:</div>
				<p>
					<span style="font-size: 14px;">输入一个t(t&lt;=10)，表示有t组测试数据，再输入n和m(0=&lt;m&lt;=n&lt;=100000)，接下来的n行，输入a和b表示苹果和梨的数量。</span>
				</p>
				<div class="problemIteam">Output:</div>
				<p>
					<span style="font-size: 16px;">按jlh选择的顺序(先选苹果多的，苹果数量相同选梨多的，两者相同选序号小的)篮子的序号(1-n)，m个数用空格隔开。</span>
				</p>
				<div class="problemIteam">Sample Input:</div>
				<pre class="sample">2
2 1
2 0
1 4

3 2
3 4
2 6
3 5</pre>
				<div class="problemIteam">Sample Output:</div>
				<pre class="sample">1
3 1</pre>


			</div>
			<hr>

			<script src="static/js/codemirror.js" type="text/javascript"></script>
			<div id="submission">
				<form accept-charset="UTF-8" id="problem_submit"
					onsubmit="return validate()">
					<div style="margin: 0; padding: 0; display: inline">
						<input name="utf8" type="hidden" value="✓">
					</div>
					<div class="field">
						<label for="compiler_id">Compiler</label> <select id="compiler_id"
							name="compiler_id">
							<option value="1">C</option>
							<option value="2">C++</option>
							<option value="3">Java</option>
						</select> <font id="warning" color="red"></font>
					</div>
					<div class="field">
						<div class="rfloat">
							<input checked="checked" id="advanced_editor"
								name="advanced_editor" type="checkbox" value="1" /> Use
							advanced editor
						</div>
						<label for="code">Code</label>
						<textarea id="code" name="code" autofocus="" rows="10" cols="140"
							style="overflow: scroll; overflow-x: hidden"></textarea>
					</div>
					<div class="actions">
						<input name="submit" type="submit" value="Submit"
							style="float: right">
					</div>
				</form>
				<script>
				function validate(){
					var compiler_id= document.getElementById("compiler_id").value;
					var code = document.getElementById("code").value;
					var problem_id=${sub.problem_id};
                	$.ajax({
              		  type: 'POST',
              		  url: 'Submit',
              		  data: {
              			problem_id:problem_id,
              			compiler_id:compiler_id,//注意传送参数时，前后台的参数名字和类型需要一样
              			submit_code:code
              		  },
              		  success: function(data){
              			  alert("提交成功");
              		  }
              		});
				}
				</script>
			</div>

			</div>
			</div>

			<script src="static/js/jquery.min.js"></script>

			<script src="static/js/bootstrap.min.js"></script>