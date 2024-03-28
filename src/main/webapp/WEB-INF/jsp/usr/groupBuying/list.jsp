<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GROUPBUYING LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
/* list container */
.table_box {
	border: 1px solid #FFFACD;
	background-color: #FFFACD;
}

.address1_text_box, .address2_text_box, .address3_text_box {
	width: 75px;
	height: 30px;
	left: 1%;
	position: absolute;
	border-radius: 10px;
	background-color: #CDEAC0;
	border: 1px solid rgba(0, 0, 0, 0.05);
}

.address1_text_box {
	top: 16%;
}

.address2_text_box {
	top: 64%;
}

.address3_text_box {
	top: 112%;
}

.address1_text, .address2_text, .address3_text {
	position: absolute;
	font-weight: bold;
	left: 16.5%;
	top: 10%;
}

/* search_location_form_box */
.location_box {
	left: 8%;
	top: 15%;
	position: absolute;
}

.inputLocation {
	width: 350px;
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
	left: 35%;
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
<div class="list_container">
	<div class="address1_text_box">
		<span class="address1_text">${address1 }</span>
	</div>
	<section class="mt-8 text-xl px-4">
		<div class="mx-auto overflow-x-auto">
			<div class="mb-4 flex">
				<div class="flex-grow"></div>
				<form action="">
					<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm w-full max-w-xs"
						name="searchKeywordTypeCode">
						<option value="title">title</option>
						<option value="body">body</option>
						<option value="title,body">title+body</option>
					</select>
					<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
						class="input-sm input input-bordered w-48 max-w-xs" />
					<button class="btn btn-ghost btn-sm" type="submit">검색</button>
				</form>
			</div>
		</div>
		<div class="table_box" style="width: 100%; height: 350px; overflow: auto">
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
	<div class="address2_text_box">
		<span class="address2_text">${address2 }</span>
	</div>
	<section class="mt-8 text-xl px-4">
		<div class="mx-auto overflow-x-auto">
			<div class="mb-4 flex">
				<div class="flex-grow"></div>
				<form action="">
					<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm w-full max-w-xs"
						name="searchKeywordTypeCode">
						<option value="title">title</option>
						<option value="body">body</option>
						<option value="title,body">title+body</option>
					</select>
					<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
						class="input-sm input input-bordered w-48 max-w-xs" />
					<button class="btn btn-ghost btn-sm" type="submit">검색</button>
				</form>
			</div>
		</div>
		<div class="table_box" style="width: 100%; height: 350px; overflow: auto">
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
	<div class="address3_text_box">
		<span class="address3_text">${address3 }</span>
	</div>
	<section class="mt-8 text-xl px-4">
		<div class="mx-auto overflow-x-auto">
			<div class="mb-4 flex">
				<div class="flex-grow"></div>
				<form action="">
					<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm w-full max-w-xs"
						name="searchKeywordTypeCode">
						<option value="title">title</option>
						<option value="body">body</option>
						<option value="title,body">title+body</option>
					</select>
					<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
						class="input-sm input input-bordered w-48 max-w-xs" />
					<button class="btn btn-ghost btn-sm" type="submit">검색</button>
				</form>
			</div>
		</div>
		<div class="table_box" style="width: 100%; height: 350px; overflow: auto">
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
<%@ include file="../common/foot.jspf"%>