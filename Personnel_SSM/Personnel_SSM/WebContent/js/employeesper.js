$(function() {
			
			
			$("#detailed_address").blur(checkdetailed_address);
		
			$("#speciality").blur(checkspeciality);
			
			$("#phone_number").blur(checkphone_number);
			
			$("#password").blur(checkpassword);
			
		$("#employeesper").submit(function() {
				if(	checkdetailed_address() && checkspeciality()&& checkphone_number()&& checkpassword())
				 	return true;
				else
					return false;
			});
			})

			
			
			
				function checkdetailed_address() {
							var $detailed_address = $("#detailed_address");
							var $errorTips = $("#d_errorTips");
							$errorTips.html("");
						
							if($detailed_address.val() == "") {
								$errorTips.html("详细地址不能为空！");
								return false;
							}
						
							return true;
						}
				
				
				function checkspeciality() {
							var $speciality= $("#speciality");
							var $errorTips = $("#speciality_errorTips");
							$errorTips.html("");
						
							if($speciality.val() == "") {
								$errorTips.html("所学专业不能为空！");
								return false;
							}
						
							return true;
						}
			
				function checkphone_number() {
							var $phone_number= $("#phone_number");
							var $errorTips = $("#p_errorTips");
							$errorTips.html("");
						
							if($phone_number.val() == "") {
								$errorTips.html("联系电话不能为空！");
								return false;
							}
							var mPattern = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
								if(!mPattern.test($phone_number.val())) {
								$errorTips.html("手机号格式不正确！");
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