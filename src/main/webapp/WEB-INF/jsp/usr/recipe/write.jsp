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
<!-- 요리재료 작성 -->
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

<!-- 요리도구 작성 -->
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
    input.className = "input input-bordered input-primary w-full max-w-xs";
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

.title_box_bgc, .Thumbnail_box_bgc, .body_box_bgc, .cookWare_box_bgc,
	.ingredient_box_bgc {
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
	top: 10.2%;
}

.title_box_bgc {
	top: 36.65%;
}

.ingredient_box_bgc {
	top: 63.1%;
}

.cookWare_box_bgc {
	top: 89.55%;
}

.categoryId, .cookingTime, .cookLevel, .personnel {
	color: rgba(0, 0, 0, 0.6);
	background-color: #FFFACD;
}

.categoryId .op, .cookingTime .op, .cookLevel .op, .personnel .op {
	background-color: #CDEAC0;
}

.cooking_information_text, .Thumbnail_text, .title_text, .body_text,
	.ingredient_text, .cookWare_text {
	position: absolute;
	z-index: 3;
}

.cooking_information_text {
	top: 13.5%;
	left: 25.5%;
}

.Thumbnail_text {
	top: 5.7%;
	left: 1.8%;
}

.title_text {
	top: 32.2%;
	left: 2.8%;
}

.ingredient_text {
	top: 58.7%;
	left: 1%;
}

.cookWare_text {
	top: 85.2%;
	left: 1%;
}

.body_text {
	top: 111.7%;
	left: 2.8%;
}

.cooking_information_text_bgc, .title_text_bgc, .Thumbnail_text_bgc,
	.body_text_bgc, .ingredient_text_bgc, .cookWare_text_bgc {
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
	top: 5%;
}

.title_text_bgc {
	top: 31.5%;
}

.ingredient_text_bgc {
	top: 58%;
}

.cookWare_text_bgc {
	top: 84.5%;
}

.body_text_bgc {
	top: 111%;
}

.cooking_information_danger_text {
	position: absolute;
	font-size: 15px;
	color: rgba(0, 0, 0, 0.6);
	left: 13%;
}

.Thumbnail_data_box {
	position: absolute;
	top: 17%;
}

.title_data_box {
	position: absolute;
	top: 43%;
}

.ingredient_data_box {
	position: absolute;
	top: 69%;
}

.cookWare_data_box {
	position: absolute;
	top: 95%;
}

.categoryId_box, .personnel_box, .cookingTime_box, .cookLevel_box {
	position: absolute;
}

.categoryId_box {
	left: 26.3%;
	top: 18%;
}

.personnel_box {
	left: 26.3%;
	top: 21%;
}

.cookingTime_box {
	left: 26.3%;
	top: 24%;
}

.cookLevel_box {
	left: 26.3%;
	top: 27%;
}

.categoryId_text, .personnel_text, .cookingTime_text, .cookLevel_text {
	position: absolute;
	width: 150px;
	top: 4px;
}

.categoryId_btn_box, .personnel_btn_box, .cookingTime_btn_box,
	.cookLevel_btn_box {
	position: absolute;
	width: 700px;
	height: 50px;
	left: 100px;
}

.title_box, .Thumbnail_box, .body_box, .ingredient_box, .cookWare_box {
	width: 1000px;
	height: 150px;
}

.toast-ui-editor {
	position: absolute;
	top: 116%;
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
	top: 1500px;
}

.submitBtn_box:hover>.submitBtn {
	background-color: #FFC700;
}

/* radioBtn */
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

