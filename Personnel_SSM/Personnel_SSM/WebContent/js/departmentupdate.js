$(function() {
			$("#department_id").blur(checkid);
			$("#department_name").blur(checkname);
			$("#department_manager").blur(checkmanager);
			$("#department_address").blur(checkaddress);
			
			$("#department_form").submit(function() {
				if(checkid() && checkname()&&checkmanager() &&checkaddress())
					return true;
				else
					return false;
			});
			})
			function checkid() {
				var $id = $("#department_id");
				var $errorTips = $("#id_errorTips");
				$errorTips.html("");
			
				if($id.val() == "") {
					$errorTips.html("部门编号不能为空！");
					return false;
				}
				return true;
				}
			 
			function checkname() {
					var $department_name = $("#department_name");
					var $errorTips = $("#name_errorTips");
					$errorTips.html("");
				
					if($department_name.val() == "") {
						$errorTips.html("部门名称不能为空！");
						return false;
					}
				
					return true;
				}
				function checkmanager() {
							var $department_manager = $("#department_manager");
							var $errorTips = $("#manager_errorTips");
							$errorTips.html("");
						
							if($department_manager.val() == "") {
								$errorTips.html("部门经理不能为空！");
								return false;
							}
						
							return true;
						}
				function checkaddress() {
							var $department_address = $("#department_address");
							var $errorTips = $("#address_errorTips");
							$errorTips.html("");
						
							if($department_address.val() == "") {
								$errorTips.html("部门地址不能为空！");
								return false;
							}
						
							return true;
						}
				