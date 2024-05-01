<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="stylesheet" href="/resources/common.css" />
<script src="/resources/common.js" defer="defer"></script>
<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

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
	.JoinCellPhoneNumBox, .profileImage_box {
	left: 937px;
	width: 550px;
	position: absolute;
	height: 100px;
}

.profileImage_box {
	top: 15%;
}

.JoinIdBox {
	top: 22%;
}

.JoinPwBox {
	top: 34%;
}

.JoinNameBox {
	top: 44%;
}

.JoinNickNameBox {
	top: 54%;
}

.JoinEmailBox {
	top: 64%;
}

.JoinCellPhoneNumBox {
	top: 74%;
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
	background-color: #FFFACD;
	left: 50px;
}

.inputJoinPw {
	background-color: #FFFACD;
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
	left: 225px;
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
	left: 170px;
	top: 120px;
	width: 100%;
	color: white;
	font-size: 40px;
	font-family: "Sevillana", cursive;
	font-weight: 600;
	word-wrap: break-word;
	position: absolute;
	text-shadow: -1px 0 rgba(0, 0, 0, 0.6), 0 1px rgba(0, 0, 0, 0.6), 1px 0
		rgba(0, 0, 0, 0.6), 0 -1px rgba(0, 0, 0, 0.6);
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
		<a href="/">
			<img class="logo"
				src="https://velog.velcdn.com/images/fake150907/post/265346d4-9a4e-4661-8925-816dcc4ffa21/image.png" alt="Logo">
		</a>
		<!-- 회원가입 form -->
		<form name="form1" class="form1" action="../member/doJoin" method="POST"
			onsubmit="MemberJoin__submit(this); return false;" enctype="multipart/form-data">
			<div class="profileImage_box">
				<span class="profileImage_text" style="font-weight: bold;">프로필이미지</span>
				<div class="profileImage_text_bgc"></div>
				<div class="profileImage_data_box">
					<input id="fileInput" placeholder="이미지를 선택해주세요" type="file" />
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
</body>
</html>