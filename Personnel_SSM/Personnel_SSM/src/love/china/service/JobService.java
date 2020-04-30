package love.china.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import love.china.bean.Job;
import love.china.dao.JobDao;

@Service
public class JobService {
	
	@Autowired
	private JobDao jobDao;

	public List<Job> getJobs() {
		return jobDao.getJobs();
	}
	
	

}
