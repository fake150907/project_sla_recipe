<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RECIPE MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<!-- Recipe modify 관련 -->
<script type="text/javascript">
	let RecipeModify__submitFormDone = false;
	function RecipeModify__submit(form) {
		if (RecipeModify__submitFormDone) {
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
			alert('내용 써라');
			editor.focus();
			return;
		}
		form.body.value = markdown;
		RecipeModify__submitFormDone = true;
		form.submit();
	}
</script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../recipe/doModify" method="POST" onsubmit="recipeModify__submit(this); return false;">
			<input type="hidden" name="body">
			<input type="hidden" name="id" value="${recipe.id }" />
			<table class="modify-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${recipe.id }</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${recipe.regDate }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${recipe.updateDate }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${recipe.extra__writer }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input class="input input-bordered w-full max-w-xs" type="text" name="title" placeholder="제목을 입력해주세요"
								value="${recipe.title }" />
						</td>
					</tr>

					<tr>
						<th>내용</th>
						<td>
							<%-- 								<textarea class="input input-bordered w-full max-w-xs" type="text" name="body" placeholder="내용을 입력해주세요" />${recipe.body }</textarea> --%>
							<div class="toast-ui-editor">
								<script type="text/x-template">${recipe.body }
      </script>
							</div>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<button class="btn btn-info" type="submit" value="수정">수정</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${recipe.userCanModify }">
				<a class="btn btn-outline" href="../recipe/modify?id=${recipe.id }">수정</a>
			</c:if>
			<c:if test="${recipe.userCanDelete }">
				<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
					href="../recipe/doDelete?id=${recipe.id }">삭제</a>
			</c:if>

		</div>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>