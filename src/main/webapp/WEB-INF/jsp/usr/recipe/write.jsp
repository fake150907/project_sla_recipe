<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RECIPE WRITE"></c:set>
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
        
        $('#fileInput').attr('name', 'file__recipe__' + ${currentId} + '__extra__Img__1');
        
        form.body.value = markdown;
        RecipeWrite__submitFormDone = true;
        form.submit();
    };
</script>

<script>
// 요리재료 작성
var ingredientIndex = 1; // 초기 재료 인덱스

function addInputIngredientFields() {
    // 새로운 input 요소들 생성
    var input1 = createInputField("요리재료를 입력해주세요", "ingredients[" + ingredientIndex + "].name");
    var input2 = createInputField("용량을 입력해주세요", "ingredients[" + ingredientIndex + "].measure");
    var input3 = createHiddenField("ingredients[" + ingredientIndex + "].recipeId", "${currentId}");

    // 생성된 input 요소들을 문서에 추가
    document.getElementById("inputIngredientFieldsContainer").appendChild(input1);
    document.getElementById("inputIngredientFieldsContainer").appendChild(input2);
    document.getElementById("inputIngredientFieldsContainer").appendChild(input3);

    ingredientIndex++; // 인덱스 증가
}

// 요리도구 작성
var cookWareIndex = 1; // 초기 재료 인덱스

function addInputCookWareFields() {
    // 새로운 input 요소들 생성
    var input1 = createInputField("요리도구를 입력해주세요", "cookWares[" + cookWareIndex + "].name");
    var input2 = createInputField("수량을 입력해주세요", "cookWares[" + cookWareIndex + "].count");
    var input3 = createHiddenField("cookWares[" + cookWareIndex + "].recipeId", "${currentId}");

    // 생성된 input 요소들을 문서에 추가
    document.getElementById("inputCookWareFieldsContainer").appendChild(input1);
    document.getElementById("inputCookWareFieldsContainer").appendChild(input2);
    document.getElementById("inputCookWareFieldsContainer").appendChild(input3);

    cookWareIndex++; // 인덱스 증가
}

function createInputField(placeholder, name) {
    var input = document.createElement("input");
    input.className = "input input-bordered";
    input.setAttribute("autocomplete", "off");
    input.setAttribute("type", "text");
    input.setAttribute("placeholder", placeholder);
    input.setAttribute("name", name);
    return input;
}

function createHiddenField(name, value) {
    var input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", name);
    input.setAttribute("value", value);
    return input;
}
</script>

<style>
/* Flexbox 기반 레이아웃 */
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px;
	max-width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
}

.section {
	width: 100%;
	margin-bottom: 20px;
	padding: 20px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	background-color: #FFFACD;
}

.section-title {
	font-size: 18px; font-weight : bold;
	margin-bottom: 10px;
	font-weight: bold;
}

.input-group {
	margin-bottom: 10px;
}

.input-group label {
	display: block;
	font-size: 18px;
	margin-bottom: 5px;
}

