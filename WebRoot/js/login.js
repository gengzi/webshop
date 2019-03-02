//当鼠标被放在用户名你个文本框时，给出一个提示
function usernameFocus() {
	var checkUsername = document.getElementById("checkUsername");
	checkUsername.innerHTML = "请输入用户名";
}

//当鼠标离开密码文本框时，给出一个提示
function usernameBlur() {
	var username = document.getElementById("username");
	var checkUsername = document.getElementById("checkUsername");
	var reg = /^[0-9a-zA-Z_]{3,12}$/;
	if(username.value == ""){
		checkUsername.innerHTML = "<font color='red'>用户名不能为空</font>";
		return false;
	}
	
	if(reg.test(username.value) == false){
		checkUsername.innerHTML = "<font color='red'>用户名输入格式不正确</font>";
		return false;
	}
	checkUsername.innerHTML = "";
	return true;
}

//当鼠标离开密码文本框时，给出一个提示
function passwordBlur() {
	var password = document.getElementById("password");
	var checkPassword = document.getElementById("checkPassword");
	var reg = /^[0-9a-zA-Z_]{3,12}$/;
	if(password.value == ""){
		checkPassword.innerHTML = "<font color='red'>密码不能为空</font>";
		return false;
	}
	
	if(reg.test(password.value) == false){
		checkPassword.innerHTML = "<font color='red'>密码输入格式不正确</font>";
		return false;
	}
	checkPassword.innerHTML = "";
	return true;
}


//表单提交检验各个字段是是否合法
function checkForm() {
	var flagUsername = usernameBlur();
	var flagPassowrd = passwordBlur();
	
	if(flagUsername == true && flagPassword == true){
		return true;
	}else{
		return false;
	}
}