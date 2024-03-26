<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GROUPBUYING MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<!-- GroupBuying modify 관련 -->
<script type="text/javascript">
	let GroupBuyingModify__submitFormDone = false;
	function GroupBuyingModify__submit(form) {
		if (GroupBuyingModify__submitFormDone) {
			return;
		}
		form.title.value = form.title.value.trim();
		form.memberLocationTag.value = form.memberLocationTag.value.trim();
		form.buyingLocation.value = form.buyingLocation.value.trim();
		if (form.title.value == 0) {
			alert('제목을 입력해주세요.');
			return;
		}
		if (form.memberLocationTag.value == 0) {
			alert('위치를 선택해주세요.');
			return;
		}
		if (form.buyingLocation.value == 0) {
			alert('구매장소를 입력해주세요.');
			return;
		}
		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		if (markdown.length == 0) {
			alert('내용을 입력해주세요.');
			editor.focus();
			return;
		}
		form.body.value = markdown;
		GroupBuyingModify__submitFormDone = true;
		form.submit();
	}
</script>

<style>
/* memberLocationTag css */
label {
	font-size: 18px;
	line-height: 2rem;
	padding: 0.2em 0.4em;
}

[type="radio"], span {
	vertical-align: middle;
}

[type="radio"] {
	appearance: none;
	border: max(2px, 0.1em) solid #CDEAC0;
	border-radius: 50%;
	width: 1.25em;
	height: 1.25em;
	transition: border 0.2s ease-in-out;
}

[type="radio"]:checked {
	border: 0.4em solid #ECDF66;
}

[type="radio"]:focus-visible {
	outline-offset: max(2px, 0.1em);
	outline: max(2px, 0.1em) dotted #ECDF66;
}

[type="radio"]:hover {
	box-shadow: 0 0 0 max(4px, 0.2em) #CDEAC0;
	cursor: pointer;
}

[type="radio"]:hover+span {
	cursor: pointer;
}

[type="radio"]:disabled {
	background-color: lightgray;
	box-shadow: none;
	opacity: 1;
	cursor: not-allowed;
}

[type="radio"]:disabled+span {
	opacity: 0.7;
	cursor: not-allowed;
}
/* 게시글 작성 관련 css*/
.modify_box {
	display: flex;
	justify-content: center;
}

.modify_container {
	display: flex;
	justify-content: center;
}

/* box 노멀라이즈 */
.modify_box {
	position: absolute;
	width: 1040px;
	height: 1000px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	z-index: -1;
}

.writer_box, .memberLocationTag_box, .regDate_box, .buyingLocation_box,
	.title_box {
	position: absolute;
	width: 380px;
}

.regDate_box {
	top: 1%;
	left: 2%;
}

.memberLocationTag_box {
	top: 6%;
	left: 2%;
}

.buyingLocation_box {
	top: 11%;
	left: 2%;
}

.title_box {
	top: 16.5%;
	left: 2%;
}

.body_box {
	position: absolute;
	width: 1000px;
	top: 25%;
}

.submit_btn_box {
	position: absolute;
	top: 90%;
}

/* text 노멀라이즈 */
.memberLocationTag_text, .regDate_text, .buyingLocation_text,
	.title_text, .body_text {
	width: 80px;
	height: 35px;
	font-size: 16.6px;
	font-weight: semi bold;
	position: absolute;
	background-color: #CDEAC0;
	border-radius: 10px;
	display: flex;
	justify-content: center;
	align-content: :center;
}

.writer_text, .memberLocationTag_text, .buyingLocation_text, .title_text
	{
	top: 22%;
	left: -0.1%;
}

.body_text {
	top: -5%;
}

/* data_box 노말라이즈 */
.memberLocationTag_btn_box, .regDate_data_box, .buyingLocation_data_box,
	.title_data_box {
	position: absolute;
	left: 23%;
	display: flex;
	justify-content: center;
	align-content: center;
	display: flex;
}

/* input 요소 노말라이즈 */
.buyingLocation, .title_data {
	width: 350px;
	height: 46.5px;
	background-color: #FFFACD;
	border: 0.50px rgba(0, 0, 0, 0.20) solid;
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
}
</style>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../groupBuying/doModify" method="POST" onsubmit="GroupBuyingModify__submit(this); return false;">
			<input type="hidden" name="body">
			<div class="modify_container">
				<div class="modify_box">
					<div class="regDate_box">
						<div class="regDate_text">작성날짜</div>
						<div class="regDate_data_box">${groupBuying.regDate }</div>
					</div>
					<div class="memberLocationTag_box">
						<div class="memberLocationTag_text">위치</div>
						<div class="memberLocationTag_btn_box">
							<label>
								<input type="radio" name="memberLocationTag" value="1" />
								<span style="widdiv: 75px; display: inline-block;">둔산동</span>
							</label>
							<label>
								<input type="radio" name="memberLocationTag" value="2" />
								<span style="widdiv: 75px; display: inline-block;">갈마동</span>
							</label>
							<label>
								<input type="radio" name="memberLocationTag" value="3" />
								<span style="widdiv: 75px; display: inline-block;">탄방동</span>
							</label>
						</div>
					</div>
					<div class="buyingLocation_box">
						<div class="buyingLocation_text">구매장소</div>
						<div class="buyingLocation_data_box">
							<input class="input buyingLocation" autocomplete="off" type="text" placeholder="구매장소를 입력해주세요"
								value="${groupBuying.buyingLocation }" name="buyingLocation" />
						</div>
					</div>
					<div class="title_box">
						<div class="title_text">제목</div>
						<div class="title_data_box">
							<input class="input title_data" autocomplete="off" type="text" placeholder="제목을 입력해주세요"
								value="${groupBuying.title }" name="title" />
						</div>
					</div>
					<div class="body_box">
						<span class="body_text" style="font-weight: bold;">내용</span>
						<div class="body_data_box">
							<div class="toast-ui-editor">
								<script type="text/x-template">${groupBuying.body}</script>
							</div>
						</div>
					</div>
					<div class="submit_btn_box">
						<button class="btn btn-outline btn-info" type="submit" value="작성">수정</button>
					</div>
				</div>
			</div>
		</form>
		<div class="btns">
			<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>