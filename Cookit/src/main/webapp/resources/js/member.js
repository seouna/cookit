$(document).ready(function(){
	setDateBox();
	idCheck();
});
function setDateBox(){
   for (var i = 2021; i > 1920; i--) {
       $('#birth-year').append('<option value="' + i + '">' + i + ' 년</option>');
   }
   for (var i = 1; i < 13; i++) {
       $('#birth-month').append('<option value="' + i + '">' + i + ' 월</option>');
   }
   for (var i = 1; i < 32; i++) {
       $('#birth-day').append('<option value="' + i + '">' + i + ' 일</option>');
   }
}

function idCheck(){
	let idStatus = false;
// 	let nameStatus = false;
// 	let passwdStatus = false;
// 	let passwd2Status = false;
	
	$(".btnDup").on("click",function(){
		let id = $("#id").val();
		
		if(id == ""){
			idStatus = false;
			$("#checkIdResult").html("아이디는 필수 입력 항목입니다.").css("color","red");
			return;
		} else {
			//(영문자, 숫자, 특수문자 조합 4 ~ 8글자)
			let regex = /^[A-Za-z0-9!@#$%]{4,12}$/;
			
			if(!regex.exec(id)){
				$("#checkIdResult").html("영문자, 숫자, 특수문자 조합 4~12글자에 맞춰 입력해주세요!").css("color","red");
				idStatus = false;
			} else {
				$.ajax({
					url: "MemberCheckDupId",
					data: {
						id: $("#id").val()
					},
					success: function(result){
						if(result){
							alert("true");
							$("#checkIdResult").html("이미 사용중인 아이디입니다.").css("color", "red");
							idStatus = false;
						} else {
							alert("false");
							$("#checkIdResult").html("사용 가능한 아이디입니다.").css("color", "green");
							idStatus = true;
						}
					}
				})
			}
		}
	})
}