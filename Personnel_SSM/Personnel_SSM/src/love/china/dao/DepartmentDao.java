package love.china.dao;

import java.util.List;

import love.china.bean.Department;

public interface DepartmentDao {
	
	//查询所有部门
	public List<Department> getDeps();
	
	//修改部门信息
	public int updateDep(Department department);

	//通过部门ID查询部门信息
	public Department getDepById(Integer depid);

	//添加部门
	public int addDep(Department department);

	//删除部门
	public int deleteDep(Integer depid);

}
