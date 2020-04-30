package love.china.bean;

public class Department {
	private Integer depid;
	private String depname;
	private String depmanager;
	private String depaddress;
	private Integer depcount;
	public Department() {
		super();
	}
	public Department(Integer depid, String depname, String depmanager, String depaddress, Integer depcount) {
		super();
		this.depid = depid;
		this.depname = depname;
		this.depmanager = depmanager;
		this.depaddress = depaddress;
		this.depcount = depcount;
	}
	@Override
	public String toString() {
		return "Department [depid=" + depid + ", depname=" + depname + ", depmanager=" + depmanager
				+ ", depaddress=" + depaddress + ", depcount=" + depcount + "]";
	}
	public Integer getdepid() {
		return depid;
	}
	public void setdepid(Integer depid) {
		this.depid = depid;
	}
	public String getdepname() {
		return depname;
	}
	public void setdepname(String depname) {
		this.depname = depname;
	}
	public String getDepmanager() {
		return depmanager;
	}
	public void setDepmanager(String depmanager) {
		this.depmanager = depmanager;
	}
	public String getDepaddress() {
		return depaddress;
	}
	public void setDepaddress(String depaddress) {
		this.depaddress = depaddress;
	}
	public Integer getdepcount() {
		return depcount;
	}
	public void setdepcount(Integer depcount) {
		this.depcount = depcount;
	}
}
