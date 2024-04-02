<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GROUPBUYING LISTBYMEMBERLOCATIONTAG3"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.list_container {
	position: absolute;
	top: 13%;
	left: 20%;
	display: felx;
	justify-content: center;
	width: 1200px;
	height: 800px;
}

.table_container {
	display: felx;
	align-content: space-between;
	align-content: center;
	width: auto;
	height: auto;
}

.table_container {
	width: auto;
	height: 400px;
}

.table_box1 {
	left: 0;
	background-color: #FFFACD;
	border-radius: 0;
}

.table_box1 {
	top: 10.8%;
}

.address1_text_box {
	width: 75px;
	height: 30px;
	position: absolute;
	top: 4%;
	left: 1.4%;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	background-color: #CDEAC0;
	border: 1px solid rgba(0, 0, 0, 0.05);
}

.address1_text, .address2_text, .address3_text {
	display: flex;
	justify-content: center;
	align-content: center;
	font-weight: bold;
}

/* 게시글 검색창 css */
.search_groupBuying_box {
	width: 1100px;
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
/* 페이지네이션 css */
.pagination1, .pagination2 {
	position: absolute;
}

.pagination1 {
	top: 75%;
	left: 38%;
}

.pagination2 {
	top: 80%;
	left: 32%;
}
/* 전체리스트로 돌아가기 */
.show_LT {
	position: absolute;
	left: 7%;
	top: 3%;
}

.LT {
	color: rgba(0, 0, 0, 0.6);
}
</style>
<div class="list_container">
	<div class="address1_text_box">
		<span class="address1_text">${address3 }</span>
	</div>
	<div class="show_LT">
		<a class="LT btn btn-active btn-link" href="../groupBuying/list">전체리스트보기</a>
	</div>
	<section class="mt-8 text-xl px-4">
		<div class="table_container">
			<div class="search_groupBuying_box">
				<div class="mb-4 flex">
					<div class="badge badge-outline">${groupBuyingsCount }개</div>
					<div class="flex-grow"></div>
					<form action="">
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
				<table class="table_box1 table-box-1 table">
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

			<!-- 	동적 페이징 -->
			<div class="pagination1 flex justify-center mt-3">
				<c:set var="paginationLen" value="3" />
				<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
				<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />


				<c:set var="baseUri" value="?${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
				<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />

				<c:if test="${startPage > 1 }">
					<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
					<button class="btn btn-sm btn-disabled">...</button>
				</c:if>

				<c:forEach begin="${startPage }" end="${endPage }" var="i">
					<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
				</c:forEach>

				<c:if test="${endPage < pagesCount }">
					<button class="btn btn-sm btn-disabled">...</button>
					<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
				</c:if>

			</div>
			<!-- 	원래 페이징 -->
			<div class="pagination2 flex justify-center mt-3">
				<div class="btn-group">
					<c:forEach begin="1" end="${pagesCount }" var="i">
						<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?page=${i }">${i }</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</div>


<%@ include file="../common/foot.jspf"%>