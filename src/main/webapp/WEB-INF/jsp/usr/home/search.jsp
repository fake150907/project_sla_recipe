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
	width: 949px;
	height: 60px;
	left: 73px;
	top: 143px;
	position: absolute;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 30px;
	display: inline-flex;
}

/*	인기검색어 tag css  */
.popularity_tag1, .popularity_tag2, .popularity_tag3, .popularity_tag4,
	.popularity_tag5, .popularity_tag6 {
	width: 130px;
	height: 60px;
	position: relative;
}

.Rectangle5 {
	width: 130px;
	height: 60px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: rgba(123.93, 230.56, 230.56, 0.60);
	border-radius: 30px;
	border: 3px rgba(0, 0, 0, 0.50) solid;
}

.TodayTop10Text {
	width: 1093.50px;
	height: 61px;
	left: 12px;
	top: 60px;
	position: absolute;
}

.Line7 {
	width: 1093.50px;
	height: 0px;
	left: 0px;
	top: 30.50px;
	position: absolute;
	border: 3px #180A6B solid;
}

/* 검색창 css  */
.searchKeyword_box {
	left: 1.5%;
	top: 15%;
	position: absolute;
}

.inputsearchKeyword {
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
	color: rgba(0, 0, 0, 0.6);
	background-color: #FFFACD;
}

.searchKeywordTypeCode .op {
	background-color: #FFFACD;
}
<<<<<<< HEAD
=======

.op:hover {
	background: rgba(205, 234, 192, 1);
}
>>>>>>> 8830125ab1f6bb878018ae6112ad7711b94bd968
</style>

<div class="PopularitySearchBar">
	<form action="">
		<select data-value="${param.searchKeywordTypeCode }"
			class="searchKeywordTypeCode select select-bordered select-sm max-w-xs" name="searchKeywordTypeCode">
			<option class="op" value="title">제목</option>
			<option class="op" value="body">작성자</option>
			<option class="op" value="category">카테고리</option>
		</select>
		<div class="searchKeyword_box">
			<div class="searchKeyword_data">
				<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputsearchKeyword w-full"
					autocomplete="off" type="text" placeholder="위치를 입력해주세요" name="InputsearchKeyword?" />
			</div>
			<div class="searchKeyword_submit_btn">
				<span class="material-symbols-outlined"> search </span>
				<input style="font-size: 30px; font-family: Inter; font-weight: 600;" type="submit" value="" class="SearchBtn" />
			</div>
		</div>
	</form>
	<div class="Frame1">
		<div class="popularity_tag1">
			<div class="Rectangle5">다이어트</div>
		</div>
		<div class="popularity_tag2">
			<div class="Rectangle5">단백질</div>
		</div>
		<div class="popularity_tag3">
			<div class="Rectangle5">자취생</div>
		</div>
		<div class="popularity_tag4">
			<div class="Rectangle5">짜투리</div>
		</div>
		<div class="popularity_tag5">
			<div class="Rectangle5">간단</div>
		</div>
		<div class="popularity_tag6">
			<div class="Rectangle5">집밥</div>
		</div>
	</div>
	<div class="TodayTop10Text">
		<div class="Line7"></div>
		<div>인기검색어</div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>