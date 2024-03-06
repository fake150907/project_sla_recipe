<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Recipe WRITE"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<!-- Recipe write 관련 -->
<script type="text/javascript">
	let RecipeWrite__submitFormDone = false;
	function RecipeWrite__submit(form) {
		if (RecipeWrite__submitFormDone) {
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value == 0) {
			alert('제목을 입력해주세요');
			return;
		}
		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		if (markdown.length == 0) {
			alert('내용을 입력해주세요');
			editor.focus();
			return;
		}
		form.body.value = markdown;
		RecipeWrite__submitFormDone = true;
		form.submit();
	};

	function previewThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var thumbnailPreview = document.getElementById('thumbnail-preview');
			thumbnailPreview.src = reader.result;
			thumbnailPreview.style.display = 'block'; // 이미지를 보여줌
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>

<style>
.cooking_information {
	height: 900px;
	display: flex;
	justify-content: center;
	border: 3px solid green;
}

.cooking_information_bgc {
	position: absolute;
	width: 1000px;
	height: 150px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	z-index: -1;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
}

.title_box_bgc, .Thumbnail_box_bgc, .body_box_bgc {
	position: absolute;
	width: 1000px;
	height: 150px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	z-index: -1;
}

.cooking_information_bgc {
	left: 25%;
	top: 17%;
}

.Thumbnail_box_bgc {
	top: 18.8%;
}

.title_box_bgc {
	top: 65%;
}

.category, .cookingTime, .cookLevel, .personnel {
	color: rgba(0, 0, 0, 0.6);
	background-color: #FFFACD;
}

.category .op, .cookingTime .op, .cookLevel .op, .personnel .op {
	background-color: #CDEAC0;
}

.cooking_information_text, .Thumbnail_text, .title_text, .body_text {
	position: absolute;
	z-index: 3;
}

.cooking_information_text {
	top: 13.5%;
	left: 25.5%;
}

.Thumbnail_text {
	top: 11.7%;
	left: 1.8%;
}

.title_text {
	top: 57.7%;
	left: 2.8%;
}

.body_text {
	top: 468px;
	left: 2.8%;
}

.cooking_information_text_bgc, .title_text_bgc, .Thumbnail_text_bgc,
	.body_text_bgc {
	width: 100px;
	height: 40px;
	position: absolute;
	background-color: #CDEAC0;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
}

.cooking_information_text_bgc {
	top: 13%;
	left: 25%;
}

.Thumbnail_text_bgc {
	top: 10%;
}

.title_text_bgc {
	top: 56.2%;
}

.body_text_bgc {
	top: 460px;
}

.cooking_information_danger_text {
	position: absolute;
	font-size: 15px;
	color: rgba(0, 0, 0, 0.6);
	left: 13%;
}

.Thumbnail_data_box {
	position: absolute;
	top: 30%;
}

.title_data_box {
	position: absolute;
	top: 75%;
}

.category_box, .pesonnel_box, .cookingTime_box, .cookLevel_box {
	position: absolute;
	top: 22%;
}

.category_box {
	left: 26.3%;
}

.pesonnel_box {
	left: 32.3%;
}

.cookingTime_box {
	left: 38.7%;
}

.cookLevel_box {
	left: 44.8%;
}

.title_box, .Thumbnail_box, .body_box {
	width: 1000px;
	height: 150px;
}

.toast-ui-editor {
	position: absolute;
	top: 500px;
	width: 1000px;
}

.write-box {
	position: absolute;
	left: 25%;
	top: 30%;
}

.submitBtn {
	position: absolute;
	top: 1100px;
}

.submitBtn {
	width: 120px;
	height: 60px;
	position: absolute;
	left: 43.5%;
	background-color: #EDC127;
	border-radius: 10px;
	opacity: 0.7;
	top: 1150px;
}

