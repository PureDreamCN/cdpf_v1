<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>${webTitle}</title>
<%@ include file="common/styles.jspf"%>
<link rel="stylesheet"
	href="${staticServer}/assets/common/css/login.min.css?versionNo=${versionNo}" />
</head>
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo"></div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="login-form" id="loginForm" action="" method="post">
			<h3 class="form-title">${webTitle}—登录</h3>
			<div class="alert alert-danger display-hide" id="loginAlert">
				<button class="close" data-close="alert"></button>
				<i class="fa-lg fa fa-warning"></i> <span id="lblMessage">
					账号或密码输入错误！ </span>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">账号</label>
				<div class="input-icon">
					<i class="fa fa-user"></i> <input
						class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="账号" name="username" id="username" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i> <input
						class="form-control placeholder-no-fix" type="password"
						autocomplete="off" placeholder="密码" name="password" id="password" />
				</div>
			</div>
			<div id="authCodeModel" class="form-group" style="display: none">
				<div class="col-md-12" style="margin-left: -15px;">
					<div class="input-icon" style="float: left;">
						<i class="fa fa-key"></i> <input style="width: 130px;" type="text"
							id="authCode" maxlength="4" name="authCode" class="form-control"
							placeholder="请输入验证码" />
					</div>
					<span style="float: left; margin-top: 4px; margin-left: 5px;">
						<img id="imgTip" />
					</span> <span style="float: right; margin-top: 2px;"> <img id="img"
						src="${dynamicServer}/authImage.htm?para=1" onclick="changeImg()"
						style="width: 100px;" />
					</span>
				</div>
			</div>
			<div class="form-actions">
				<label class="rememberme mt-checkbox mt-checkbox-outline"> <input
					type="checkbox" name="remember" value="1" id="chk" /> 记住我 <span></span>
				</label>
				<button type="submit" class="btn blue pull-right">登录</button>
			</div>
			<div class="forget-password">
				<p>
					版权所有@中铁信弘远技术研发中心 <a href="javascript:;" id="forget-password"> </a>
				</p>
			</div>
		</form>

		<!-- END LOGIN FORM -->
	</div>
</body>
<%@ include file="common/scripts.jspf"%>
<script type="text/javascript">
	$(function() {
		$('#username').bind('keypress', function(event) {
			if (event.keyCode == 13) {
				$("#loginForm").submit();
			}
		});
		$('#password').bind('keypress', function(event) {
			if (event.keyCode == 13) {
				$("#loginForm").submit();
			}
		});

		$("#loginForm").validate({
			errorElement : "label",
			errorClass : "valiError",
			errorPlacement : function(error, element) {
			},
			rules : {
				username : {
					required : true
				},
				password : {
					required : true
				},
				authCode : {
					required : true,
					remote : {
						type : "post",
						url : "${dynamicServer}/authPicCode.htm",
						data : {
							authCode : function() {
								return $('#authCode').val();
							}
						},
						dataType : "text",
						dataFilter : function(data) {
							if (data == 1) {
								$("#loginAlert").hide();
								$("#imgTip").attr("src", "${dynamicServer}/assets/common/images/right.png");
								return true;
							} else {
								$("#lblMessage").html("验证码输入错误！");
								$("#imgTip").attr("src", "${dynamicServer}/assets/common/images/error.png");
								$("#loginAlert").show();
								return false;
							}
						}
					}
				}
			},
			messages : {
				username : {
					required : ""
				},
				password : {
					required : ""
				}
			},
			submitHandler : function(form) {
				checkLogin();
			}
		});

		var cookie_chk = Cookies.get('critc_chk');
		if (cookie_chk != '' && cookie_chk != null && cookie_chk == '1') {
			$('#chk').prop("checked", true);
			$('#username').val(Cookies.get('critc_username'));
		}
	});

	function checkLogin() {
		if ($('#chk').is(':checked')) {
			Cookies.set('critc_chk', '1', {
				expires : 10,
				path : '/'
			});
			Cookies.set('critc_username', $('#username').val(), {
				expires : 10,
				path : '/'
			});
		} else {
			Cookies.set('critc_chk', '0', {
				expires : 10,
				path : '/'
			});
		}

		var username = $("#username").val();
		var password = $("#password").val();
		$.ajax({
			type : "post",
			url : "${dynamicServer}/checkLogin.htm",
			data : {
				username : username,
				password : password,
				terminal : getUserTerminalType(),
				explorerType : getExplorerInfo().browser,
				explorerVersion : getExplorerInfo().version
			},
			dataType : "json",
			success : function(data) {
				if (data.msgText == 2 || data.msgText == 1) {
					if (data.msgText == 2) {
						$("#authCodeModel").css("display", "block");
						$("#lblMessage").html("账户名或密码错误，请输入验证码！");
						$("#loginAlert").show();
						changeImg();
						$('#authCode').val("");
					}
					if (data.msgText == 1) {
						$("#lblMessage").html("您输入错误的次数过多，请10分钟后再尝试登陆！");
						$("#loginAlert").show();
						changeImg();
						$('#authCode').val("");
						$("#imgTip").attr("src", "");
					}
				} else {
					if (data.success) {
						$("#loginAlert").hide();
						window.location.href = "${dynamicServer}/index.htm";
					} else {
						$("#lblMessage").html(data.msgText);
						$("#loginAlert").show();
						changeImg();
					}
				}
			},
			error : function(data) {
				$("#lblMessage").html('登录失败');
				$("#loginAlert").show();
			}
		});
	}

	function changeImg() {
		var img = document.getElementById("img");
		img.src = "${dynamicServer}/authImage.htm?para=1&date=" + new Date();
	}
</script>
</html>