<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="stylesheet" href="/resources/common.css" />
<script src="/resources/common.js" defer="defer"></script>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 구글 폰트 불러오기  -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sevillana&display=swap" rel="stylesheet">
<!-- 회원가입 폼 관련 -->
<script type="text/javascript">
	let MemberJoin__submitFormDone = false;
	function MemberJoin__submit(form) {
		if (MemberJoin__submitFormDone) {
			return;
		}
		form.JoinId.value = form.JoinId.value.trim();
		form.JoinPw.value = form.JoinId.value.trim();
		form.JoinEmail.value = form.JoinId.value.trim();
		form.JoinName.value = form.JoinId.value.trim();
		form.JoinNickName.value = form.JoinId.value.trim();
		form.JoinCellPhoneNum.value = form.JoinId.value.trim();
		if (form.JoinId.value == 0) {
			alert('아이디를 입력해주세요');
			return;
		}
		if (form.JoinPw.value == 0) {
			alert('비밀번호를 입력해주세요');
			return;
		}
		if (form.JoinEmail.value == 0) {
			alert('이메일을 입력해주세요');
			return;
		}
		if (form.JoinName.value == 0) {
			alert('이름을 입력해주세요');
			return;
		}
		if (form.JoinNickName.value == 0) {
			alert('닉네임을 입력해주세요');
			return;
		}
		if (form.JoinCellPhoneNum.value == 0) {
			alert('전화번호를 입력해주세요');
			return;
		}

		$('#fileInput').attr('name', 'file__member__' + ${currentId} + '__extra__Img__1');
		
		form.body.value = markdown;
		MemberJoin__submitFormDone = true;
		form.submit();
	};


</script>
<script>

/* 아이디 중복체크 함수 */
function JoinIdConfirm() {
	var form = document.form1;

	console.log(form.JoinPw);
	
	var JoinId = form.JoinId.value;
	

	if (JoinId == null) {
		$('.rs-msg').text('*중복확인을 위한 아이디를 입력해주세요');
		return;
	}

	$.get('./loginIdConfirm', {
		JoinId : JoinId
	}, function(data) {

		var code = data.code;

		$('.rs').text(data.rs);
		$('.rs-msg').text(data.msg);
		$('.rs-code').text(code);

	}, 'json');
}
</script>
<style>
.SlaRecipeJoinPageVer02 {
	width: 100%;
	height: 100%;
	position: relative;
	background: white;
}

