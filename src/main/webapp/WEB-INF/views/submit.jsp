<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="index1.jsp"%>
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
			<font size="10">jlh吃水果</font>
		</h1>
		<table class="table table-striped">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-md-1">Time Limit</th>
						<th class="col-md-1">Memory Limit</th>
						<th class="col-md-2">Judge Program</th>
						<th class="col-md-1">Ratio(Solve/Submit)</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="problem in page.datas">
						<td class="col-md-1">1s</td>
						<td class="col-md-1">32768KB</td>
						<td class="col-md-2">Standard</td>
						<td class="col-md-1">21.30%(49/230)</td>
					</tr>
				</tbody>
			</table>
			</div>
			<div id="problemContent">
				<div class="problemIteam">Description:</div>
				<p>
					<span style="font-size: 16px;">jlh很喜欢吃水果，苹果是他最喜欢的，其次是梨。他天天想着吃水果，竟然感动了女娲大神，女娲大神给了他n个篮子，让他选择其中的m个(m&lt;=n)个篮子。每个篮子里有a个苹果和b个梨。请你们帮jlh选择篮子吧。</span>
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

			<a href="#" id="submission_link"
				onclick="show_submission(); return false;">Submit</a>
			<script src="static/js/codemirror.js" type="text/javascript"></script>
			<div id="submission" style="display: none;">
				<form accept-charset="UTF-8" id="problem_submit">
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
								name="advanced_editor" onchange="toggle_editor()"
								onclick="toggle_editor()" type="checkbox" value="1" /> Use
							advanced editor
						</div>
						<label for="code">Code</label>
						<textarea id="code" name="code" autofocus="" rows="10" cols="160"
							style="overflow: scroll; overflow-x: hidden"></textarea>
					</div>
					<div class="actions">
						<input name="submit" type="submit" value="Submit"
							style="float: right">
					</div>
				</form>
			</div>

			<script type="text/javascript">
				var editor;
				function show_submission() {
					$('#submission').show();
					$('#submission_link').hide();
					editor = CodeMirror.fromTextArea(document
							.getElementById("code"), {
						lineNumbers : true,
					});
					$('#code').blur(function() {
						editor.setValue($('#code').val());
					});
					$('#compiler_id').change(set_mode);
					set_mode();
					toggle_editor();
				};
				$('#problem_submit').submit(
						function(e) {
							$('#code').val(editor.getValue());
							e.preventDefault();
							$.ajax({
								type : 'POST',
								url : '/problems/5',
								data : $(this).serialize(),
								error : function(XMLHttpRequest) {
									if (XMLHttpRequest.status == 401) {
										alert('Please Sign In.');
										window.location.href = '/sess';
									} else {
										var json = eval('('
												+ XMLHttpRequest.responseText
												+ ')');
										if (json.info != null) {
											$('#warning').text(json.info);
										} else {
											$('#warning').text('');
										}
									}
								},
								success : function(result) {
									$('textarea').val('')
									window.location.href = '/status';
								}
							});
						});
				function toggle_editor() {
					var cm = $('.CodeMirror'), c = $('#code');
					if ($('#advanced_editor').prop('checked')) {
						cm.show();
						editor.setValue(c.val());
						c.hide();
					} else {
						c.val(editor.getValue()).show();
						cm.hide();
					}
					;
					return true;
				}
				function set_mode() {
					var compiler = $('#compiler_id option:selected').text();
					var modes = [ 'Javascript', 'Haskell', 'Lua', 'Pascal',
							'Python', 'Ruby', 'Scheme', 'Smalltalk', 'Clojure',
							[ 'PHP', 'text/x-php' ], [ 'C', 'text/x-csrc' ],
							[ 'C++', 'text/x-c++src' ],
							[ 'Java', 'text/x-java' ], [ '', 'text/plain' ] ];
					for (var i = 0; i != modes.length; ++i) {
						var n = modes[i], m = modes[i];
						if ($.isArray(n)) {
							m = n[1];
							n = n[0];
						}
						if (compiler.indexOf(n) >= 0) {
							editor.setOption('mode', m.toLowerCase());
							break;
						}
					}
				};
			</script>


			</div>
			</div>
			<script type="text/javascript">
				$('.user_signout').on('click', function(e) {
					e.preventDefault();
					$.ajax({
						type : 'DELETE',
						url : '/sess',
						data : $(this).serialize(),
						error : function() {
							alert('Sign Out Failed.');
						},
						success : function() {
							window.location.href = '/sess';
						}
					});
				});
			</script>

			<script src="static/js/jquery.min.js"></script>

			<script src="static/js/bootstrap.min.js"></script>