//判断用户名格式
function usernameFocus() {
	var checkUsername = document.getElementById("checkUsername");
	checkUsername.innerHTML = "<font color='#00ff00'>请输入用户名，由3-10位数字字母下划线组成</font>";
}
function usernameBlur() {
	var username = document.getElementById("username");
	var checkUsername = document.getElementById("checkUsername");
	var reg = /^[0-9a-zA-Z_]{3,12}$/;
	if (username.value == "") {
		checkUsername.innerHTML = "<font color='red'>用户名不能为空</font>";
		return false;
	}

	if (reg.test(username.value) == false) {
		checkUsername.innerHTML = "<font color='red'>用户名输入格式不正确</font>";
		return false;
	}
	checkUsername.innerHTML = "<font color='#00ff00'>用户名√</font>";
	window.location.href = "/webshop/UserServlet?method=3&username="
			+ username.value;

	return true;
}
// 判断真实用户名格式
function nameFocus() {
	var checkname = document.getElementById("checkName");
	checkname.innerHTML = "<font color='#00ff00'>请输入真实姓名（中文简体）</font>";

}
function nameBlur() {
	var name = document.getElementById("name");
	var checkName = document.getElementById("checkName");
	var reg = /^[\u4E00-\u9FA5]+$/; // 简体中文
	if (name.value == "") {
		checkName.innerHTML = "<font color='red'>姓名不能为空，中文简体</font>";
		return false;
	}

	if (reg.test(name.value) == false) {
		checkName.innerHTML = "<font color='red'>姓名输入格式不正确</font>";
		return false;
	}
	checkName.innerHTML = "<font color='#00ff00'>姓名√</font>";
	return true;
}
// 判断电话的格式
function telePhoneFocus() {
	var checkTelephone = document.getElementById("checkTelephone");
	checkTelephone.innerHTML = "<font color='#00ff00'>请输入电话(11位)</font>";

}
function telePhoneBlur() {
	var checkTelephone = document.getElementById("checkTelephone");
	var telephone = document.getElementById("telephone");
	var reg = /^1\d{10}$/; // 1 开头的电话 11 位

	if (telephone.value == "") {
		checkTelephone.innerHTML = "<font color='red'>电话不能为空</font>";
		return false;
	}

	if (reg.test(telephone.value) == false) {
		checkTelephone.innerHTML = "<font color='red'>电话输入格式不正确</font>";
		return false;
	}
	checkTelephone.innerHTML = "<font color='#00ff00'>电话√</font>";
	return true;

}

// 判断密码的格式
function passwordFocus() {
	var checkTelephone = document.getElementById("checkPassword");
	checkTelephone.innerHTML = "<font color='#00ff00'>请输入密码，由6-12位数字字母下划线组成</font>";

}
function passwordBlur() {
	var password = document.getElementById("password");
	var checkPassword = document.getElementById("checkPassword");
	var reg = /^[0-9a-zA-Z_]{6,12}$/;
	if (password.value == "") {
		checkPassword.innerHTML = "<font color='red'>密码不能为空</font>";
		return false;
	}

	if (reg.test(password.value) == false) {
		checkPassword.innerHTML = "<font color='red'>密码输入格式不正确</font>";
		return false;
	}
	checkPassword.innerHTML = "<font color='#00ff00'>密码√</font>";
	return true;
}

// 判断重复密码是否跟密码是否一样
function checkRpassword() {
	var password = document.getElementById("password");
	var Rpassword = document.getElementById("Rpassword");

	if (password.value == Rpassword.value) {
		checkRPassword.innerHTML = "<font color='#00ff00'>密码一致√</font>";
		return true;
	} else {
		checkRPassword.innerHTML = "<font color='red'>与密码不一致，请重新输入</font>";
		return false;

	}

}
//判断重复密码是否跟密码是否一样
function checkUser() {
	var testbl = document.getElementById("testbl");

	if (testbl.value == 1) {
		return false;
		
	}
	return true ;

}


// 表单提交检验各个字段是是否合法
function checkForm() {
	var flagUsername = usernameBlur();
	var flagname = nameBlur();
	var flagtelePhone = telePhoneBlur();
	var flagpassword = passwordBlur();
	var flagRpassword = checkRpassword();
	var testbl = checkUser();

	if (flagUsername == true && flagname == true && flagtelePhone == true
			&& flagpassword == true && flagRpassword == true && testbl == true) {
		return true;
	} else {
		return false;
	}
}