.submitBtn_box:hover>.submitBtn {
	background-color: #FFC700;
}
</style>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../recipe/doWrite" method="POST" onsubmit="RecipeWrite__submit(this); return false;"
			enctype="multipart/form-data">
			<input type="hidden" name="body">
			<div class="cooking_information_text_box">
				<span class="cooking_information_text" style="font-weight: bold;">요리정보</span>
				<div class="cooking_information_text_bgc"></div>
			</div>
			<div class="cooking_information_bgc">
				<span class="cooking_information_danger_text">*체크하지 않으면 처벌을 당할 수도 있습니다. 인간.</span>
			</div>
			<div class="category_box">
				<div class="category_text">카테고리</div>
				<div class="category_select">
					<select data-value="${param.categoryId }" class="category select select-bordered select-sm max-w-xs"
						name="category">
						<!-- 									<option selected="selected" disabled>레시피 카테고리를 선택해주세요</option> -->
						<option value="1">집밥</option>
						<option value="2">다이어트</option>
						<option value="3">탄단지</option>
						<option value="4">초간단</option>
						<option value="5">대접</option>
					</select>
				</div>
			</div>
			<div class="pesonnel_box">
				<div class="personnel_text">인원</div>
				<div class="personnel_select">
					<select data-value="${param.personnel }" class="personnel select select-bordered select-sm max-w-xs"
						name="personnel">
						<!-- 									<option selected="selected" disabled>몇인분인지 선택해주세요</option> -->
						<option value="1">1인분</option>
						<option value="2">2인분</option>
						<option value="3">3인분</option>
						<option value="4">4인분</option>
						<option value="5">5인분이상</option>
					</select>
				</div>
			</div>
			<div class="cookingTime_box">
				<div class="cookingTime_text">요리시간</div>
				<div class="cookingTime_select">
					<select data-value="${param.cookingTime }" class="cookingTime select select-bordered select-sm max-w-xs"
						name="cookingTime">
						<!-- 									<option selected="selected" disabled>시간이 얼마나 소요되는지 선택해주세요</option> -->
						<option value="1">10분이내</option>
						<option value="2">15분이내</option>
						<option value="3">20분이내</option>
						<option value="4">30분이내</option>
						<option value="5">60분이내</option>
						<option value="6">90분이내</option>
					</select>
				</div>
			</div>
			<div class="cookLevel_box">
				<div class="cookLevel_text">난이도</div>
				<div class="cookLevel_select">
					<select data-value="${param.cookLevel }" class="cookLevel select select-bordered select-sm max-w-xs"
						name="cookLevel">
						<!-- <option selected="selected" disabled>난이도를 선택해주세요</option> -->
						<option value="1">아무나</option>
						<option value="2">초하수달</option>
						<option value="3">하수달</option>
						<option value="4">고수달</option>
						<option value="5">초고수달</option>
					</select>
				</div>
			</div>
			<div class="write-box table-box-1">
				<div>
					<div class="Thumbnail_box">
						<span class="Thumbnail_text" style="font-weight: bold;">썸네일</span>
						<div class="Thumbnail_text_bgc"></div>
						<div class="Thumbnail_data_box">
							<input type="file" name="files" multiple="multiple" />
							<input type="submit" id="submit" value="전송" />
							<input class="input input-bordered input-primary w-full max-w-xs" type="file" name="divumbnail" accept="image/*"
								onchange="previewThumbnail(event)">
							<img id="divumbnail-preview" style="display: none; max-widdiv: 200px; margin-top: 10px;" alt="Thumbnail Preview">
						</div>
						<div class="Thumbnail_box_bgc">
							<span class=""></span>
						</div>
					</div>
					<div class="title_box">
						<span class="title_text" style="font-weight: bold;">제목</span>
						<div class="title_text_bgc"></div>
						<div class="title_data_box">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title" />
						</div>
						<div class="title_box_bgc">
							<span class=""></span>
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
					<div class="submitBtn_Box">
						<button class="submitBtn btn btn-outline" type="submit" value="">
							<span style="font-size: 20px; font-weight: bold;">작성</span>
						</button>
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