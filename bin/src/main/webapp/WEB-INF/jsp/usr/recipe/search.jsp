<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Search"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.PopularitySearchBar {
	width: 1105.50px;
	left: 23%;
	top: 20%;
	height: 203px;
	position: relative;
}

.Frame1 {
	width: 600px;
	height: 60px;
	left: 23%;
	top: 130%;
	position: absolute;
	justify-content: center;
	gap: 30px;
	display: inline-flex;
}

/*	인기검색어 tag css  */
.popularity_tag1_box, .popularity_tag2_box, .popularity_tag3_box,
	.popularity_tag4_box, .popularity_tag5_box, .popularity_tag6_box {
	width: 130px;
	height: 60px;
	position: relative;
}

.popularity_tag1, .popularity_tag2, .popularity_tag3, .popularity_tag4,
	.popularity_tag5, .popularity_tag6 {
	width: 80px;
	height: 40px;
	left: 0px;
	top: 0px;
	position: absolute;
	display: flex;
	justify-content: center;
	align-content: center;
	background: rgba(123.93, 230.56, 230.56, 0.60);
	border-radius: 30px;
	border: 3px rgba(0, 0, 0, 0.50) solid;
	background: rgba(123.93, 230.56, 230.56, 0.60);
	background: rgba(123.93, 230.56, 230.56, 0.60)
}

.TodayTop10_box {
	width: 1093.50px;
	height: 61px;
	left: 12px;
	top: 60px;
	position: absolute;
}

.TodayTop10_Text {
	font-size: 50px;
	position: absolute;
	left: 38%;
	top: 20%;
}

.Line1 {
	width: 1093.50px;
	height: 0px;
	left: 0px;
	top: 0;
	position: absolute;
	border: 2px #180A6B solid;
}

.Line2 {
	width: 1093.50px;
	height: 0px;
	left: 0px;
	top: 150%;
	position: absolute;
	border: 2px #180A6B solid;
}

/* 검색창 css  */
.searchKeyword_box {
	left: 32%;
	top: 90%;
	position: absolute;
}

.searchKeyword {
	width: 350px;
	height: 46.5px;
	background-color: #FFFACD;
	border: 0.50px rgba(0, 0, 0, 0.20) solid;
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
}

.material-symbols-outlined {
	font-size: 40px;
	top: 8%;
	left: 15%;
	position: absolute;
	z-index: 6;
}

.searchKeyword_submit_btn {
	width: 70.56px;
	height: 46px;
	left: 100%;
	top: 0;
	position: absolute;
	background: rgba(205, 234, 192, 0.60);
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}

.SearchBtn {
	width: 70.56px;
	height: 46px;
	position: absolute;
	background: rgba(205, 234, 192, 0.60);
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}

.searchKeyword_submit_btn:hover>.SearchBtn {
	background: rgba(205, 234, 192, 1);
}

.searchKeywordTypeCode {
	position: absolute;
	top: 90%;
	left: 22%;
	color: rgba(0, 0, 0, 0.6);
	background-color: #FFFACD;
	color: rgba(0, 0, 0, 0.6)
}

.searchKeywordTypeCode .op {
	background-color: #FFFACD;
}

.op:hover {
	background: rgba(205, 234, 192, 1);
}
</style>

<script type="text/javascript">
	let searchKeyword__submitFormDone = false;
	function searchKeyword__submit(form) {
		if (searchKeyword__submitFormDone) {
			return;
		}
		form.searchKeywordTypeCode.value = form.searchKeywordTypeCode.value
				.trim();
		form.inputsearchKeyword.value = form.inputsearchKeyword.value.trim();

		if (form.inputsearchKeyword.value == 0) {
			alert('검색어를 입력해주세요');
			editor.focus();
			return;
		}

		searchKeyword__submitFormDone = true;
		form.submit();
	}
</script>

<div class="PopularitySearchBar">
	<div class="TodayTop10_box">
		<div class="Line1"></div>
		<div class="TodayTop10_Text">인기검색어</div>
		<div class="Line2"></div>
	</div>
	<form action="../recipe/searchList" method="POST" onsubmit="searchKeyword__submit(this); return false;">
		<select data-value="${param.searchKeywordTypeCode }"
			class="searchKeywordTypeCode select select-bordered select-sm max-w-xs" name="searchKeywordTypeCode">
			<option class="op" value="title">제목</option>
			<option class="op" value="extra__writer">작성자</option>
			<option class="op" value="category">카테고리</option>
		</select>
		<div class="searchKeyword_box">
			<div class="searchKeyword_data">
				<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="searchKeyword w-full"
					autocomplete="off" type="text" placeholder="검색어를 입력해주세요" name="searchKeyword" />
			</div>
			<div class="searchKeyword_submit_btn">
				<input style="font-size: 30px; font-family: Inter; font-weight: 600;" type="submit" value="" class="SearchBtn" />
				<span class="material-symbols-outlined"> search </span>
			</div>
		</div>
	</form>
	<div class="Frame1">
		<div class="popularity_tag1_box">
			<div class="popularity_tag1">다이어트</div>
		</div>
		<div class="popularity_tag2_box">
			<div class="popularity_tag2">단백질</div>
		</div>
		<div class="popularity_tag3_box">
			<div class="popularity_tag3">자취생</div>
		</div>
		<div class="popularity_tag4_box">
			<div class="popularity_tag4">짜투리</div>
		</div>
		<div class="popularity_tag5_box">
			<div class="popularity_tag5">간단</div>
		</div>
		<div class="popularity_tag6_box">
			<div class="popularity_tag6">집밥</div>
		</div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>