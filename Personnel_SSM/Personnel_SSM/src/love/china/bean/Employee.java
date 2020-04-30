package love.china.bean;

import java.sql.Date;

/*
 * 员工实体类：
 */
public class Employee {
	
	private Integer depid;		//部门编号
	private Integer empid;		//员工编号
	private String empname;		//员工姓名
	private String gender;		//员工性别
	private Date hiredate;		//入厂时间
	private String address;		//员工住址
	private Date birthdate;		//员工生日
	private String phone;		//联系方式
	private Integer jobid;		//部门编号
	private Integer salary;		//员工薪资
	private String password;	//员工账号登陆密码
	
	public Employee() {
		super();
	}

	public Employee(Integer depid, Integer empid, String empname, String gender, Date hiredate, String address,
			Date birthdate, String phone, Integer jobid, Integer salary, String password) {
		super();
		this.depid = depid;
		this.empid = empid;
		this.empname = empname;
		this.gender = gender;
		this.hiredate = hiredate;
		this.address = address;
		this.birthdate = birthdate;
		this.phone = phone;
		this.jobid = jobid;
		this.salary = salary;
		this.password = password;
	}

	@Override
	public String toString() {
		return "Employee [depid=" + depid + ", empid=" + empid + ", empname=" + empname + ", gender=" + gender
				+ ", hiredate=" + hiredate + ", address=" + address + ", birthdate=" + birthdate + ", phone=" + phone
				+ ", jobid=" + jobid + ", salary=" + salary + ", password=" + password + "]";
	}

	public Integer getDepid() {
		return depid;
	}

	public void setDepid(Integer depid) {
		this.depid = depid;
	}

	public Integer getEmpid() {
		return empid;
	}

	public void setEmpid(Integer empid) {
		this.empid = empid;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getbirthdate() {
		return birthdate;
	}

	public void setbirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getJobid() {
		return jobid;
	}

	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
