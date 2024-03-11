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
<!-- 구글폰트 불러오기 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sla Recipe</title>
<script>
//요소를 가져옵니다.
const introduceBox = document.querySelector('.introduce_box');
const ingredientsBox = document.querySelector('.ingredients_box');
const recommendRecipeBox = document.querySelector('.recommendRecipe_box');
const recipeListBox = document.querySelector('.recipeList_box');

// 각 상자에 대한 마우스 진입 및 빠져 나가기 이벤트를 추가합니다.
// 마우스 진입 이벤트
document.querySelector('.startPage_bottom_box1').addEventListener('mouseenter', () => {
    introduceBox.style.display = 'block'; // 요소를 보이도록 변경
    setTimeout(() => {
        introduceBox.style.opacity = 1; // 투명도를 1로 설정하여 부드럽게 보이도록 함
    }, 100);
});

document.querySelector('.startPage_bottom_box2').addEventListener('mouseenter', () => {
    ingredientsBox.style.display = 'block'; // 요소를 보이도록 변경
    setTimeout(() => {
        ingredientsBox.style.opacity = 1; // 투명도를 1로 설정하여 부드럽게 보이도록 함
    }, 100);
});

document.querySelector('.startPage_bottom_box3').addEventListener('mouseenter', () => {
    recommendRecipeBox.style.display = 'block'; // 요소를 보이도록 변경
    setTimeout(() => {
        recommendRecipeBox.style.opacity = 1; // 투명도를 1로 설정하여 부드럽게 보이도록 함
    }, 100);
});

document.querySelector('.startPage_bottom_box4').addEventListener('mouseenter', () => {
    recipeListBox.style.display = 'block'; // 요소를 보이도록 변경
    setTimeout(() => {
        recipeListBox.style.opacity = 1; // 투명도를 1로 설정하여 부드럽게 보이도록 함
    }, 100);
});

// 마우스 빠져 나가기 이벤트
document.querySelector('.startPage_bottom_box1').addEventListener('mouseleave', () => {
    introduceBox.style.opacity = 0; // 투명도를 0으로 설정하여 사라지도록 함
    setTimeout(() => {
        introduceBox.style.display = 'none'; // 요소를 숨기도록 변경
    }, 300); // 0.3초 후에 요소를 숨김
});

document.querySelector('.startPage_bottom_box2').addEventListener('mouseleave', () => {
    ingredientsBox.style.opacity = 0; // 투명도를 0으로 설정하여 사라지도록 함
    setTimeout(() => {
        ingredientsBox.style.display = 'none'; // 요소를 숨기도록 변경
    }, 300); // 0.3초 후에 요소를 숨김
});

document.querySelector('.startPage_bottom_box3').addEventListener('mouseleave', () => {
    recommendRecipeBox.style.opacity = 0; // 투명도를 0으로 설정하여 사라지도록 함
    setTimeout(() => {
        recommendRecipeBox.style.display = 'none'; // 요소를 숨기도록 변경
    }, 300); // 0.3초 후에 요소를 숨김
});

document.querySelector('.startPage_bottom_box4').addEventListener('mouseleave', () => {
    recipeListBox.style.opacity = 0; // 투명도를 0으로 설정하여 사라지도록 함
    setTimeout(() => {
        recipeListBox.style.display = 'none'; // 요소를 숨기도록 변경
    }, 300); // 0.3초 후에 요소를 숨김
});
</script>
<style>
.SlaRecipeStartPageVer01 {
	width: 1910px;
	height: 940px;
	position: relative;
	background: white;
}

