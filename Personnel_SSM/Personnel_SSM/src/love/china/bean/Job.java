package love.china.bean;

public class Job {
	private Integer jobid;
	private String jobname;
	private Integer jobcount;
	public Job() {
		super();
	}
	public Job(Integer jobid, String jobname, Integer jobcount) {
		super();
		this.jobid = jobid;
		this.jobname = jobname;
		this.jobcount = jobcount;
	}
	@Override
	public String toString() {
		return "Job [jobid=" + jobid + ", jobname=" + jobname + ", jobcount=" + jobcount + "]";
	}
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public Integer getJobcount() {
		return jobcount;
	}
	public void setJobcount(Integer jobcount) {
		this.jobcount = jobcount;
	}
}
