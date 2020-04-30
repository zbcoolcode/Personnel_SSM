$(function() {
			$("#employee_id").blur(checkid);
			$("#password").blur(checkpassword);
			
			$("#login_form").submit(function() {
				if(checkid() && checkpassword())
					return true;
				else
					return false;
			});
			})
			function checkid() {
				var $id = $("#employee_id");
				var $errorTips = $("#id_errorTips");
				$errorTips.html("");
			
				if($id.val() == "") {
					$errorTips.html("工号不能为空！");
					return false;
				}
				return true;
				}
			 
				function checkpassword() {
					var $password = $("#password");
					var $errorTips = $("#password_errorTips");
					$errorTips.html("");
				
					if($password.val() == "") {
						$errorTips.html("密码不能为空！");
						return false;
					}
				
					return true;
				}
		