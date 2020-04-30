package love.china.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import love.china.bean.Department;
import love.china.bean.Employee;
import love.china.bean.Job;
import love.china.service.DepartmentService;
import love.china.service.EmployeeService;
import love.china.service.JobService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private JobService JobService;

	@RequestMapping("/getEmps")
	public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model) {
		PageHelper.startPage(pn, 10);
		List<Employee> emps = employeeService.getEmps();
		PageInfo<Employee> emppageInfo=new PageInfo<Employee>(emps);
		model.addAttribute("emppageInfo", emppageInfo);
		return "emps";
	}

	// 跳转到更新页面，先要查询到所要更新的员工的信息
	@RequestMapping("/emp_updatepage/{empid}")
	public String updatepage(@PathVariable("empid") Integer empid, Model model) {
		System.out.println(empid);
		Employee emp = employeeService.getEmpById(empid);
		System.out.println(emp);
		model.addAttribute("emp", emp);
//		return "forward:/emp.jsp";
		return "empupdate";
	}

	
	 @RequestMapping(value = "/Emp",method = RequestMethod.PUT) 
	 public String updateEmps(Employee employee) {
		 System.out.println(employee);
		 int emps = employeeService.updateEmp(employee);
		 return "redirect:/getEmps";
	 }
	 
	 @RequestMapping(value = "/Emp/{empid}",method = RequestMethod.DELETE) 
	 public String deleteEmp(@PathVariable("empid")Integer empid) {
		 int deleteEmp = employeeService.deleteEmp(empid);
		 if(deleteEmp>0) {
			 System.out.println("删除"+empid+"号员工成功");
		 }else {
			 System.out.println("删除"+empid+"号员工失败");
		 }
		 return "redirect:/getEmps";
	 }
	 
	 @RequestMapping(value = "/empadd") 
	 public String addpage(Model model) {
		 List<Department> deps = departmentService.getDeps();
		 List<Job> jobs=JobService.getJobs();
		 model.addAttribute("deps", deps);
		 model.addAttribute("jobs", jobs);
		 return "empadd";
	 }
	 
	 @RequestMapping(value = "/emp",method = RequestMethod.POST) 
	 public String deleteEmp(Employee employee) {
		int addemp=employeeService.addEmp(employee);
		 return "redirect:/getEmps";
	 }
	 
	 //添加员工时判断empid是否存在
	 @ResponseBody
	 @RequestMapping(value="/islegal",method = RequestMethod.POST)
	 public Map<String, Object> empid_legal(Integer empid) {
		 int count = employeeService.idLegal(empid);
		 boolean isExist=(count>0?true:false);
		 if(isExist) {
			 System.out.println(empid+"号员工已经存在");
		 }else {
			 System.out.println(empid+"可以作为员工号");
		 }
		 Map<String, Object> resultMap=new HashMap<String, Object>();
		 resultMap.put("isExist", isExist);
		 return resultMap;
	 }
	 
	 //通过员工ID得到员工
	 @ResponseBody
	 @RequestMapping("getEmpById")
	 public Employee getEmpById(Integer empid) {
		 Employee empById = employeeService.getEmpById(empid);
		 System.out.println(empById);
		 return empById;
	 }
}
