package love.china.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import love.china.bean.Job;
import love.china.service.JobService;

@Controller
public class JobController {
	
	@Autowired
	private JobService jobService;
	
	@RequestMapping("getJobs")
	public String getJobs(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model) {
		PageHelper.startPage(pn,8);
		List<Job> jobs = jobService.getJobs();
		PageInfo<Job> jobpageInfo = new PageInfo<Job>(jobs);
		model.addAttribute("jobpageInfo", jobpageInfo);
		return "jobs";
	}

}
