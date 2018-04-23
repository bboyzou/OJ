package com.ssm.pojo;

public class TeaSub {
	private String tid;
	private String problem_id;
	private String problem_name;
	private String content;
	private String time_lim;
	private String memory_lim;
	public String getTime_lim() {
		return time_lim;
	}
	public void setTime_lim(String time_lim) {
		this.time_lim = time_lim;
	}
	public String getMemory_lim() {
		return memory_lim;
	}
	public void setMemory_lim(String memory_lim) {
		this.memory_lim = memory_lim;
	}
	public TeaSub(){
		
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(String problem_id) {
		this.problem_id = problem_id;
	}
	public String getProblem_name() {
		return problem_name;
	}
	public void setProblem_name(String problem_name) {
		this.problem_name = problem_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	

}
