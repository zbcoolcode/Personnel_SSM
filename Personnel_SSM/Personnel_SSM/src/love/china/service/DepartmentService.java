package love.china.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import love.china.bean.Department;
import love.china.dao.DepartmentDao;
import love.china.dao.EmployeeDao;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private EmployeeDao employeeDao;
	
	public List<Department> getDeps(){
		List<Department> deps = departmentDao.getDeps();
		return deps;
	}

	public int updateDep(Department department) {
		return departmentDao.updateDep(department);
	}

	public Department getDepById(Integer depid) {
		return departmentDao.getDepById(depid);
	}

	public int addDep(Department department) {
		return departmentDao.addDep(department);
	}

	public int deleteDep(Integer depid) {
		employeeDao.deleteEmpsByDepId(depid);
		return departmentDao.deleteDep(depid);
	}
}
