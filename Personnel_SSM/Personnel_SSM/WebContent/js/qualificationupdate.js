$(function() {
			$("#qualification_id").blur(checkid);
			$("#qualification_name").blur(checkname);
			$("#qualification_comment").blur(checkcomment);
			
			$("#qualification_form").submit(function() {
				if(checkid() && checkname() && checkcomment() )
					return true;
				else
					return false;
			});
			})
			function checkid() {
				var $qualification_id = $("#qualification_id");
				var $errorTips = $("#id_errorTips");
				$errorTips.html("");
			
				if($qualification_id.val() == "") {
					$errorTips.html("学历编号不能为空！");
					return false;
				}
				return true;
				}
			 
				function checkname() {
					var $qualification_name = $("#qualification_name");
					var $errorTips = $("#name_errorTips");
					$errorTips.html("");
				
					if($qualification_name.val() == "") {
						$errorTips.html("学历名称不能为空！");
						return false;
					}
				
					return true;
				}
				function checkcomment() {
					var $qualification_comment = $("#qualification_comment");
					var $errorTips = $("#comment_errorTips");
					$errorTips.html("");
				
					if($qualification_comment.val() == "") {
						$errorTips.html("学历评价不能为空！");
						return false;
					}
				
					return true;
				}
				