.Background_img {
	width: 100%;
	height: 955px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: linear-gradient(0deg, #D9D9D9 0%, #D9D9D9 100%);
}

.HeadIcons {
	height: 55px;
	left: 1360.04px;
	top: 23px;
	position: absolute;
}

.material-symbols-outlined {
	font-size: 40px;
}

.JoinIdBox, .JoinPwBox, .JoinNameBox, .JoinNickNameBox, .JoinEmailBox,
	.JoinCellPhoneNumBox, .profileImage_box,.postBox {
	left: 937px;
	width: 550px;
	position: absolute;
	height: 100px;
}

.profileImage_box {
	top: 8%;
}

.JoinIdBox {
	top: 14%;
}

.JoinPwBox {
	top: 24%;
}

.JoinNameBox {
	top: 34%;
}

.JoinNickNameBox {
	top: 44%;
}

.JoinEmailBox {
	top: 54%;
}

.JoinCellPhoneNumBox {
	top: 64%;
}
.postBox{
	top:74%;
}

.Line21 {
	width: 591.01px;
	height: 0px;
	left: 0px;
	top: 85%;
	position: absolute;
	border: 1px rgba(0, 0, 0, 0.70) solid;
}

.LockFill0Wght400Grad0Opsz241 {
	width: 34px;
	height: 34px;
	padding-top: 1.42px;
	padding-bottom: 2.83px;
	padding-left: 5.67px;
	padding-right: 5.67px;
	left: 0px;
	top: 59px;
	position: absolute;
	justify-content: center;
	align-items: center;
	display: inline-flex;
}

.SlaRecipeMidTextBox {
	top: 300px;
	height: 148px;
	position: absolute;
	width: 620px;
	left: 50px;
}

/* 회원가입 폼 배경상자 */
.joinform_background {
	width: 720px;
	height: 850px;
	left: 870px;
	top: 50px;
	position: absolute;
	background: rgba(255, 255, 255, 0.40);
	border-radius: 10px;
}

/* 공통속성이라서 묶음 */
.inputJoinId, .inputJoinPw, .inputJoinName, .inputJoinNickName,
	.inputJoinEmail, .inputJoinCellPhoneNum {
	background-color: white;
	left: 50px;
}

.inputJoinPw {
	background-color: #white;
	left: 35px;
}

.JoinBtn {
	width: 120px;
	height: 60px;
	position: absolute;
	left: 1170px;
	top: 85%;
	background-color: #EDC127;
	border-radius: 10px;
	opacity: 0.7;
}

.JoinBtn_box:hover>.JoinBtn {
	background-color: #FFC700;
}

.ConfirmBtn {
	width: 80px;
	height: 40px;
	position: absolute;
	left: 120%;
	top: 20%;
	border-radius: 10px;
	opacity: 0.7;
	background-color: #EDC127;
}

.ConfirmBtn_box:hover>.ConfirmBtn {
	background-color: #FFC700;
}

.inputJoinId_box, .inputJoinPw_box, .inputJoinName_box,
	.inputJoinNickName_box, .inputJoinEmail_box, .inputJoinCellPhoneNum_box
	{
	position: absolute;
}

.inputJoinId_box>img, .inputJoinPw_box>img, .inputJoinName_box>img,
	.inputJoinNickName_box>img, .inputJoinEmail_box>img,
	.inputJoinCellPhoneNum_box>img {
	position: absolute;
	top: 8px;
	height: 30px;
	width: 35px;
}

.inputJoinId_box>.inputJoinId, .inputJoinPw_box>.inputJoinPw,
	.inputJoinName_box>.inputJoinName, .inputJoinNickName_box>.inputJoinNickName,
	.inputJoinEmail_box>.inputJoinEmail, .inputJoinCellPhoneNum_box>.inputJoinCellPhoneNum
	{
	position: relative;
}

.inputJoinPw_box>.inputJoinPw {
	position: relative;
	left: 50px;
}

/* 페이지 구성요소 */
.SlaRecipe {
	width: 100%;
	left: 5.7%;
	top: 0px;
	position: absolute;
	color: white;
	font-size: 90px;
	font-family: "Sevillana", cursive;
	font-weight: 600;
	word-wrap: break-word;
	text-shadow: -1px 0 rgba(0, 0, 0, 0.6), 0 1px rgba(0, 0, 0, 0.6), 1px 0
		rgba(0, 0, 0, 0.6), 0 -1px rgba(0, 0, 0, 0.6);
}

.ATasteToBuildYourDreamOn {
	left: 5.7%;
	top: 120px;
	width: 130%;
	color: white;
	font-size: 40px;
	font-family: "Sevillana", cursive;
	font-weight: 600;
	word-wrap: break-word;
	position: absolute;
	text-shadow: -1px 0 rgba(0, 0, 0, 0.6), 0 1px rgba(0, 0, 0, 0.6), 1px 0
		rgba(0, 0, 0, 0.6), 0 -1px rgba(0, 0, 0, 0.6);
}

.SlaRecipe ,.ATasteToBuildYourDreamOn {
  font-weight: 600;
  color: tomato;
  
  --x-offset: -0.0480em;
  --y-offset: 0.0480em;
  --stroke: 0.025em;
  --background-color: white;
  --stroke-color: lightblue;
  
  text-shadow: 
    
    var(--x-offset)
    var(--y-offset)
    0px
    var(--background-color), 
    
    calc( var(--x-offset) - var(--stroke) )
    calc( var(--y-offset) + var(--stroke) )
    0px
    var(--stroke-color);
  
}
/* for browsers that support spread, added in
https://drafts.csswg.org/css-text-decor-4/#text-shadow-property
currently: none browsers! none of them!
I can't even find a test: 
https://wpt.fyi/results/css/css-text-decor */
@supports ( text-shadow: 1px 1px 1px 1px black ) {
  .SlaRecipe ,.ATasteToBuildYourDreamOn {
    text-shadow:
      
      var(--x-offset)
      var(--y-offset)
      0px
      0px
      var(--background-color), 
      
      var(--x-offset) 
      var(--y-offset)
      var(--stroke)
      0px
      var(--stroke-color);
    
  }
}
.SlaRecipe, .ATasteToBuildYourDreamOn {
	font-weight: 400;
	font-family: "Merriweather", serif;
	user-select: none;
	text-transform: uppercase;
}

.logo {
	position: absolute;
	width: 115px;
	height: 140px;
	left: 1180px;
	top: 70px;
}

.history_back_btn {
	position: absolute;
}

.history_back_img {
	width: 45px;
	height: 45px;
}

.history_back_text {
	font-size: 20px;
}

.rs-msg {
	position: absolute;
	width: 300px;
	top: -40%;
	color: rgba(0, 0, 0, 0.6);
	left: 20%;
}

</style>

</head>
<body>
	<div class="SlaRecipeLoginPageVer02">
		<img class="Background_img"
			src="https://images.unsplash.com/photo-1516824467205-afa656d31a79?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
			alt="Background Image">
		<div class="joinform_background"></div>
		<input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
		<!-- 회원가입 form -->
		<form name="form1" class="form1" action="../member/doJoin" method="POST"
			onsubmit="MemberJoin__submit(this); return false;" enctype="multipart/form-data">
			<div class="profileImage_box">
				<span class="profileImage_text" style="font-weight: bold;">프로필이미지</span>
				<div class="profileImage_text_bgc"></div>
				<div class="profileImage_data_box">
					<input style="border-radius: " id="fileInput" type="file" />
				</div>
				<div class="profileImage_box_bgc">
					<span class=""></span>
				</div>
			</div>
			<div class="JoinIdBox">
				<div style="font-size: 20xp; font-family: Inter; font-weight: 600;">아이디</div>
				<div class="inputJoinId_box">
					<img src="https://velog.velcdn.com/images/fake150907/post/9385617a-3763-433f-8c7c-6b9134eff921/image.svg" alt="" />
					<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="JoinId inputJoinId input"
						autocomplete="off" type="text" placeholder="아이디를 입력해주세요" name="JoinId" />
					<div class="rs-msg"></div>
					<div class="ConfirmBtn_box">
						<!-- 아이디 중복체크 버튼 -->
						<input class="ConfirmBtn" style="font-size: 15px; font-family: Inter; font-weight: 600;"
							onclick="JoinIdConfirm();" type="button" value="중복체크" />
					</div>
				</div>
				<div class="Line21"></div>
			</div>
			<div class="JoinPwBox">
				<div style="font-size: 20xp; font-family: Inter; font-weight: 600;">비밀번호</div>
				<div class="inputJoinPw_box">
					<img src="https://velog.velcdn.com/images/fake150907/post/1286d64c-f81c-4b1f-95a3-bb555e940bd9/image.svg" alt="" />
					<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputJoinPw input"
						autocomplete="current-password" type="text" placeholder="비밀번호를 입력해주세요" name="JoinPw" />
				</div>
				<div class="LockFill0Wght400Grad0Opsz241">
					<div class="Vector"></div>
				</div>
				<div class="Line21" style="left: 4px;"></div>
			</div>
			<div class="JoinNameBox">
				<div style="font-size: 20xp; font-family: Inter; font-weight: 600;">이름</div>
				<div class="inputJoinName_box">
					<img src="https://velog.velcdn.com/images/fake150907/post/1286d64c-f81c-4b1f-95a3-bb555e940bd9/image.svg" alt="" />
					<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputJoinName input w-full"
						autocomplete="off" type="text" placeholder="이름을 입력해주세요" name="JoinName" />
				</div>
				<div class="LockFill0Wght400Grad0Opsz241">
					<div class="Vector"></div>
				</div>
				<div class="Line21" style="left: 4px;"></div>
			</div>
			<div class="JoinNickNameBox">
				<div style="font-size: 20xp; font-family: Inter; font-weight: 600;">닉네임</div>
				<div class="inputJoinNickName_box">
					<img src="https://velog.velcdn.com/images/fake150907/post/1286d64c-f81c-4b1f-95a3-bb555e940bd9/image.svg" alt="" />
					<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputJoinNickName input w-full"
						autocomplete="off" type="text" placeholder="닉네임을 입력해주세요" name="JoinNickName" />
				</div>
				<div class="LockFill0Wght400Grad0Opsz241">
					<div class="Vector"></div>
				</div>
				<div class="Line21" style="left: 4px;"></div>
			</div>
			<div class="JoinEmailBox">
				<div style="font-size: 20xp; font-family: Inter; font-weight: 600;">이메일</div>
				<div class="inputJoinEmail_box">
					<img src="https://velog.velcdn.com/images/fake150907/post/1286d64c-f81c-4b1f-95a3-bb555e940bd9/image.svg" alt="" />
					<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputJoinEmail input w-full"
						autocomplete="off" type="text" placeholder="이메일을 입력해주세요" name="JoinEmail" />
				</div>
				<div class="LockFill0Wght400Grad0Opsz241">
					<div class="Vector"></div>
				</div>
				<div class="Line21" style="left: 4px;"></div>
			</div>
			<div class="JoinCellPhoneNumBox">
				<div style="font-size: 20xp; font-family: Inter; font-weight: 600;">전화번호</div>
				<div class="inputJoinCellPhoneNum_box">
					<img src="https://velog.velcdn.com/images/fake150907/post/1286d64c-f81c-4b1f-95a3-bb555e940bd9/image.svg" alt="" />
					<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputJoinCellPhoneNum input w-full"
						autocomplete="off" type="text" placeholder="전화번호를 입력해주세요" name="JoinCellPhoneNum" />
				</div>
				<div class="LockFill0Wght400Grad0Opsz241">
					<div class="Vector"></div>
				</div>
				<div class="Line21" style="left: 4px;"></div>
			</div>
			<div class="postBox">
				<div style="font-size: 20xp; font-family: Inter; font-weight: 600;">우편번호</div>
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button><br>
				<input type="text" id="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</div>
			<div class="JoinBtn_box">
				<input style="font-size: 20px; font-family: Inter; font-weight: 600;" type="submit" value="회원가입" class="JoinBtn" />
			</div>
		</form>
		<div class="history_back_btn">
			<button class="btn btn-outline" type="button" onclick="history.back();">
				<img class="history_back_img"
					src="https://velog.velcdn.com/images/fake150907/post/2d6415a7-d5b6-4673-8cd9-83e781b2945a/image.svg" alt="" />
				<div class="history_back_text">뒤로가기</div>
			</button>
		</div>
		<div class="SlaRecipeMidTextBox">
			<div class="SlaRecipe">Sla Recipe</div>
			<div class="ATasteToBuildYourDreamOn">A Taste to Build Your Dream On</div>
		</div>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>