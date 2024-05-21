<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GROUPBUYING LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
/* list container */
.list_container {
	display: flex;
	justify-content: center;
}

.table_container {
	position: relative;
	top: 10%;
	display: felx;
	align-content: space-between;
	align-content: center;
	width: 1000px;
	height: 1500px;
}

.table_container1, .table_container2, .table_container3 {
	width: auto;
	height: 400px;
}

.table_box1, .table_box2, .table_box3 {
	position: absolute;
	left: 0;
	background-color: #FFFACD;
	border: 1px solid #FFFACD;
}

.table_box1 {
	top: 10.8%;
}

.table_box2 {
	top: 39.8%;
}

.table_box3 {
	top: 68.8%;
}

.address1_text_box, .address2_text_box, .address3_text_box {
	width: 75px;
	height: 30px;
	position: absolute;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	background-color: #CDEAC0;
	border: 1px solid rgba(0, 0, 0, 0.05);
}

.address2_text_box {
	top: 37.8%;
}

.address3_text_box {
	top: 66.8%;
}

.address1_text, .address2_text, .address3_text {
	display: flex;
	justify-content: center;
	align-content: center;
	font-weight: bold;
}

/* search_location_form_box */
.location_box {
	left: 23.8%;
	top: 15%;
	position: absolute;
}

.inputLocation {
	width: 250px;
	height: 46.5px;
	background-color: #FFFACD;
	opacity: 0.5;
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

.logcation_submit_btn {
	width: 70.56px;
	height: 46px;
	left: 100%;
	top: 0;
	position: absolute;
	background: rgba(205, 234, 192, 0.40);
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}

.searchLocationBtn {
	width: 70.56px;
	height: 46px;
	position: absolute;
	background: rgba(205, 234, 192, 0.60);
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}

.logcation_submit_btn:hover>.searchLocationBtn {
	background: rgba(205, 234, 192, 1);
}
/* 게시글 검색창 css */
.search_groupBuying_box {
	position: absolute;
	top: 15%;
	left: 48%;
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
	width: 150px;
	color: rgba(0, 0, 0, 0.6);
	background-color: #FFFACD;
}

.searchKeywordTypeCode .op {
	background-color: #FFFACD;
}

.op:hover {
	background: rgba(205, 234, 192, 1);
}
/* 태그별 전체 게시글 보기 버튼 */
.show_LT1, .show_LT2, .show_LT3 {
	position: absolute;
	left: 7%;
}

.show_LT1 {
	top: 8%;
}

.show_LT2 {
	top: 37%;
}

.show_LT3 {
	top: 66%;
}

.LT1, .LT2, .LT3 {
	color: rgba(0, 0, 0, 0.6);
}
</style>
<div class="list_container">
	<div class="search_container">
		<div class="search_location_form_box">
			<form action="">
				<div class="location_box">
					<div class="location_data">
						<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputLocation w-full"
							autocomplete="off" type="text" placeholder="위치를 입력해주세요" name="InputLocation" />
					</div>
					<div class="logcation_submit_btn">
						<span class="material-symbols-outlined">pin_drop</span>
						<input style="font-size: 30px; font-family: Inter; font-weight: 600;" type="submit" value=""
							class="searchLocationBtn" />
					</div>
				</div>
			</form>
		</div>
		<div class="search_groupBuying_box">
			<form action="" method="POST" onsubmit="searchKeyword__submit(this); return false;">
				<select data-value="${param.searchKeywordTypeCode }"
					class="searchKeywordTypeCode select select-bordered select-sm w-full max-w-xs" name="searchKeywordTypeCode">
					<option class="op" value="title">title</option>
					<option class="op" value="body">body</option>
					<option class="op" value="title,body">title+body</option>
				</select>
				<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
					class="searchKeyword input-sm input input-bordered w-48 max-w-xs" />
				<button class="SearchBtn btn btn-ghost btn-sm" type="submit">검색</button>
			</form>
		</div>
	</div>
	<div class="table_container">
		<div class="table_container1">
			<div class="address1_text_box">
				<span class="address1_text">${address1 }</span>
			</div>
			<div class="show_LT1">
				<a class="LT1 btn btn-active btn-link" href="../groupBuying/listByMemberLocationTag1">전체보기</a>
			</div>
			<section class="mt-8 text-xl px-4">
				<div class="table_box1" style="width: 100%; height: 350px; overflow: auto">
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
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="groupBuying" items="${groupBuyingsByAddress1 }">
								<tr class="hover">
									<td>${groupBuying.id }</td>
									<td>${groupBuying.regDate.substring(0,10) }</td>
									<td>
										<a href="detail?id=${groupBuying.id }">${groupBuying.title }</a>
									</td>
									<td>${groupBuying.extra__writer }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>
		<div class="table_container2">
			<div class="address2_text_box">
				<span class="address2_text">${address2 }</span>
			</div>
			<div class="show_LT2">
				<a class="LT2 btn btn-active btn-link" href="../groupBuying/listByMemberLocationTag2">전체보기</a>
			</div>
			<section class="mt-8 text-xl px-4">
				<div class="table_box2" style="width: 100%; height: 350px; overflow: auto">
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
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="groupBuying" items="${groupBuyingsByAddress2 }">
								<tr class="hover">
									<td>${groupBuying.id }</td>
									<td>${groupBuying.regDate.substring(0,10) }</td>
									<td>
										<a href="detail?id=${groupBuying.id }">${groupBuying.title }</a>
									</td>
									<td>${groupBuying.extra__writer }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>
		<div class="table_container3">
			<div class="address3_text_box">
				<span class="address3_text">${address3 }</span>
			</div>
			<div class="show_LT3">
				<a class="LT3 btn btn-active btn-link" href="../groupBuying/listByMemberLocationTag3">전체보기</a>
			</div>
			<section class="mt-8 text-xl px-4">
				<div class="table_box3" style="width: 100%; height: 350px; overflow: auto">
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
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="groupBuying" items="${groupBuyingsByAddress3 }">
								<tr class="hover">
									<td>${groupBuying.id }</td>
									<td>${groupBuying.regDate.substring(0,10) }</td>
									<td>
										<a href="detail?id=${groupBuying.id }">${groupBuying.title }</a>
									</td>
									<td>${groupBuying.extra__writer }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>