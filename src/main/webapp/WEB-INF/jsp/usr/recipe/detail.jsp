<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RECIPE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<!-- 헤드랑, 토스트 유아이랑 겹치는거 확인해보고, 다시 체크해보기 -->

<!-- <iframe src="http://localhost:8081/usr/recipe/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<!-- 변수 -->
<script>
	const params = {};
	params.id = parseInt('${param.id}');
	params.memberId = parseInt('${loginedMemberId}');
	
	console.log(params);
	console.log(params.memberId);
	
	var isAlreadyAddGoodRp = ${isAlreadyAddGoodRp};
	var isAlreadyAddBadRp = ${isAlreadyAddBadRp};

<!-- 조회수 -->

	function RecipeDetail__doIncreaseHitCount() {
		const localStorageKey = 'recipe__' + params.id + '__alreadyView';

		if (localStorage.getItem(localStorageKey)) {
			return;
		}

		localStorage.setItem(localStorageKey, true);

		$.get('../recipe/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.recipe-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}

	$(function() {
		// 		RecipeDetail__doIncreaseHitCount();
		setTimeout(RecipeDetail__doIncreaseHitCount, 2000);
	});
</script>

<!-- 좋아요 싫어요  -->
<script>
	<!-- 좋아요 싫어요 버튼	-->
	function checkRP() {
		if(isAlreadyAddGoodRp == true){
			$('#likeButton').toggleClass('btn-outline');
		}else if(isAlreadyAddBadRp == true){
			$('#DislikeButton').toggleClass('btn-outline');
		}else {
			return;
		}
	}
	
	function doGoodReaction(recipeId) {
		if(isNaN(params.memberId) == true){
			if(confirm('로그인 해야해. 로그인 페이지로 가실???')){
				var currentUri = encodeURIComponent(window.location.href);
				window.location.href = '../member/login?afterLoginUri=' + currentUri; // 로그인 페이지에 원래 페이지의 uri를 같이 보냄
			}
			return;
		}
		
		$.ajax({
			url: '/usr/reactionPoint/doGoodReaction',
			type: 'POST',
			data: {relTypeCode: 'recipe', relId: recipeId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				console.log('data.data1Name : ' + data.data1Name);
				console.log('data.data1 : ' + data.data1);
				console.log('data.data2Name : ' + data.data2Name);
				console.log('data.data2 : ' + data.data2);
				if(data.resultCode.startsWith('S-')){
					var likeButton = $('.like-button');
					var likeCount = $('#likeCount');
					var DislikeButton = $('#DislikeButton');
					var DislikeCount = $('#DislikeCount');
					
					if(data.resultCode == 'S-1'){
						likeButton.toggleClass('liked');
						likeCount.text(data.data1);
					}else if(data.resultCode == 'S-2'){
						DislikeButton.toggleClass('liked');
						DislikeCount.text(data.data2);
						likeButton.toggleClass('liked');
						likeCount.text(data.data1);
					}else {
						likeButton.toggleClass('liked');
						likeCount.text(data.data1);
					}
					
				}else {
					alert(data.msg);
				}
		
			},
			error: function(jqXHR,textStatus,errorThrown) {
				alert('좋아요 오류 발생 : ' + textStatus);

			}
			
		});
	}
	
	
	function doBadReaction(recipeId) {
		
		if(isNaN(params.memberId) == true){
			if(confirm('로그인 해야해. 로그인 페이지로 가실???')){
				var currentUri = encodeURIComponent(window.location.href);
				window.location.href = '../member/login?afterLoginUri=' + currentUri; // 로그인 페이지에 원래 페이지의 uri를 같이 보냄
			}
			return;
		}
		
	 $.ajax({
			url: '/usr/reactionPoint/doBadReaction',
			type: 'POST',
			data: {relTypeCode: 'recipe', relId: recipeId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				console.log('data.data1Name : ' + data.data1Name);
				console.log('data.data1 : ' + data.data1);
				console.log('data.data2Name : ' + data.data2Name);
				console.log('data.data2 : ' + data.data2);
				if(data.resultCode.startsWith('S-')){
					var likeButton = $('#likeButton');
					var likeCount = $('#likeCount');
					var DislikeButton = $('#DislikeButton');
					var DislikeCount = $('#DislikeCount');
					
					if(data.resultCode == 'S-1'){
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
					}else if(data.resultCode == 'S-2'){
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
		
					}else {
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
					}
			
				}else {
					alert(data.msg);
				}
			},
			error: function(jqXHR,textStatus,errorThrown) {
				alert('싫어요 오류 발생 : ' + textStatus);
			}
			
		});
	}
	
	$(function() {
		checkRP();
	});
</script>

<!-- 댓글 -->
<script>
		var ReplyWrite__submitDone = false;

		function ReplyWrite__submit(form) {
			if (ReplyWrite__submitDone) {
				alert('이미 처리중입니다');
				return;
			}
			console.log(123);
			
			console.log(form.body.value);
			
			if (form.body.value.length < 3) {
				alert('댓글은 3글자 이상 입력해');
				form.body.focus();
				return;
			}

			ReplyWrite__submitDone = true;
			form.submit();
		}
</script>
<!-- 댓글 수정 -->
<script>
function toggleModifybtn(replyId) {
	
	console.log(replyId);
	
	$('#modify-btn-'+replyId).hide();
	$('#save-btn-'+replyId).show();
	$('#reply-'+replyId).hide();
	$('#modify-form-'+replyId).show();
}

function doModifyReply(replyId) {
	 console.log(replyId); // 디버깅을 위해 replyId를 콘솔에 출력
	    
	    // form 요소를 정확하게 선택
	    var form = $('#modify-form-' + replyId);
	    console.log(form); // 디버깅을 위해 form을 콘솔에 출력

	    // form 내의 input 요소의 값을 가져옵니다
	    var text = form.find('input[name="reply-text-' + replyId + '"]').val();
	    console.log(text); // 디버깅을 위해 text를 콘솔에 출력

	    // form의 action 속성 값을 가져옵니다
	    var action = form.attr('action');
	    console.log(action); // 디버깅을 위해 action을 콘솔에 출력
	
    $.post({
    	url: '/usr/reply/doModify', // 수정된 URL
        type: 'POST', // GET에서 POST로 변경
        data: { id: replyId, body: text }, // 서버에 전송할 데이터
        success: function(data) {
        	$('#modify-form-'+replyId).hide();
        	$('#reply-'+replyId).text(data);
        	$('#reply-'+replyId).show();
        	$('#save-btn-'+replyId).hide();
        	$('#modify-btn-'+replyId).show();
        },
        error: function(xhr, status, error) {
            alert('댓글 수정에 실패했습니다: ' + error);
        }
	})
};

</script>

<script>
/* 마우스따라다니는애 */	
document.addEventListener('mousemove', function(event) {
  var character = document.getElementById('character');
  var mouseX = event.clientX;
  var mouseY = event.clientY;
  
  character.style.left = mouseX + 'px';
  character.style.top = mouseY + 'px';
});

function toggleLike() {
	  var button = document.querySelector('.like-button');
	  button.classList.toggle('liked');
	}
	
$(document).ready(function() {
	  $('.regDate_text').css('background-color', '#CDEAC0');
    $('.regDate_text').click(function() {
        $('.regDate_data').show();
        $('.updateDate_data').hide();
        $('.regDate_text').css('background-color', '#CDEAC0');
        $('.updateDate_text').css('background-color', 'white');
    });

    $('.updateDate_text').click(function() {
        $('.regDate_data').hide();
        $('.updateDate_data').show();
        $('.updateDate_text').css('background-color', '#CDEAC0');
        $('.regDate_text').css('background-color', 'white');
    });
});
function toggleLike() {
    var button = document.querySelector('.favorite-button');
    button.classList.toggle('liked');
}
</script>

<style>
/* 썸네일 관련 css */
.Thumnail_box {
	position: absolute;
	width: 980px;
	height: 550px;
	top: 15%;
	left: 23.5%;
}

.Thumnail {
	border-radius: 10px;
	width: 980px;
	height: 580PX;
	object-fit:cover;
}
/* 제목관련 css */
.title_box {
	position: absolute;
	left: 24.5%;
	top: 80%;
}

.title_data {
	font-size: 45px;
	color: rgba(0, 0, 0, 0.7);
}

/* 프로필관련 css */
.profile_img {
	width: 140px;
	height: 140px;
	left: 24%;
	top: 95%;
	border-radius: 9999px;
	position: absolute;
	background: linear-gradient(0deg, #D9D9D9 0%, #D9D9D9 100%);
}

.writer_data {
	position: absolute;
	font-size: 40px;
	color: rgba(0, 0, 0, 0.7);
	left: 35%;
	top: 96.5%;
}

.follow_box {
	font-size: 25px;
	position: absolute;
	left: 35%;
	top: 105%;
	left: 35%;
}

.favorite-button {
	position: absolute;
	width: 40px; /* Button width */
	height: 40px; /* Button height */
	border: none;
	cursor: pointer;
	outline: none;
	left: 83%;
	top: -320%;
}

.middle_line1 {
	position: absolute;
	width: 950px;
	height: 0px;
	left: 24%;
	top: 92%;
	border: 1px solid rgba(0, 0, 0, 0.2);
}

.middle_line2 {
	position: absolute;
	width: 950px;
	height: 0px;
	left: 24%;
	top: 112%;
	border: 1px solid rgba(0, 0, 0, 0.2);
}

/* Star icon */
.favorite-button::after {
	content: '\2606'; /* Unicode character for empty star */
	font-size: 50px;
	color: #262626; /* Default color */
}

/* Filled star */
.favorite-button.liked::after {
	content: '\2605'; /* Unicode character for filled star */
	color: #FFD700; /* Yellow color */
}

/* 날짜관련 css */
.date_container {
	position: absolute;
	width: 240px;
	height: 80px;
	top: 95%;
	left: 61%;
}

.regDate_text, .updateDate_text {
	width: 80px;
	height: 30px;
	position: absolute;
	display: flex;
	justify-content: center;
	border: .5px solid rgba(0, 0, 0, 0.3);
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
}

.updateDate_text {
	left: 33%;
}

.regDate_data, .updateDate_data {
	position: absolute;
	width: 240px;
	height: 35px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	display: flex;
	justify-content: center;
	z-index: -1;
	top: 37%;
	background-color: #fff;
	justify-content: center;
}

/* link, goodReaction, hitCount */
.link_like_hit_container {
	width: 240px;
	height: 40px;
	background-color: #FFFACD;
	border-radius: 15px;
	position: absolute;
	left: 61%;
	top: 86%;
	z-index: 5;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

/* 공유관련 */
.link_box {
	diplay: flex;
	position: relative;
	top: 7%;
	left: 8%;
}

.link_data {
	position: absolute;
	top: 16%;
	left: 15%;
}

.linksym {
	position: absolute;
	font-size: 28px;
	top: 23%;
}

/* 좋아요관련 */
.like_box {
	position: absolute;
	top: 68%;
	left: 39%;
}

.like_data {
	position: absolute;
	top: -21px;
	left: 40px;
}

.like_icon {
	position: absolute;
	top: -18px;
}

/* 조회수관련 */
.hitCount_box {
	diplay: inline-block;
	position: absolute;
	top: 25%;
	left: 70%;
}

.recipe-detail__hit-count {
	position: absolute;
	top: -10%;
	right: -100%;
}

/* 좋아요버튼 */
.like-button {
	background-color: transparent;
	border: none;
	color: #262626; /* Default color */
	font-size: 16px;
	cursor: pointer;
	outline: none;
	display: flex;
	align-items: center;
}

.like-button .heart {
	width: 24px;
	height: 24px;
	fill: none;
	stroke: #262626; /* Default color */
	stroke-width: 2px;
	margin-right: 5px;
	transition: stroke 0.3s ease;
}

.liked .heart {
	fill: #ff4d4d; /* Liked color */
	stroke: #ff4d4d; /* Liked color */
}

/* 요리정보 관련 css */
.cook_information_container {
	display: flex;
	width: 800px;
	height: 150px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	justify-content: space-around;
	border-radius: 10px;
	position: absolute;
	left: 28%;
	top: 117%;
	justify-content: space-around;
}

.categorySymbol, .personnelSymbol, .cookingTimeSymbol, .cookLevelSymbol
	{
	position: absolute;
	top: 10%;
	font-size: 65px;
}

.categorySymbol {
	left: 10%;
}

.personnelSymbol {
	left: 35%
}

.cookingTimeSymbol {
	left: 60%;
}

.cookLevelSymbol {
	left: 83.4%;
}

.category_text, .personnel_text, .cookingTime_text, .cookLevel_text {
	position: absolute;
	top: 48%;
	font-size: 15px;
	font-weight: bold;
	color: rgba(0, 0, 0, 0.8);
	font-size: 15px;
}

.category_text {
	left: 10.2%;
}

.personnel_text {
	left: 37.2%;
}

.cookingTime_text {
	left: 60.4%;
}

.cookLevel_text {
	left: 84.8%;
}

.category_data, .personnel_data, .cookingTime_data, .cookLevel_data {
	position: absolute;
	top: 70%;
	font-weight: bold;
	color: rgba(0, 0, 0, 0.8);
	display: flex;
	justify-content: center;
	width: 90px;
	height: 30px;
}

.category_data {
	left: 8.2%;
}

.personnel_data {
	left: 33.6%;
}

.cookingTime_data {
	left: 58.8%;
}

.cookLevel_data {
	left: 81.8%;
}

/* 요리도구 관련 css */
.cookWareContainer {
	width: 1000px;
	height: auto;
	left: 22.5%;
	top: 1250px;
	position: relative;
	background: white;
	border-radius: 10px;
	border: 1px rgba(0, 0, 0, 0.40) solid;
}

.cookWare_data_Box {
	width: 1000px;
	height: 300px;
	left: 10%;
	top: 10%;
	position: static;
}

.cookWare_text_box {
	width: 119.40px;
	height: 48px;
	left: 0px;
	top: 0px;
	position: absolute;
}

.cookWare_text_bgc {
	width: 119.40px;
	height: 48px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: #CDEAC0;
	border-top-left-radius: 10px;
}

.cookWare_text {
	display: flex;
	justify-content: center;
	align-content: center;
	color: black;
	font-size: 25px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
	width: 119.40px;
	height: 40px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: #CDEAC0;
	border-top-left-radius: 10px;
	color: black;
}

.cookWareContent {
	top: 26%;
	left: 2%;
	width: 308.44px;
	height: 40px;
	position: relative;
	display: inline-block;
	width: 308.44px;
	width: 308.44px;
	width: 308.44px;
}

.cookWareName {
	width: 220px;
	color: black;
	font-size: 25px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
	display: inline-block;
	position: static;
}

.cookWareCount {
	width: 80px;
	color: rgba(0, 0, 0, 0.70);
	font-size: 20px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
	display: inline-block;
	position: static;
}

.cookWare_Line {
	width: 290.44px;
	height: 0px;
	left: 0px;
	top: 40px;
	border: 1px black solid;
}

/* 요리재료 관련 css */
.ingredientContainer {
	width: 1000px;
	height: auto;
	left: 22.5%;
	top: 1200px;
	position: relative;
	background: white;
	border-radius: 10px;
	border: 1px rgba(0, 0, 0, 0.40) solid;
}

.ingredient_data_Box {
	width: 1000px;
	height: 300px;
	left: 10%;
	top: 10%;
	position: static;
}

.ingredient_text_box {
	width: 119.40px;
	height: 48px;
	left: 0px;
	top: 0px;
	position: absolute;
}

.ingredient_text_bgc {
	width: 119.40px;
	height: 48px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: #CDEAC0;
	border-top-left-radius: 10px;
}

.ingredient_text {
	display: flex;
	justify-content: center;
	align-content: center;
	color: black;
	font-size: 25px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
	width: 119.40px;
	height: 40px;
	position: absolute;
	background: #CDEAC0;
	border-top-left-radius: 10px;
	color: black;
	color: black;
}

.ingredientContent {
	top: 26%;
	left: 2%;
	width: 308.44px;
	height: 40px;
	position: relative;
	display: inline-block;
	width: 308.44px;
}

.ingredientName {
	width: 220px;
	color: black;
	font-size: 25px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
	display: inline-block;
	position: static;
}

.ingredientMeasure {
	width: 80px;
	color: rgba(0, 0, 0, 0.70);
	font-size: 20px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
	display: inline-block;
	position: static;
}

.ingredient_Line {
	width: 290.44px;
	height: 0px;
	left: 0px;
	top: 40px;
	border: 1px black solid;
}

/* 내용관련 css */
.body_box {
	width: 1000px;
	height: auto;
	left: 22.5%;
	top: 1300px;
	position: relative;
	background: white;
	border-radius: 10px;
	border: 1px rgba(0, 0, 0, 0.40) solid;
}

.body_text {
	display: flex;
	justify-content: center;
	align-content: center;
	color: black;
	font-size: 25px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
	width: 119.40px;
	height: 40px;
	left: 0px;
	top: 0px;
	position: static;
	background: #CDEAC0;
	border-top-left-radius: 10px;
	color: black;
}

.body_data {
	width: 1000px;
	height: auto;
	left: 10%;
	top: 10%;
	position: static;
}

/* 수정, 삭제 버튼 관련 css */
.btns_box {
	position: absolute;
	top: 102%;
	left: 66.7%;
}

.modify_btn:hover .btn, .delete_btn:hover .btn {
	background-color: #FFF06C;
}

.modify_btn, .delete_btn {
	display: inline-block;
}

.btn {
	background-color: #FFFACD;
}
/* 마우스 따라다니는 캐릭터 */
.character {
	position: fixed;
	width: 40px;
	height: 120px; /* Adjust size as needed */
	pointer-events: none;
	/* Ensure the character doesn't interfere with mouse events */
}
/* 댓글 관련 css */
.reply_container {
	position: relative;
	top: 1400px;
}
</style>
<div class="character" id="character">
	<img src="https://velog.velcdn.com/images/fake150907/post/265346d4-9a4e-4661-8925-816dcc4ffa21/image.png" alt="Logo">
</div>
<section class="mt-8 text-xl px-4 ">
	<div class="detail_container">
		<div class="div-box-1 ">
			<div>
				<div class="Thumnail_box">
					<img class="Thumnail rounded-xl" src="${rq.getImgUri(recipe.id,relTypeCode)}" onerror="${rq.profileFallbackImgOnErrorHtml}"
						alt="" />
					<%-- 	<div>${rq.getImgUri(recipe.id)}</div> --%>
				</div>

				<%-- 	<div class="link_box">
					<!-- href="/usr/reactionPoint/doGoodReaction?relTypeCode=recipe&relId=${param.id }&replaceUri=${rq.currentUri}" -->
					<div class="goodReaction_text">공유</div>
					<button id="likeButton" class="btn btn-outline btn-success" onclick="doGoodReaction(${param.id})">공유</button>
					<div class="goodReaction_data" id="likeCount">${recipe.goodReactionPoint }</div>
				</div>
				<div class="goodReaction_box">
					<!-- href="/usr/reactionPoint/doGoodReaction?relTypeCode=recipe&relId=${param.id }&replaceUri=${rq.currentUri}" -->
					<div class="goodReaction_text">좋아요</div>
					<button id="likeButton" class="btn btn-outline btn-success" onclick="doGoodReaction(${param.id})">좋아요</button>
					<div class="goodReaction_data" id="likeCount">${recipe.goodReactionPoint }</div>
				</div> --%>
				<div class="title_box">
					<div class="title_data">${recipe.title }</div>
				</div>
				<div class="link_like_hit_container">
					<div class="link_box">
						<!-- href="/usr/reactionPoint/doGoodReaction?relTypeCode=recipe&relId=${param.id }&replaceUri=${rq.currentUri}" -->
						<button id="link_Button">
							<span class="material-symbols-outlined linksym"> link </span>
						</button>
						<div class="link_data" id="linkCount">56</div>
					</div>
					<div class="like_box">
						<button class="like-button" onclick="doGoodReaction(${param.id})">
							<svg class="heart like_icon" viewBox="0 0 24 24">
    							<path
									d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
  							</svg>
						</button>
						<div class="goodReaction_data like_data" id="likeCount">${recipe.goodReactionPoint }</div>
					</div>
					<div class="hitCount_box">
						<div class="hitCount_data">
							<span class="material-symbols-outlined"> visibility </span>
							<span class="recipe-detail__hit-count">${recipe.hitCount }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="date_container">
				<div class="regDate_box">
					<div class="regDate_text" style="font-size: 16px; font-weight: bold; color: rgba(0, 0, 0, 0.6);">작성날짜</div>
					<div class="regDate_data" style="font-size: 16px; font-weight: bold; color: rgba(0, 0, 0, 0.6);">${recipe.regDate }</div>
				</div>
				<div class="updateDate_box">
					<div class="updateDate_text" style="font-size: 16px; font-weight: bold; color: rgba(0, 0, 0, 0.6);">수정날짜</div>
					<div class="updateDate_data" style="font-size: 16px; font-weight: bold; color: rgba(0, 0, 0, 0.6);">${recipe.updateDate }</div>
				</div>
			</div>
			<div class="btns_box mt-5">
				<c:if test="${recipe.userCanModify }">
					<div class="modify_btn">
						<a class="btn" href="../recipe/modify?id=${recipe.id }">수정</a>
					</div>
				</c:if>
				<c:if test="${recipe.userCanDelete }">
					<div class="delete_btn">
						<a class="btn" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
							href="../recipe/doDelete?id=${recipe.id }">삭제</a>
					</div>
				</c:if>
			</div>
			<div class="middle_line1"></div>
			<div class="profile_box">
				<img class="profile_img"
					src="https://velog.velcdn.com/images/fake150907/post/9703cf41-5437-4a4c-8594-f93646887e30/image.jpg" alt="" />
				<div class="writer_data">${recipe.extra__writer }</div>
				<div class="follow_box">
					<span class="follow_data">팔로워201</span>
					<span class="following_data">팔로잉3</span>
					<button class="favorite-button" onclick="toggleLike()" id="likeButton"></button>
				</div>
			</div>
			<div class="middle_line2"></div>
			<div class="cook_information_container">
				<div class="category_box">
					<div class="category_items">
						<span class="material-symbols-outlined categorySymbol"> stacks </span>
						<span class="category_text">카테고리</span>
					</div>
					<div class="category_data">
						<c:if test="${recipe.categoryId == 1 }">
					집밥
					</c:if>
						<c:if test="${recipe.categoryId == 2 }">
					다이터트
					</c:if>
						<c:if test="${recipe.categoryId == 3 }">
					탄단지
					</c:if>
						<c:if test="${recipe.categoryId == 4 }">
					초간단
					</c:if>
						<c:if test="${recipe.categoryId == 5}">
					대접
					</c:if>
					</div>
				</div>
				<div class="personnel_box">
					<div class="personnel_items">
						<span class="material-symbols-outlined personnelSymbol"> groups </span>
						<span class="personnel_text">인원</span>
					</div>
					<div class="personnel_data">
						<c:if test="${recipe.personnel == 1 }">
					1인분
					</c:if>
						<c:if test="${recipe.personnel == 2 }">
					2인분
					</c:if>
						<c:if test="${recipe.personnel == 3 }">
					3인분
					</c:if>
						<c:if test="${recipe.personnel == 4 }">
					4인분
					</c:if>
						<c:if test="${recipe.personnel == 5 }">
					5인분이상
					</c:if>
					</div>
				</div>
				<div class="cookingTime_box">
					<div class="cookingTime_items">
						<span class="material-symbols-outlined cookingTimeSymbol"> pace </span>
						<span class="cookingTime_text">소요시간</span>
					</div>
					<div class="cookingTime_data">
						<c:if test="${recipe.cookingTime == 1 }">
					10분이내
					</c:if>
						<c:if test="${recipe.cookingTime == 2 }">
					20분이내
					</c:if>
						<c:if test="${recipe.cookingTime == 3 }">
					30분이내
					</c:if>
						<c:if test="${recipe.cookingTime == 4 }">
					60분이내
					</c:if>
						<c:if test="${recipe.cookingTime == 5 }">
					90분이내
					</c:if>
					</div>
				</div>
				<div class="cookLevel_box">
					<div class="cookLevel_items">
						<span class="material-symbols-outlined cookLevelSymbol"> kid_star </span>
						<span class="cookLevel_text">난이도</span>
					</div>
					<div class="cookLevel_data">
						<c:if test="${recipe.cookLevel == 1 }">
					초하수달
					</c:if>
						<c:if test="${recipe.cookLevel == 2 }">
					하수달
					</c:if>
						<c:if test="${recipe.cookLevel == 3 }">
					중수달
					</c:if>
						<c:if test="${recipe.cookLevel == 4 }">
					고수달
					</c:if>
						<c:if test="${recipe.cookLevel == 5 }">
					초고수달
					</c:if>
					</div>
				</div>
			</div>
			<div class="ingredientContainer">
				<div class="ingredient_text_box">
					<div class="ingredient_text">요리재료</div>
				</div>
				<div class="ingredient_data_Box">
					<c:forEach var="ingredient" items="${ingredient}">
						<div class="ingredientContent">
							<div class="ingredientName">${ingredient.name}</div>
							<div class="ingredientMeasure">${ingredient.measure}</div>
							<div class="ingredient_Line"></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="cookWareContainer">
				<div class="cookWare_text_box">
					<div class="cookWare_text">요리도구</div>
				</div>
				<div class="cookWare_data_Box">
					<c:forEach var="cookWare" items="${cookWare}">
						<div class="cookWareContent">
							<div class="cookWareName">${cookWare.name}</div>
							<div class="cookWareCount">${cookWare.count}개</div>
							<div class="cookWare_Line"></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="body_box">
				<div class="body_text">요리순서</div>
				<div class=" body_data">
					<div class="toast-ui-viewer">
						<script class="body_data" type="text/x-template">${recipe.body}</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="reply_container mt-5 px-3">
	<c:if test="${rq.isLogined() }">
		<form action="../reply/doWrite" method="POST" onsubmit="ReplyWrite__submit(this); return false;">
			<input type="hidden" name="relTypeCode" value="recipe" />
			<input type="hidden" name="relId" value="${recipe.id }" />
			<table class="write-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>내용</th>
						<td>
							<textarea class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" placeholder="내용을 입력해주세요"
								name="body"> </textarea>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input class="btn btn-outline btn-info" type="submit" value="댓글 작성" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</c:if>
	<c:if test="${!rq.isLogined() }">
		<a class="btn btn-outline btn-ghost" href="../member/login">LOGIN</a> 하고 댓글 써
	</c:if>
	<div class="mx-auto">
		<h2>댓글 리스트(${repliesCount })</h2>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 60%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>내용</th>
					<th>작성자</th>
					<th>좋아요</th>
					<th>싫어요</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reply" items="${replies }">
					<tr class="hover">
						<td>${reply.id }</td>
						<td>${reply.regDate.substring(0,10) }</td>
						<td>
							<span id="reply-${reply.id }">${reply.body }</span>
							<form method="POST" id="modify-form-${reply.id }" style="display: none;" action="/usr/reply/doModify">
								<input type="text" value="${reply.body }" name="reply-text-${reply.id }" />
							</form>
						</td>
						<td>${reply.extra__writer }</td>
						<td>${reply.goodReactionPoint }</td>
						<td>${reply.badReactionPoint }</td>
						<td>
							<c:if test="${reply.userCanModify }">
								<%-- 							href="../reply/modify?id=${reply.id }" --%>
								<button onclick="toggleModifybtn('${reply.id}');" id="modify-btn-${reply.id }" style="white-space: nowrap;"
									class="btn btn-outline">수정</button>
								<button onclick="doModifyReply('${reply.id}');" style="white-space: nowrap; display: none;"
									id="save-btn-${reply.id }" class="btn btn-outline">저장</button>
							</c:if>
						</td>
						<td>
							<c:if test="${reply.userCanDelete }">
								<a style="white-space: nowrap;" class="btn btn-outline"
									onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="../reply/doDelete?id=${reply.id }">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>