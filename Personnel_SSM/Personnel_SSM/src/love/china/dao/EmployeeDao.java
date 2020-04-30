package love.china.dao;

import java.util.List;

import love.china.bean.Employee;

public interface EmployeeDao {
	
	//查询所有员工
	public List<Employee> getEmps();
	
	//修改员工信息
	public int updateEmp(Employee employee);

	//得到单个员工的信息
	public Employee getEmpById(Integer id);

	//删除单个员工
	public int deleteEmp(Integer empid);

	//添加员工
	public int addEmp(Employee employee);

	//通过部门ID查询该部门的所有员工
	public List<Employee> getEmpsByDepId(Integer depid);

	//提供部门ID输出员工
	public int deleteEmpsByDepId(Integer depid);

}
