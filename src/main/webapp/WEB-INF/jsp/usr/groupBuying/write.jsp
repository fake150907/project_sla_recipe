<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<!-- GroupBuying write 관련 -->
<script type="text/javascript">
	let GroupBuyingWrite__submitFormDone = false;
	function GroupBuyingWrite__submit(form) {
		if (GroupBuyingWrite__submitFormDone) {
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
		GroupBuyingWrite__submitFormDone = true;
		form.submit();
	}
</script>

<style>
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
</style>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../groupBuying/doWrite" method="POST" onsubmit="GroupBuyingWrite__submit(this); return false;">
			<input type="hidden" name="body">
			<div class="write_container">
				<div class="write_box">
					<div class="writer_box">
						<div class="writer_text">작성자</div>
						<div class="writer_data_box">
							<div class="writer_data">${rq.loginedMember.nickname }</div>
						</div>
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
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="구매장소를 입력해주세요" name="buyingLocation" />
						</div>
					</div>
					<div class="title_box">
						<div class="title_text">제목</div>
						<div class="title_data_box">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title" />
						</div>
					</div>
					<div class="body_box">
						<span class="body_text" style="font-weight: bold;">내용</span>
						<div class="body_text_bgc"></div>
						<div class="body_data_box">
							<div class="toast-ui-editor">
								<script type="text/x-template"></script>
							</div>
						</div>
					</div>
					<div class="">
						<div class=""></div>
						<div class="">
							<button class="btn btn-outline btn-info" type="submit" value="작성">작성</button>
						</div>
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