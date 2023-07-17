/*
 * 회원가입
 */
function joinForm(){
	let name = document.getElementById("name");
	let id = document.getElementById("id");
	let pass = document.getElementById("pass");
	let cpass = document.getElementById("cpass");
	let email1 = document.getElementById("email1");
	let email2 = document.getElementById("email2");
	let email3 = document.getElementById("email3");
	let car1 = document.getElementById("car1");
	let car2 = document.getElementById("car2");
	let phone1 = document.getElementById("phone1");
	let phone2 = document.getElementById("phone2");
	let phone3 = document.getElementById("phone3");
	
	if (name.value == ""){
		alert("이름을 입력해주시겠습니GGA?");
		name.focus();
		return false;
	} else if (id.value == ""){
		alert("아이디를 입력해주시겠습니GGA?");
		id.focus();
		return false;
	} else if (pass.value == ""){
		alert("비밀번호를 입력해주시겠습니GGA?")
		pass.focus();
		return false;
	} else if (cpass.value == ""){
		alert("비밀번호 확인을 입력해주시겠습니GGA?")
		cpass.focus();
		return false;
	} else if (checkCount('gender').value == 0){
		alert("성별을 체크해주시겠습니GGA?")
		return false;
	} else if (email1.value == ""){
		alert("이메일을 입력해주시겠습니GGA?")
		email1.focus();
		return false;
	} else if (email2.value == ""){
		alert("이메일 주소를 선택해주시겠습니GGA?")
		email3.focus();
		return false;
	} else if (car1.value == ""){
		alert("차량번호를 입력해주시겠습니GGA?")
		car1.focus();
		return false;
	} else if (car2.value == ""){
		alert("차량번호를 입력해주시겠습니GGA?")
		car2.focus();
		return false;
	} else if (checkCount("tel").value == 0){
		alert("통신사를 선택해주시겠습니GGA?")
		return false;
	} else if (phone1.value == ""){
		alert("번호를 선택해주시겠습니GGA?")
		phone1.focus();
		return false;
	} else if (phone2.value == ""){
		alert("번호를 입력해주시겠습니GGA?")
		phone2.focus();
		return false;
	} else if (phone3.value == ""){
		alert("번호를 입력해주시겠습니GGA?")
		phone3.focus();
		return false;
	} else if (checkCount("genre").value == 0 || checkCount("genre").value <= 4){
		alert("선호 영화를 선택해주시겠습니GGA? (3개까지 선택 가능)")
		return false;
	} else{
		// 서버 전송
		joinForm.submit();
	}
}

function checkCount(tagName){
	const tagList = document.getElementsByName(tagName);
	let count = 0;
	for(element of tagList){
		if(element.checked) count++;
	}
	return count;
}

/*
 * 회원가입 - 비밀번호 확인
 */
function passCheck(){
	let pass = document.getElementById("pass");
	let cpass = document.getElementById("cpass");
	let cmsg = document.getElementById("cmsg");
	
	// pass = cpass
	if (pass.value != ""){
		if (cpass.value != ""){
			if (pass.value == cpass.value){
				cmsg.innerHTML = "비밀번호가 일치합니다.";
				cmsg.style.color = "blue";
				cmsg.style.display = "block";
				cmsg.style.fontSize = "11px";
			} else{
				cmsg.innerHTML = "비밀번호가 일치하지 않습니다.";
				cmsg.style.color = "red";
				cmsg.style.display = "block";
				cmsg.style.fontSize = "11px";
				pass.value = "";
				cpass.value = "";
				pass.focus();
			}
		}
	}
}

/*
 * 회원가입 - 이메일
 */
function emailCheck(){
	let email2 = document.getElementById("email2");
	let email3 = document.getElementById("email3");
	
	if (email2.value = "" && email3.value == "default"){
		alert("이메일 주소를 선택하거나 입력해주세요.");
		email3.focus();
	} else{
		email2.value = email3.value;
	}
}

/*
 * 로그인
 */
function loginCheck(){
	let id = document.getElementById("id");
	let pass = document.getElementById("pass");
	
	if (id.value == ""){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	} else if (pass.value == ""){
		alert("비밀번호를 입력해주세요.");
		pass.focus();
		return false;
	} else{
		loginForm.submit();
	}
}


