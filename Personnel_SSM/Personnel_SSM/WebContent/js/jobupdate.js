$(function() {
			$("#job_id").blur(checkid);
			$("#job_name").blur(checkname);
			$("#job_salary").blur(checksalary);
			
			$("#job_form").submit(function() {
				if(checkid() && checkname()&& checksalary())
					return true;
				else
					return false;
			});
			})
			function checkid() {
				var $job_id = $("#job_id");
				var $errorTips = $("#id_errorTips");
				$errorTips.html("");
			
				if($job_id.val() == "") {
					$errorTips.html("岗位编号不能为空！");
					return false;
				}
				return true;
				}
			 
				function checkname() {
					var $job_name = $("#job_name");
					var $errorTips = $("#name_errorTips");
					$errorTips.html("");
				
					if($job_name.val() == "") {
						$errorTips.html("岗位名称不能为空！");
						return false;
					}
				
					return true;
				}
				function checksalary() {
					var $salary = $("#job_salary");
					var $errorTips = $("#salary_errorTips");
					$errorTips.html("");
				
					if($salary.val() == "") {
						$errorTips.html("岗位薪资不能为空！");
						return false;
					}
				
					return true;
				}