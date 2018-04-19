package com.ssm.pojo;

public class AllSubInfo {
	private String problem_id;
	private String problem_name;
	private String submit_date;
	private String result;
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
	public String getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public AllSubInfo(String problem_id,String problem_name,String submit_date,String result) {
		// TODO Auto-generated constructor stub
		this.problem_id=problem_id;
		this.problem_name=problem_name;
		this.submit_date=submit_date;
		this.result=result;
		
		
	}
	public AllSubInfo() {
		// TODO Auto-generated constructor stub
	}
}
