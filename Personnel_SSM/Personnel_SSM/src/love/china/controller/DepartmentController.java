package love.china.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import love.china.bean.Department;
import love.china.bean.Employee;
import love.china.service.DepartmentService;
import love.china.service.EmployeeService;

@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/getDeps")
	public String getDeps(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model) {
		PageHelper.startPage(pn, 6);
		List<Department> deps = departmentService.getDeps();
		PageInfo<Department> deppageInfo=new PageInfo<Department>(deps);
		model.addAttribute("deppageInfo", deppageInfo);
		return "deps";
	}
	
	
	//转到更新部门的界面
	@RequestMapping("/dep_updatepage/{depid}")
	public String toupdate(@PathVariable("depid")Integer depid,Model model) {
		Department dep=departmentService.getDepById(depid);
		model.addAttribute("dep",dep);
		return "depupdate";
	}
	
	//更新部门信息
	@RequestMapping(value = "Dep",method = RequestMethod.PUT)
	public String updateDep(Department department) {
		System.out.println(department);
		int updateEmp=departmentService.updateDep(department);
		return "redirect:/getDeps";
	}
	
	//转到添加部门的界面
	@RequestMapping(value = "depadd")
	public String toadd() {
		return "depadd";
	}
	
	@RequestMapping(value = "Dep",method = RequestMethod.POST)
	public String addDep(Department department) {
		int addemp=departmentService.addDep(department);
		return "redirect:/getDeps";
	}
	
	@RequestMapping(value = "Dep/{depid}",method = RequestMethod.DELETE)
	public String deleteDep(@PathVariable("depid")Integer depid) {
		int deleteemp=departmentService.deleteDep(depid);
		return "redirect:/getDeps";
	}
	
	//通过部门ID查询该部门的所有员工
	@ResponseBody
	@RequestMapping(value = "getEmpsByDepID")
	public List<Employee> getEmpsByDepId(@RequestParam("depid")Integer depid) {
		List<Employee> emps=employeeService.getEmpsByDepId(depid);
		for (Employee employee : emps) {
			System.out.println(employee);
		}
		return emps;
	}
	
	
}
