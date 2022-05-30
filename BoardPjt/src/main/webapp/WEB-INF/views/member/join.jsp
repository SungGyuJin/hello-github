<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
</head>
<body>


<div class="wrapper">
		<form id="join_form" method="post">
		<div class="wrap">
						<div class="subjecet">
								<span>회원가입</span>
						</div>
						<div class="id_wrap">
								<div class="id_name">아이디</div>
								<div class="id_input_box">
										<input class="id_input" name="memberId" />
								</div>
								<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
								<span class="id_input_re_2">아이디가 이미 존재합니다</span>
						</div>
						<div class="pw_wrap">
								<div class="pw_name">비밀번호</div>
								<div class="pw_input_box">
										<input class="pw_input" name="memberPw" />
								</div>
						</div>
						<div class="pwck_wrap">
								<div class="pwck_name">비밀번호 확인</div>
								<div class="pwck_input_box">
										<input class="pwck_input" />
								</div>
						</div>
						<div class="user_wrap">
								<div class="user_name">이름</div>
								<div class="user_input_box">
										<input class="user_input" name="memberName" />
								</div>
						</div>
						<div class="mail_wrap">
								<div class="mail_name">이메일</div>
								<div class="mail_input_box">
										<input class="mail_input" name="memberMail" />
								</div>
								<div class="mail_check_wrap">
										<div class="mail_check_input_box" id="mail_check_input_box_false">
												<input class="mail_check_input" disabled="disabled" />
										</div>
										<div class="mail_check_button">
												<span>인증번호 전송</span>
										</div>
										<div class="clearfix"></div>
										<span id="mail_check_input_box_warn"></span>
								</div>
						</div>
						<div class="address_wrap">
								<div class="address_name">주소</div>
								<div class="address_input_1_wrap">
										<div class="address_input_1_box">
												<input class="address_input_1" name="memberAddr1" disabled="disabled"/>
										</div>
										<div class="address_button" onClick="execution_daum_address()">
												<span>주소 찾기</span>
										</div>
										<div class="clearfix"></div>
								</div>
								<div class="address_input_2_wrap">
										<div class="address_input_2_box">
												<input class="address_input_2" name="memberAddr2" disabled="disabled"/>
										</div>
								</div>
								<div class="address_input_3_wrap">
										<div class="address_input_3_box">
												<input class="address_input_3" name="memberAddr3" disabled="disabled"/>
										</div>
								</div>
						</div>
						<div class="join_button_wrap">
								<input type="button" class="join_button" value="가입하기" />
						</div>
		</div>
		</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	var code = ""; // 이메일전송 인증번호 저장코드

	$(document).ready(function(){
		
		$(".join_button").click(function(){
			
				$("#join_form").attr("action", "/member/join");
				$("#join_form").submit();
		});
	});
	
	// 아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){
		
		// console.log("keyup 테스트");
		
		var memberId = $('.id_input').val();   	// .id_input에 입력되는 값
		var data = {memberId : memberId};       // controller에 넘길 데이터 이름 : 데이터(.id_input에 입력 되는 값)
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				
				// console.log("성공여부 : " + result);
				
				if(result != 'fail'){
					
					$('.id_input_re_1').css("display", "inline-block");
					$('.id_input_re_2').css("display", "none");
					 
				}else{
					
					$('.id_input_re_2').css("display", "inline-block");
					$('.id_input_re_1').css("display", "none");
					code = data;
					
				}
				
			}// success 종료
			
		});// 에이작스 종료
		
	});
	
	$(".mail_check_button").click(function(){
		
		var email = $(".mail_input").val(); 		// 입력메일
		var checkBox = $(".mail_check_input");		// 인증번호 입력한
		var boxWrap = $(".mail_check_input_box"); 	// 인증번호 입력란 박스
		
		$.ajax({
			
			type: "GET",
			url: "mailCheck?email=" + email,
			success: function(data){
				
				// console.log("data : " + data);
				checkBox.attr("disabled",false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;
			}
		});
	});
	
	// 인증번호 비교
	$(".mail_check_input").blur(function(){
		
		var inputCode = $(".mail_check_input").val(); 		// 입력코드
		var checkResult = $("#mail_check_input_box_warn");  // 비교 결과
							  
		if(inputCode == code){  							// 일치하는 경우
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
			console.log("일치.");
		}else{												// 일치하지 않는 경우
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class", "incorrect");
			console.log("불일치.");
		}
		
	});
	
	// 다음 주소 연동
	function execution_daum_address(){
		
		new daum.Postcode({
			
			oncomplete: function(data){
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
				
				var addr = ''; 		// 주소 변수
				var extraAddr = ''; // 참고항복 변수
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if(data.userSelectedType === 'R'){
					addr = data.roadAddress;
				}else{
					addr = data.jibunAddress;
				}
				
				// 사용자가 선택한 주소
				if(data.userSelectedType === 'R'){
					
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					
					document.getElementById("sample6_extraAddress").value = extraAddr;
					
				}else{
					document.getElementById("sample6_extraAddress").value = '';
				}
				
				// 우편번호와 주소 정보를 해당 필드에 넣기
				document.getElementById("sample6_postcode").value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				
				// 커서를 상세주소 필드로 이동
				ddocument.getElementById("sample6_detailAddress").focus();
				
			}
			
		}).open();
	}
	
	
	
	
	
	
	
</script>
</body>
</html>