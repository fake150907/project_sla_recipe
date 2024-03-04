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
	border: 3px solid green;
	display: flex;
	justify-content: center;
}

.cooking_information_bgc {
	
}
</style>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../recipe/doWrite" method="POST" onsubmit="RecipeWrite__submit(this); return false;">
			<input type="hidden" name="body">
			<div class="cooking_information">
				<div class="cooking_information_text_box">
					<span class="cooking_information_text">요리정보</span>
					<div class="cooking_information_bgc"></div>
				</div>
				<div class="category_box">
					<div class="category_text">카테고리</div>
					<div class="category_select">
						<select class="select select-ghost w-full max-w-xs" name="category">
							<!-- 									<option selected="selected" disabled>레시피 카테고리를 선택해주세요</option> -->
							<option value="1">일반식</option>
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
						<select class="select select-ghost w-full max-w-xs" name="personnel">
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
						<select class="select select-ghost w-full max-w-xs" name="cookingTime">
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
						<select class="select select-ghost w-full max-w-xs" name="cookLevel">
							<!-- <option selected="selected" disabled>난이도를 선택해주세요</option> -->
							<option value="1">아무나</option>
							<option value="2">초하수달</option>
							<option value="3">하수달</option>
							<option value="4">고수달</option>
							<option value="5">초고수달</option>
							<option value="6">90분이내</option>
						</select>
					</div>
				</div>
				<table class="write-box table-box-1" border="1">
					<tbody>

						<tr>
							<th>썸네일</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" type="file" name="thumbnail" accept="image/*"
									onchange="previewThumbnail(event)">
								<br>
								<img id="thumbnail-preview" style="display: none; max-width: 200px; margin-top: 10px;" alt="Thumbnail Preview">
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="제목을 입력해주세요" name="title" />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div class="toast-ui-editor">
									<script type="text/x-template"></script>
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<button class="btn btn-outline btn-info" type="submit" value="작성">작성</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<div class="btns">
			<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>