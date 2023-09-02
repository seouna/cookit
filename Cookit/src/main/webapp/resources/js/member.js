
// 다음 주소 API
window.onload = function(){
	
    $(".btnAddress").on("click",function(){
        new daum.Postcode({
            oncomplete: function(data) { 
                document.getElementById("member_address").value = data.address; // 주소 넣기
                document.querySelector("#member_address_detail").focus(); //상세입력 포커싱
            }
        }).open();
    });
}




$(document).ready(function() {

	$(".joinform").submit(function() {	
		$(".btn_login").on("click", function() {
		})
	});
	let idStatus = false;
	let passwdStatus = false;
	let passwd2Status = false;
	let nameStatus = false;
	let phoneMaxLength = 13;
	
	$(".joinform").submit(function() {
		
		 if(!idStatus) {
			alert("아이디를 확인하세요");
			$("#member_id").focus();
			return false;
		}else if(!nameStatus) {
			alert("이름을 확인하세요");
			$("#member_name").focus();
			return false;
		} else if(!passwdStatus) {
			alert("비밀번호를 확인하세요");
			$("#memeber_pw").focus();
			return false;
		} else if(!passwd2Status) {
			alert("비밀번호확인을 확인하세요");
			$("#member_pw2").focus();
			return false;
		} else if($("#member_address1").val() == "") {
			alert("주소를 입력하세요");
			$("#member_address1").focus();
			return false;
		} else if($("#member_address2").val() == "") {
			alert("상세주소를 입력하세요");
			$("#member_address2").focus();
			return false;
		} else if($("#member_bday").val().length != babyMaxLength) {
			alert("생일을 확인해주세요");
			$("#member_bday").focus();
			return false;
		} else if($("#member_tel").val().length != phoneMaxLength) {
			alert("휴대폰 번호를 확인해주세요");
			$("#member_tel").focus();
			return false;
		}
		return true;
	});
	



	//생일
	for (var i = 2021; i > 1920; i--) {
		$('#birth-year').append('<option value="' + i + '">' + i + ' 년</option>');
	}
	for (var i = 1; i < 13; i++) {
		$('#birth-month').append('<option value="' + i + '">' + i + ' 월</option>');
	}
	for (var i = 1; i < 32; i++) {
		$('#birth-day').append('<option value="' + i + '">' + i + ' 일</option>');
	}

	//아이디 체크

	// 	let passwd2Status = false;

	$(".btnDup").on("click", function() {
		let id = $("#id").val();

		if (id == "") {
			idStatus = false;
			$("#checkIdResult").html("아이디는 필수 입력 항목입니다.").css("color", "red");
			return;
		} else {
			//(영문자, 숫자, 특수문자 조합 4 ~ 8글자)
			let regex = /^[A-Za-z0-9!@#$%]{4,12}$/;

			if (!regex.exec(id)) {
				$("#checkIdResult").html("영문자, 숫자, 특수문자 조합 4~12글자에 맞춰 입력해주세요!").css("color", "red");
				idStatus = false;
			} else {
				$.ajax({
					url: "MemberCheckDupId",
					data: {
						id: $("#id").val()
					},
					success: function(result) {
						if (result) {
							$("#checkIdResult").html("이미 사용중인 아이디입니다.").css("color", "red");
							idStatus = false;
						} else {
							$("#checkIdResult").html("사용 가능한 아이디입니다.").css("color", "green");
							idStatus = true;
						}
					}
				})
			}
		}
	})

	//이름 체크

	$("#name").on("change", function() {
		let name = $("#name").val();

		let regex = /^[가-힣]{2,5}$/;

		if (!regex.exec(name)) {
			$("#checkNameResult").html("한글 2 ~ 5자를 입력하세요.").css("color", "red");
			$("#name").select();
			nameStatus = false;
		} else {
			$("#checkNameResult").html("").css("color", "green");
			nameStatus = true;
		}

	})



	// 비밀번호 검증
	$("#passwd").on("change", function() {
		let passwd = $("#passwd").val();
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		// 2) 부분 검사 규칙(단, 시작(^) 과 끝($) 을 기술하면 안된다!)
		let engUpperRegex = /[A-Z]/; // 영문 대문자
		let engLowerRegex = /[a-z]/; // 영문 소문자
		let numberRegex = /[0-9]/; // 숫자
		let specRegex = /[!@#$%]/; // 특수문자

		if (!lengthRegex.exec(passwd)) {
			$("#checkPasswdResult").html("영문자, 숫자, 특수문자 8 ~ 16자 필수").css("color", "red");
			$("#member_pw").select();
			passwdStatus = false;
		} else {
			// 패스워드 복잡도(부분 검사) 체크를 위해 항목 갯수 카운팅 할 변수 선언
			let count = 0;

			// 항목별 검사 후 항목이 일치하는 문자가 있으면 카운트 증가(각각 별도로 비교)
			if (engUpperRegex.exec(passwd)) { count++ }
			if (engLowerRegex.exec(passwd)) { count++ }
			if (numberRegex.exec(passwd)) { count++ }
			if (specRegex.exec(passwd)) { count++ }
			// 카운팅 된 결과값 판별
			// => 4점 : 안전, 3점 : 보통, 2점 : 위험, 1점 이하 : 사용 불가능한 패스워드
			switch (count) {
				case 4:
					$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
					passwdStatus = true;
					break;
				case 3:
					$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
					passwdStatus = true;
					break;
				case 2:
					$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
					passwdStatus = true;
					break;
				case 1:
				case 0:
					$("#checkPasswdResult").html("사용 불가능한 패스워드").css("color", "red"); break;
					passwdStatus = false;

			}

		}

	});

	// 비밀번호 일치확인
	$("#passwd2").on("change", function() {
		if ($("#passwd").val() == $("#passwd2").val()) {
			$("#checkPasswd2Result").html("비밀번호 일치").css("color", "green");
			passwd2Status = true;
		} else {
			$("#checkPasswd2Result").html("비밀번호 불일치").css("color", "red");
			passwd2Status = false;
		}
	});


	// 폰번호 변환
	////01067675757 => 010-6767-5757
	$(".member_tel").on("change", function() {
		var inputValue = $(this).val();
		var formattedValue = inputValue.replace(/\D/g, '').slice(0, 11);
		var formattedNumber = formattedValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		$(this).val(formattedNumber);

	});

	//문자인증
	let code2;
	$(".btnSend").on("click", function() {
		let phone = $(".member_tel").val();
		alert(phone);
		if (phone != "") {
			$.ajax({
				type: "GET",
				url: "phoneCheck?phone=" + phone,
				cache: false,
				success: function(data) {
					$("#auth-cont").css("display", "contents");
					$("#phoneCheck2").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
					$("#phoneCheck2").css("color", "green");
					$("#member_tel").attr("readonly", true);
					code2 = data;
				}
			});
		} else {
			alert("휴대폰 번호를 입력해 주세요");
		}
	})


	//휴대폰 인증번호 대조
	$(".btnAuth").click(function() {
		alert("code2" + code2);
		if (code2 == "") {
			alert("인증 요청을 진행해주세요.");
			return false;
		}
		if ($(".member_tel2").val() == code2) {
			$(".btnAuth").remove();
			$(".member_tel2").after("<span class='authSuccess'>인증성공</span>");
			$("#phoneCheck2").remove();
			$(".member_tel2").css("margin-right", "5px");
			$("#phoneDoubleChk").val("true");
//			$(".member_tel").attr("disabled", true);
			$(".member_tel2").attr("disabled", true);
		} else {
			$("#phoneCheck2").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$("#phoneCheck2").css("color", "red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus", true);
		}
	});

});