/* Global CSS */
fieldset {
	display: flex;
	justify-content: center;
	border: none;
	margin: 0;
	padding: 40px 20px;
}
</style>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../recipe/doWrite" method="POST" onsubmit="RecipeWrite__submit(this); return false;"
			enctype="multipart/form-data">
			<input type="hidden" name=">${currentId }">
			<input type="hidden" name="body">
			<div class="cooking_information_text_box">
				<span class="cooking_information_text" style="font-weight: bold;">요리정보</span>
				<div class="cooking_information_text_bgc"></div>
			</div>
			<div class="cooking_information_bgc"></div>
			<!-- radioBtn칸 -->
			<div class="categoryId_box">
				<div class="categoryId_text" style="font-size: 18px;">카테고리</div>
				<div class="categoryId_btn_box">
					<label>
						<input type="radio" name="categoryId" value="1" />
						<span style="width: 75px; display: inline-block;">집밥</span>
					</label>
					<label>
						<input type="radio" name="categoryId" value="2" />
						<span style="width: 75px; display: inline-block;">다이어트</span>
					</label>
					<label>
						<input type="radio" name="categoryId" value="3" />
						<span style="width: 75px; display: inline-block;">탄단지</span>
					</label>
					<label>
						<input type="radio" name="categoryId" value="4" />
						<span style="width: 75px; display: inline-block;">초간단</span>
					</label>
					<label>
						<input type="radio" name="categoryId" value="5" />
						<span style="width: 75px; display: inline-block;">대접</span>
					</label>
				</div>
			</div>
			<div class="personnel_box">
				<div class="personnel_text" style="font-size: 18px;">인원</div>
				<div class="personnel_btn_box">
					<label>
						<input type="radio" name="personnel" value="1" />
						<span style="width: 75px; display: inline-block;">1인분</span>
					</label>
					<label>
						<input type="radio" name="personnel" value="2" />
						<span style="width: 75px; display: inline-block;">2인분</span>
					</label>
					<label>
						<input type="radio" name="personnel" value="3" />
						<span style="width: 75px; display: inline-block;">3인분</span>
					</label>
					<label>
						<input type="radio" name="personnel" value="4" />
						<span style="width: 75px; display: inline-block;">4인분</span>
					</label>
					<label>
						<input type="radio" name="personnel" value="5" />
						<span style="width: 90px; display: inline-block;">5인분이상</span>
					</label>
				</div>
			</div>
			<div class="cookingTime_box">
				<div class="cookingTime_text" style="font-size: 18px;">요리시간</div>
				<div class="cookingTime_btn_box">
					<label>
						<input type="radio" name="cookingTime" value="1" />
						<span style="width: 75px; display: inline-block;">10분이내</span>
					</label>
					<label>
						<input type="radio" name="cookingTime" value="2" />
						<span style="width: 75px; display: inline-block;">20분이내</span>
					</label>
					<label>
						<input type="radio" name="cookingTime" value="3" />
						<span style="width: 75px; display: inline-block;">30분이내</span>
					</label>
					<label>
						<input type="radio" name="cookingTime" value="4" />
						<span style="width: 75px; display: inline-block;">60분이내</span>
					</label>
					<label>
						<input type="radio" name="cookingTime" value="5" />
						<span style="width: 75px; display: inline-block;">90분이내</span>
					</label>
				</div>
			</div>
			<div class="cookLevel_box">
				<div class="cookLevel_text" style="font-size: 18px;">난이도</div>
				<div class="cookLevel_btn_box">
					<label>
						<input type="radio" name="cookLevel" value="1" />
						<span style="width: 75px; display: inline-block;">초하수달</span>
					</label>
					<label>
						<input type="radio" name="cookLevel" value="2" />
						<span style="width: 75px; display: inline-block;">하수달</span>
					</label>
					<label>
						<input type="radio" name="cookLevel" value="3" />
						<span style="width: 75px; display: inline-block;">중수달</span>
					</label>
					<label>
						<input type="radio" name="cookLevel" value="4" />
						<span style="width: 75px; display: inline-block;">고수달</span>
					</label>
					<label>
						<input type="radio" name="cookLevel" value="5" />
						<span style="width: 75px; display: inline-block;">초고수달</span>
					</label>
				</div>
			</div>
			<div class="write-box table-box-1">
				<div class="Thumbnail_box">
					<span class="Thumbnail_text" style="font-weight: bold;">썸네일</span>
					<div class="Thumbnail_text_bgc"></div>
					<div class="Thumbnail_data_box">
						<input id="fileInput" placeholder="이미지를 선택해주세요" type="file" />
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
				<div class="ingredient_box">
					<span class="ingredient_text" style="font-weight: bold;">요리재료</span>
					<div class="ingredient_text_bgc"></div>
					<div class="ingredient_data_box">
						<!-- 				<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="요리재료를 입력해주세요" name="ingredienName" />
						<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="용량을 입력해주세요" name="ingredienMeasure" /> -->
						<div id="inputIngredientFieldsContainer">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="요리재료를 입력해주세요" name="ingredients[0].name">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="용량을 입력해주세요" name="ingredients[0].measure">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="hidden"
								name="ingredients[0].recipeId" value="${currentId }">
						</div>
						<button type="button" onclick="addInputIngredientFields()">추가</button>
					</div>
					<div class="ingredient_box_bgc">
						<span class=""></span>
					</div>
				</div>
				<div class="cookWare_box">
					<span class="cookWare_text" style="font-weight: bold;">요리도구</span>
					<div class="cookWare_text_bgc"></div>
					<div class="cookWare_data_box">
						<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="요리도구를 입력해주세요" name="cookWareName" />
						<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="개수를 입력해주세요" name="cookWareCount" />
					</div>
					<div class="cookWare_data_box">
						<div id="inputCookWareFieldsContainer">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="요리도구를 입력해주세요" name="cookWares[0].name">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="수량을 입력해주세요" name="cookWares[0].count">
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="hidden"
								name="cookWares[0].recipeId" value="${currentId }">
						</div>
						<button type="button" onclick="addInputCookWareFields()">추가</button>
					</div>
					<div class="cookWare_box_bgc">
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
		</form>
		<div class="btns">
			<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>