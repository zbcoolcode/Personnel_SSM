package love.china.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import love.china.bean.Employee;
import love.china.dao.EmployeeDao;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;
	
	public List<Employee> getEmps(){
		return employeeDao.getEmps();
	}
	
	public int updateEmp(Employee employee){
		return employeeDao.updateEmp(employee);
	}
	
	public Employee getEmpById(Integer empid){
		return employeeDao.getEmpById(empid);
	}

	public int deleteEmp(Integer empid) {
		return employeeDao.deleteEmp(empid);
	}

	public int addEmp(Employee employee) {
		return employeeDao.addEmp(employee);
	}

	public int idLegal(Integer empid) {
		Employee emp = employeeDao.getEmpById(empid);
		if(emp!=null) {
			return 1;
		}else {
			return 0;
		}
		
	}

	public List<Employee> getEmpsByDepId(Integer depid) {
		// TODO Auto-generated method stub
		return employeeDao.getEmpsByDepId(depid);
	}
}

