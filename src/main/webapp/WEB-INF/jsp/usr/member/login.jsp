<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
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
<style>
/* 공통 스타일 */
.SlaRecipeLoginPageVer02 {
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

.login_HomeIcon {
	width: 43.96px;
	height: 38.19px;
	left: 130px;
	top: 50px;
	position: absolute;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	display: inline-flex;
	z-index: 10;
}

.material-symbols-outlined {
	font-size: 40px;
}

.LoginIdBox, .LoginPwBox {
	width: 591.01px;
	height: 108px;
	position: absolute;
}

.Line21 {
	width: 591.01px;
	height: 0px;
	left: 0px;
	top: 108px;
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

/* 개별 스타일 */
.LoginIdBox {
	top: 30%;
	left: 10%;
}

.inputLoginId {
	background-color: white;
	left: 50px;
}

.inputLoginPw {
	background-color: white;
	left: 35px;
}

.LoginPwBox {
	left: 10%;
	top: 50%;
}

.LoginBtn {
	width: 120px;
	height: 60px;
	position: absolute;
	left: 41%;
	top: 75%;
	background-color: #EDC127;
	border-radius: 10px;
	opacity: 0.7;
}

.LoginBtn_box:hover>.LoginBtn {
	background-color: #FFC700;
}

.inputLoginId_box, .inputLoginPw_box {
	position: absolute;
}

.inputLoginId_box>img {
	position: absolute;
	top: 8px;
	height: 30px;
	width: 35px;
}

.inputLoginId_box>.inputLoginId {
	position: relative;
}

.inputLoginPw_box>img {
	position: absolute;
	top: 8px;
	height: 30px;
	width: 35px;
}

.inputLoginPw_box>.inputLoginPw {
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
	z-index: 10;
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
/* 로그인 박스 */
.login_form_box {
	width: 720px;
	height: 800px;
	left: 870px;
	top: 50px;
	position: absolute;
	background: rgba(255, 255, 255, 0.40);
	border-radius: 10px;
}
/* find_member css */
.find_member_Box {
	position: absolute;
	top: 90%;
	left: 34%;
}

.found {
	color: rgba(0, 0, 0, 0.6);
}
</style>
</head>
<body>
	<div class="SlaRecipeLoginPageVer02">
		<img class="Background_img"
			src="https://images.unsplash.com/photo-1516824467205-afa656d31a79?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
			alt="Background Image">
		<div class="Rectangle57"></div>
		<div class="HeadIcons">
			<div class="login_HomeIcon">
				<a href="/">
					<span class="material-symbols-outlined"> home </span>
					Home
				</a>
			</div>
		</div>
		<a href="/">
			<img class="logo"
				src="https://velog.velcdn.com/images/fake150907/post/265346d4-9a4e-4661-8925-816dcc4ffa21/image.png" alt="Logo">
		</a>
		<form action="../member/doLogin" method="POST">
			<div class="login_form_box">
				<div class="LoginIdBox">
					<div style="font-size: 35px; font-family: Inter; font-weight: 600;">아이디</div>
					<div class="inputLoginId_box">
						<img src="https://velog.velcdn.com/images/fake150907/post/9385617a-3763-433f-8c7c-6b9134eff921/image.svg" alt="" />
						<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputLoginId input w-full"
							autocomplete="off" type="text" placeholder="아이디를 입력해주세요" name="loginId" />
					</div>
					<div class="Line21"></div>
				</div>
				<div class="LoginPwBox">
					<div style="font-size: 35px; font-family: Inter; font-weight: 600;">비밀번호</div>
					<div class="inputLoginPw_box">
						<img src="https://velog.velcdn.com/images/fake150907/post/1286d64c-f81c-4b1f-95a3-bb555e940bd9/image.svg" alt="" />
						<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputLoginPw input w-full"
							autocomplete="off" type="password" placeholder="비밀번호를 입력해주세요" name="loginPw" />
					</div>
					<div class="LockFill0Wght400Grad0Opsz241">
						<div class="Vector"></div>
					</div>
					<div class="Line21" style="left: 4px;"></div>
				</div>
				<div class="LoginBtn_box">
					<input style="font-size: 30px; font-family: Inter; font-weight: 600;" type="submit" value="로그인" class="LoginBtn" />
				</div>
				<div class="find_member_Box">
					<a class="found btn btn-active btn-link" href="${rq.findLoginIdUri }">아이디 찾기</a>
					<a class="found btn btn-active btn-link" href="${rq.findLoginPwUri }">비밀번호찾기</a>
				</div>
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