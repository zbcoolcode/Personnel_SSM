$(function() {
	$("#id").blur(checkid);
	$("#password").blur(checkpassword);
	
	$("#login_form").submit(function() {
		if(checkid() && checkpassword())
			return true;
		else
			return false;
	});
})
	function checkid() {
		var $id = $("#id");
		var $errorTips = $("#id_errorTips");
		$errorTips.html("");
	
		if($id.val() == "") {
			$errorTips.html("账号不能为空！");
			return false;
		}
		//用户名正则，4到16位（字母，数字，下划线，减号）
   		 var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
    	if(!uPattern.test($id.val())) {
        $errorTips.html("用户id格式不正确,6位数！");
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
		