.radio-group, .input-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.radio-group label {
	display: flex;
	align-items: center;
	gap: 5px;
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

/* 버튼 스타일 */
button {
	padding: 10px 20px;
	background-color: #EDC127;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}

button:hover {
	background-color: #FFC700;
}

/* input 스타일 */
input[type="text"], input[type="file"] {
	width: 100%;
	padding: 10px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 5px;
}

/* editor 스타일 */
.toast-ui-editor {
	width: 100%;
	height: 400px;
}

/* 반응형 디자인 */
@media ( max-width : 768px) {
	.radio-group, .input-group {
		flex-direction: column;
	}
	button {
		width: 100%;
	}
}
</style>

<section class="container">
	<form action="../recipe/doWrite" method="POST" onsubmit="RecipeWrite__submit(this); return false;"
		enctype="multipart/form-data">
		<input type="hidden" name=">${currentId }">
		<input type="hidden" name="body">

		<div class="section">
			<div class="section-title">요리정보</div>
			<div class="input-group radio-group">
				<label>카테고리</label>
				<label>
					<input type="radio" name="categoryId" value="1" />
					<span>집밥</span>
				</label>
				<label>
					<input type="radio" name="categoryId" value="2" />
					<span>다이어트</span>
				</label>
				<label>
					<input type="radio" name="categoryId" value="3" />
					<span>탄단지</span>
				</label>
				<label>
					<input type="radio" name="categoryId" value="4" />
					<span>초간단</span>
				</label>
				<label>
					<input type="radio" name="categoryId" value="5" />
					<span>대접</span>
				</label>
			</div>

			<div class="input-group radio-group">
				<label>인원</label>
				<label>
					<input type="radio" name="personnel" value="1" />
					<span>1인분</span>
				</label>
				<label>
					<input type="radio" name="personnel" value="2" />
					<span>2인분</span>
				</label>
				<label>
					<input type="radio" name="personnel" value="3" />
					<span>3인분</span>
				</label>
				<label>
					<input type="radio" name="personnel" value="4" />
					<span>4인분</span>
				</label>
				<label>
					<input type="radio" name="personnel" value="5" />
					<span>5인분 이상</span>
				</label>
			</div>

			<div class="input-group radio-group">
				<label>요리시간</label>
				<label>
					<input type="radio" name="cookingTime" value="1" />
					<span>10분 이내</span>
				</label>
				<label>
					<input type="radio" name="cookingTime" value="2" />
					<span>20분 이내</span>
				</label>
				<label>
					<input type="radio" name="cookingTime" value="3" />
					<span>30분 이내</span>
				</label>
				<label>
					<input type="radio" name="cookingTime" value="4" />
					<span>60분 이내</span>
				</label>
				<label>
					<input type="radio" name="cookingTime" value="5" />
					<span>90분 이내</span>
				</label>
			</div>

			<div class="input-group radio-group">
				<label>난이도</label>
				<label>
					<input type="radio" name="cookLevel" value="1" />
					<span>초하수달</span>
				</label>
				<label>
					<input type="radio" name="cookLevel" value="2" />
					<span>하수달</span>
				</label>
				<label>
					<input type="radio" name="cookLevel" value="3" />
					<span>중수달</span>
				</label>
				<label>
					<input type="radio" name="cookLevel" value="4" />
					<span>고수달</span>
				</label>
				<label>
					<input type="radio" name="cookLevel" value="5" />
					<span>초고수달</span>
				</label>
			</div>

			<div class="input-group">
				<label class="section-title">제목</label>
				<input type="text" name="title" />
			</div>
		</div>

		<div class="section">
			<div id="inputIngredientFieldsContainer" class="input-group">
				<label class="section-title">재료</label>
				<input class="input input-bordered" autocomplete="off" type="text" placeholder="요리재료를 입력해주세요"
					name="ingredients[0].name">
				<input class="input input-bordered" autocomplete="off" type="text" placeholder="용량을 입력해주세요"
					name="ingredients[0].measure">
				<input type="hidden" name="ingredients[0].recipeId" value="${currentId}">
			</div>
			<button type="button" onclick="addInputIngredientFields()">재료 추가</button>
		</div>

		<div class="section">
			<div id="inputCookWareFieldsContainer" class="input-group">
				<label class="section-title">요리도구</label>
				<input class="input input-bordered" autocomplete="off" type="text" placeholder="요리도구를 입력해주세요"
					name="cookWares[0].name">
				<input class="input input-bordered" autocomplete="off" type="text" placeholder="수량을 입력해주세요"
					name="cookWares[0].count">
				<input type="hidden" name="cookWares[0].recipeId" value="${currentId}">
			</div>
			<button type="button" onclick="addInputCookWareFields()">요리도구 추가</button>
		</div>

		<div class="section">
			<div class="section-title">레시피 사진</div>
			<div class="input-group">
				<label>레시피 사진</label>
				<input id="fileInput" type="file" name="file">
			</div>
		</div>

		<div class="section">
			<div class="section-title">본문</div>
			<div class="toast-ui-editor"></div>
		</div>

		<button type="submit">등록</button>
	</form>
</section>

<%@ include file="../common/foot.jspf"%>