.Rectangle61 {
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	position: absolute;
	background: linear-gradient(0deg, #D9D9D9 0%, #D9D9D9 100%);
}

.HeadIcons {
	width: 300px;
	height: 55px;
	top: 2%;
	position: absolute;
	display: flex;
	justify-content: space-around;
	right: 2%;
}

.HeadIcons img {
	width: 60px;
	height: 60px;
}

.SearchIcon, .noneLogin-SearchIcon, .LoginIcon, .LogoutIcon, .JoinIcon,
	.HomeIcon, .MyPageIcon, .noneLogin-HomeIcon, .WriteIcon {
	font-size: 15px;
	width: px;
	font-weight: bold;
	width: 43.96px;
	position: relative;
	height: 58px;
}

.Icon_text {
	position: relative;
	left: -17%;
	top: -20%;
}

.Icon_text_home {
	left: 15%;
	top: 50%;
	position: absolute;
	align-content: center;
}

.logo {
	position: absolute;
	width: 153px;
	height: 193px;
}

.Group6 {
	width: 1440px;
	height: 99px;
	left: 0;
	top: 801px;
	position: absolute;
}

.SlaRecipeStartHeadBar {
	width: 100%;
	height: 99px;
	left: 0;
	top: 0;
	position: absolute;
}

.Group22 {
	width: 304.07px;
	height: 30.62px;
	position: absolute;
	display: flex;
	align-items: center;
}

.Group23 {
	width: 304.07px;
	height: 30.62px;
	left: 25%;
	position: absolute;
	display: flex;
	align-items: center;
}

.Group24 {
	width: 304.07px;
	height: 30.62px;
	left: 50%;
	position: absolute;
	display: flex;
	align-items: center;
}

.Group25 {
	width: 304.07px;
	height: 30.62px;
	left: 75%;
	position: absolute;
	display: flex;
	align-items: center;
}
/*하단 바*/
.startPage_bottom_Container {
	width: 100%;
	height: 99px;
	position: absolute;
	bottom: 0;
	left: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: rgba(255, 255, 255, 0.3); /* 배경색을 흰색으로 투명도 조절 */
	backdrop-filter: blur(10px); /* 블러 효과 추가 */
	padding: 0 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	position: absolute;
}

.startPage_bottom_box1, .startPage_bottom_box2, .startPage_bottom_box3,
	.startPage_bottom_box4 {
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-sizing: border-box;
}

.startPage_bottom_item1, .startPage_bottom_item2,
	.startPage_bottom_item3, .startPage_bottom_item4 {
	width: 477px;
	height: 99px;
	left: -19.5px;
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
	box-sizing: border-box;
}

.separator1 {
	width: 1px;
	left: 477px;
	position: absolute;
	height: 99px;
	background-color: #ccc;
}

.separator2 {
	width: 1px;
	left: 954px;
	position: absolute;
	height: 99px;
	background-color: #ccc;
}

.separator3 {
	width: 1px;
	left: 1431px;
	position: absolute;
	height: 99px;
	background-color: #ccc;
}

.icon {
	border-radius: 5px;
	margin-right: 10px;
}

.icon img {
	color: rgba(0, 0, 0, 0.5);
	width: 35px;
	height: 35px;
	border-radius: 5px;
	margin-right: 10px;
}

.startPage_bottom_content {
	color: rgba(0, 0, 0, 0.8);
	font-size: 25px;
	width: 400px;
	font-family: Inter;
	font-weight: 500;
	display: flex;
	justify-content: space-between;
	align-items: center;
	display: flex;
	font-family: Inter;
}

.introduce_box, .ingredients_box, .recommendRecipe_box, .recipeList_box
	{
	background: rgba(0, 0, 0, 0.3);
	width: 1910px;
	height: 800px;
	position: absolute;
	display: none;
	bottom: 99px;
	backdrop-filter: blur(10px);
	opacity: 1; /* 투명도를 1로 설정하여 요소를 부드럽게 보여줌 */
	transition: opacity 0.3s ease;
}

.startPage_bottom_box2:hover .ingredients_box {
	opacity: 1; /* 투명도를 1로 설정하여 요소를 부드럽게 보여줌 */
	transition: opacity 0.3s ease;
}

.introduce_box {
	left: -2px;
}

.ingredients_box {
	left: -477px;
}

.recommendRecipe_box {
	left: -954px;
}

.recipeList_box {
	left: -1431px;
}

/* .startPage_bottom_box1, .startPage_bottom_box2, .startPage_bottom_box3, .startPage_bottom_box4에 hover 시 transition 효과 적용 */
.startPage_bottom_box1:hover .startPage_bottom_item1,
	.startPage_bottom_box2:hover .startPage_bottom_item2,
	.startPage_bottom_box3:hover .startPage_bottom_item3,
	.startPage_bottom_box4:hover .startPage_bottom_item4 {
	background: rgba(0, 0, 0, 0.3);
	transition: background 0.3s ease; /* 배경색 변화에 대한 transition 효과 설정 */
}

/* .introduce_box, .ingredients_box, .recommendRecipe_box, .recipeList_box의 display 속성을 변경하여 효과적으로 보여줌 */
.startPage_bottom_box1:hover .introduce_box, .startPage_bottom_box2:hover  .ingredients_box,
	.startPage_bottom_box3:hover  .recommendRecipe_box,
	.startPage_bottom_box4:hover  .recipeList_box {
	background: rgba(0, 0, 0, 0.3);
	width: 1910px;
	height: 650px;
	position: absolute;
	display: block;
	backdrop-filter: blur(10px);
	bottom: 99px;
}

/* 타이틀 */
.header-container {
	width: 602px;
	height: 157px;
	position: relative;
}

.title, .subtitle {
	position: absolute;
	color: white;
	font-family: Inter;
	font-weight: 600;
	word-wrap: break-word;
	left: 35%;
}

.title {
	font-size: 90px;
	width: 450px;
	top: 0px;
}

.subtitle {
	width: 800px;
	font-size: 40px;
	top: 109px;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}
/* 재료공구 */
.ingredients_img1 {
	width: 605px;
	height: 345px;
	top: 100px;
	left: 350px;
	border-radius: 10px;
	position: absolute;
	background: linear-gradient(0deg, #D9D9D9 0%, #D9D9D9 100%);
}

.ingredients_img2 {
	width: 605px;
	height: 345px;
	top: 250px;
	left: 900px;
	position: absolute;
	background: linear-gradient(0deg, #D9D9D9 0%, #D9D9D9 100%);
	border-radius: 10px;
}

.ingredients_item1, .ingredients_item2 {
	width: 605px;
	position: relative;
}

.ingredients_content {
	width: 566px;
	height: 66px;
	position: absolute;
	left: 350px;
	top: 0;
}

.ingredients_content2 {
	width: 566px;
	height: 66px;
	position: absolute;
	font-size: 20px;
	font-weight: 600;
	line-height: 24px;
	word-wrap: break-word;
	left: 900px;
	top: 600px;
	font-family: Inter;
	color: white;
}

.ingredients_content>.title {
	left: 0;
	top: 0;
	position: absolute;
	color: white;
	font-size: 35px;
	font-family: Inter;
	font-weight: 600;
	line-height: 42px;
	word-wrap: break-word;
}

.ingredients_content>.subtitle {
	left: 151px;
	top: 9px;
	position: absolute;
	color: white;
	font-size: 20px;
	font-family: Inter;
	font-weight: 600;
	line-height: 24px;
	word-wrap: break-word;
}

.ingredients_content>.description {
	left: 0;
	top: 42px;
	position: absolute;
	color: white;
	font-size: 20px;
	font-family: Inter;
	font-weight: 600;
	line-height: 24px;
	word-wrap: break-word;
}
</style>
<script type="text/javascript">
	/* $(function(){
		$('.startPage_bottom_box1').on('mouseover', function(){
			$('.introduce_box').stop().slideUp(200)
            $(this).children('.introduce_box').stop().slideDown(200)
		});

		$('.startPage_bottom_box1').on('mouseleave', function(){
			$(this).children('.introduce_box').stop().slideDown(200)
		});
		
		$('.startPage_bottom_box2').on('mouseover', function(){
			$('.ingredients_box').stop().slideUp(200)
            $(this).children('.ingredients_box').stop().slideDown(200)
		});

		$('.startPage_bottom_box2').on('mouseleave', function(){
			$(this).children('.ingredients_box').stop().slideUp(200)
		});
		
		$('.startPage_bottom_box3').on('mouseover', function(){
			$('.recommendRecipe_box').stop().slideUp(200)
            $(this).children('.recommendRecipe_box').stop().slideDown(200)
		});

		$('.startPage_bottom_box3').on('mouseleave', function(){
			$(this).children('.recommendRecipe_box').stop().slideUp(200)
		});
		
		$('.startPage_bottom_box4').on('mouseover', function(){
			$('.recipeList_box').stop().slideUp(200)
            $(this).children('.recipeList_box').stop().slideDown(200)
		});

		$('.startPage_bottom_box4').on('mouseleave', function(){
			$(this).children('.recipeList_box').stop().slideUp(200)
		});
	}); */
	
	$(function(){
		$('.startPage_bottom_box1').on('mouseover', function(){
			$('.introduce_box').stop().slideDown();
		});

		$('.startPage_bottom_box1').on('mouseleave', function(){
			$('.introduce_box').hide();
			$('.introduce_box').stop().slideUp();
		});
		
		$('.startPage_bottom_box2').on('mouseover', function(){
			$('.ingredients_box').stop().slideDown();
		});

		$('.startPage_bottom_box2').on('mouseleave', function(){
			$('.ingredients_box').hide();
			$('.ingredients_box').stop().slideUp();
		});
		
		$('.startPage_bottom_box3').on('mouseover', function(){
			$('.recommendRecipe_box').stop().slideDown();
		});

		$('.startPage_bottom_box3').on('mouseleave', function(){
			$('.recommendRecipe_box').hide();
			$('.recommendRecipe_box').stop().slideUp();
		});
		
		$('.startPage_bottom_box4').on('mouseover', function(){
			$('.recipeList_box').stop().slideDown();
		});

		$('.startPage_bottom_box4').on('mouseleave', function(){
			$('.recipeList_box').hide();
			$('.recipeList_box').stop().slideUp();
		});
	});
</script>
</head>
<body>
	<div class="SlaRecipeStartPageVer01">
		<img class="Rectangle61"
			src="https://images.unsplash.com/photo-1516824467205-afa656d31a79?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
			alt="Background Image">
		<div class="logo">
			<a href="/">
				<img src="https://velog.velcdn.com/images/fake150907/post/265346d4-9a4e-4661-8925-816dcc4ffa21/image.png"
					alt="Background Image" />
			</a>
		</div>
		<div class="header-container">
			<div class="title">Sla Recipe</div>
			<div class="subtitle">A Taste to Build Your Dream On</div>
		</div>
		<c:if test="${!rq.isLogined() }">
			<div class="HeadIcons">
				<div class="noneLogin-HomeIcon">
					<a class="hover:underline" href="/">
						<span class="material-symbols-outlined"> home </span>
						<span class="Icon_text">Home</span>
					</a>
				</div>
				<div class="noneLogin-SearchIcon">
					<a class="hover:underline" href="../home/search">
						<span class="material-symbols-outlined"> search </span>
						<span class="Icon_text">Search</span>
					</a>
				</div>
				<div class="LoginIcon">
					<a class="hover:underline" href="../member/login">
						<span class="material-symbols-outlined"> login </span>
						<span class="Icon_text">Login</span>
					</a>
				</div>
				<div class="JoinIcon">
					<a class="hover:underline" href="../member/join">
						<span class="material-symbols-outlined"> group_add </span>
						<span class="Icon_text">Join</span>
					</a>
				</div>
			</div>
		</c:if>
		<c:if test="${rq.isLogined() }">
			<div class="HeadIcons">
				<div class="HomeIcon">
					<a class="hover:underline" href="/">
						<span class="material-symbols-outlined"> home </span>
						<span class="Icon_text">Home</span>
					</a>
				</div>
				<div class="SearchIcon">
					<a class="hover:underline" href="../home/search">
						<span class="material-symbols-outlined"> search </span>
						<span class="Icon_text">Search</span>
					</a>
				</div>
				<div class="LogoutIcon">
					<a onclick="if(confirm('로그아웃 할래?') == false) return false;" class="hover:underline" href="../member/doLogout">
						<span class="material-symbols-outlined">logout</span>
						<span class="Icon_text">Logout</span>
					</a>
				</div>
				<div class="WriteIcon">
					<a class="hover:underline" href="../recipe/write">
						<span class="material-symbols-outlined"> edit_square </span>
						<span class="Icon_text">Write</span>
					</a>
				</div>
				<div class="MyPageIcon">
					<a class="hover:underline" class="h-full px-3 flex items-center" href="/usr/member/myPage">
						<span class="material-symbols-outlined"> location_home </span>
						<span class="Icon_text">MyPage</span>
					</a>
				</div>
			</div>
		</c:if>
		<div class="startPage_bottom_Container">
			<div class="startPage_bottom_box1">
				<div class="startPage_bottom_item1">
					<div class="introduce_box"></div>
					<a href="">
						<div class="startPage_bottom_content">
							아무개소개
							<div class="icon">
								<img src="https://velog.velcdn.com/images/fake150907/post/7379f23c-b9d0-4da9-bf1d-3eba0567ea40/image.svg" alt="" />
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="separator1"></div>
			<div class="startPage_bottom_box2">
				<div class="startPage_bottom_item2">
					<div class="ingredients_box">
						<div class="ingredients_item1">
							<div class="ingredients_content">
								<div class="title">재료공구</div>
								<div class="subtitle">신선한 재료로 요리하고싶은 당신의 마음!</div>
								<div class="description">마트에 가서 재료를 사도 혼자 사는 당신들이 먹기에는 양이 너무 많다!</div>
							</div>
							<img class="ingredients_img1"
								src="https://velog.velcdn.com/images/fake150907/post/f78257ce-3777-4a59-9bf6-7b8323cd1810/image.jpg" />
						</div>
						<div class="ingredients_item2">
							<div class="ingredients_content2">이제 다른 사람들과 재료를 공동구매해서 항상 신선하고 질 좋은 재료로 식사해보세요!</div>
							<img class="ingredients_img2"
								src="https://velog.velcdn.com/images/fake150907/post/8ce2087f-9ea9-433b-94e6-d3f38de359a3/image.jpg" />
						</div>
					</div>
					<a href="../GroupBuying/location">
						<div class="startPage_bottom_content">
							재료공구
							<div class="icon">
								<img src="https://velog.velcdn.com/images/fake150907/post/7379f23c-b9d0-4da9-bf1d-3eba0567ea40/image.svg" alt="" />
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="separator2"></div>
			<div class="startPage_bottom_box3">
				<div class="startPage_bottom_item3">
					<div class="recommendRecipe_box"></div>
					<a href="">
						<div class="startPage_bottom_content">
							맟춤레시피
							<div class="icon">
								<img src="https://velog.velcdn.com/images/fake150907/post/7379f23c-b9d0-4da9-bf1d-3eba0567ea40/image.svg" alt="" />
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="separator3"></div>
			<div class="startPage_bottom_box4">
				<div class="startPage_bottom_item4">
					<div class="recipeList_box"></div>
					<a href="../recipe/list">
						<div class="startPage_bottom_content">
							레시피 목록
							<div class="icon">
								<img src="https://velog.velcdn.com/images/fake150907/post/7379f23c-b9d0-4da9-bf1d-3eba0567ea40/image.svg" alt="" />
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<%@ include file="../common/foot.jspf"%>