
$(function() {
	$("#department_id").blur(checkdepartment_id);
	$("#employee_id").blur(checkemployee_id);
	$("#name").blur(checkname);

	$("#native_place").blur(checknative_place);
	$("#address").blur(checkdetailed_address);

	$("#phone").blur(check_phone);
	$("#job_id").blur(checkjob_id);
	$("#salary").blur(checksalary);
	$("#password").blur(checkpassword);

	$("#employeeadd").submit(
			function() {
				if (checkdepartment_id() && checkemployee_id() && checkname()
						&& checkid_phone() && check_address() && checkjob_id()
						&& checksalary() && checkpassword())
					return true;
				else
					return false;
			});
})

function checkdepartment_id() {
	var $id = $("#department_id");
	var $errorTips = $("#id_errorTips");
	$errorTips.html("");

	if ($id.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}
	return true;
}

function checkemployee_id() {
	var $eid = $("#employee_id");
	var $errorTips = $("#eid_errorTips");
	$errorTips.html("");

	if ($eid.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}
	return true;
}

function checkname() {
	var $name = $("#name");
	var $errorTips = $("#name_errorTips");
	$errorTips.html("");

	if ($name.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}

	return true;
}

function checkdetailed_address() {
	var $detailed_address = $("#detailed_address");
	var $errorTips = $("#d_errorTips");
	$errorTips.html("");

	if ($detailed_address.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}

	return true;
}

function checknation() {
	var $nation = $("#nation");
	var $errorTips = $("#nation_errorTips");
	$errorTips.html("");

	if ($nation.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}

	return true;
}
function checkphone() {
	var $phone_number = $("#phone_number");
	var $errorTips = $("#p_errorTips");
	$errorTips.html("");

	if ($phone_number.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}
	var mPattern = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
	if (!mPattern.test($phone_number.val())) {
		$errorTips.html("格式不正确！");
		return false;
	}

	return true;
}
function checkjob_id() {
	var $job_id = $("#job_id");
	var $errorTips = $("#j_errorTips");
	$errorTips.html("");

	if ($job_id.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}

	return true;
}

function checksalary() {
	var $salary = $("#salary");
	var $errorTips = $("#salary_errorTips");
	$errorTips.html("");

	if ($salary.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}

	return true;
}
function checkpassword() {
	var $password = $("#password");
	var $errorTips = $("#password_errorTips");
	$errorTips.html("");

	if ($password.val() == "") {
		$errorTips.html("不能为空！");
		return false;
	}

	return true;
}

