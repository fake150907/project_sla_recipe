<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RECIPE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.recipe-box {
	border-radius: 10px;
	border-color: rgba(217, 217, 217, 1);
	border-style: solid;
	border-width: 1px;
	background-color: rgba(0, 0, 0, 0);
	display: flex;
	padding-bottom: 9px;
	flex-direction: column;
	flex: 1;
	width: 200px;
	display: inline-block;
	margin-bottom: 20px; /* 각 박스 사이의 간격 조정을 위해 추가 */
}

@media ( max-width : 991px) {
	.recipe-box {
		white-space: initial;
	}
}

.recipe-container {
	margin-left: 22.5%;
}

.Thumbnail {
	aspect-ratio: 1.19;
	object-fit: auto;
	object-position: center;
	width: 200px;
	height: 210px;
	border-top-left-radius: 9.3px;
	border-top-right-radius: 9.3px;
	align-self: center;
}

.div-6 {
	display: flex;
	align-items: start;
	gap: 8px;
	margin: 6px 11px 0;
}

@media ( max-width : 991px) {
	.div-6 {
		white-space: initial;
		margin: 0 10px;
	}
}

.profile-img {
	aspect-ratio: 1;
	object-fit: auto;
	object-position: center;
	width: 35px;
	border-radius: 50%;
	margin-top: 10px;
}

.div-7 {
	display: flex;
	flex-direction: column;
}

@media ( max-width : 991px) {
	.div-7 {
		white-space: initial;
	}
}

.div-8 {
	display: flex;
	gap: 20px;
	font-size: 14px;
	color: #000;
	line-height: 100%;
}

@media ( max-width : 991px) {
	.div-8 {
		white-space: initial;
	}
}

.recipe-title {
	font-family: IBM Plex Mono, sans-serif;
	width: 103.7px;
	height: 25px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	overflow: hidden;
	font-size: 15px;
	font-weight: 600;
	margin-top: 15px;
}

.img-3 {
	aspect-ratio: 1.23;
	object-fit: auto;
	object-position: center;
	width: 16px;
	fill: #f00;
}

.div-10 {
	display: flex;
	gap: 20px;
	justify-content: space-between;
}

@media ( max-width : 991px) {
	.div-10 {
		white-space: initial;
	}
}

.recipe-writer {
	color: rgba(0, 0, 0, 0.7);
	font: 12px/117% IBM Plex Mono, sans-serif;
}

.recipe-regDate {
	color: rgba(0, 0, 0, 0.5);
	font: 12px/140% IBM Plex Mono, sans-serif;
}
</style>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="badge badge-outline">${recipesCount }개</div>
			<div class="flex-grow"></div>
			<form action="">
				<select data-value="${param.searchKeywordTypeCode }"
					class="select select-bordered select-sm w-full max-w-xs"
					name="searchKeywordTypeCode">
					<option value="title">title</option>
					<option value="body">body</option>
					<option value="title,body">title+body</option>
				</select> <input value="${param.searchKeyword }" name="searchKeyword"
					type="text" placeholder="searchKeyword?"
					class="input-sm input input-bordered w-48 max-w-xs" />
				<button class="btn btn-ghost btn-sm" type="submit">검색</button>
			</form>
		</div>
	</div>
	<%-- 	<div class="recipe-container">
		<c:forEach var="recipe" items="${recipes }">
			<div class="recipe-box">
				<img class="Thumbnail" src="${rq.getImgUri(recipe.id,relTypeCode)}" onerror="${rq.profileFallbackImgOnErrorHtml}"
					alt="" />
				<div class="div-6">
					<img src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-img" />
					<div class="div-7">
						<div class="div-8">
							<div class="recipe-title">${recipe.title}</div>
						</div>
						<div class="div-10">
							<div class="recipe-writer">${recipe.extra__writer }</div>
							<div class="recipe-regDate">${recipe.regDate.substring(0,10) }</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div> --%>
	<div class="recipe-container">
		<div class="recipe-line">
			<%
			int count = 0;
			%>
			<c:forEach var="recipe" items="${recipes }">
				<%
				if (count != 0 && count % 5 == 0) {
				%>
			
		</div>
		<div class="recipe-line">
			<%
			}
			%>
			<a href="detail?id=${recipe.id }">
				<div class="recipe-box">
					<img class="Thumbnail" src="${rq.getImgUri(recipe.id,relTypeCode)}"
						onerror="${rq.profileFallbackImgOnErrorHtml}" alt="" />
					<div class="div-6">
						<img
							src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
							class="profile-img" />
						<div class="div-7">
							<div class="div-8">
								<div class="recipe-title">${recipe.title}</div>
							</div>
							<div class="div-10">
								<div class="recipe-writer">${recipe.extra__writer }</div>
								<div class="recipe-regDate">${recipe.regDate.substring(0,10) }</div>
							</div>
						</div>
					</div>
				</div>
			</a>
			<%
			count++;
			%>
			</c:forEach>
		</div>
	</div>
	<!-- 	동적 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage"
			value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage"
			value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

		<c:set var="baseUri"
			value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
		<c:set var="baseUri"
			value="${baseUri }&searchKeyword=${searchKeyword}" />

		<c:if test="${startPage > 1 }">
			<a class="btn btn-sm" href="?${baseUri }&page=1">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }"
				href="?${baseUri }&page=${i }">${i }</a>
		</c:forEach>

		<c:if test="${endPage < pagesCount }">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="?${baseUri }&page=${pagesCount }">${pagesCount }</a>
		</c:if>
	</div>
	<!-- 	원래 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">
			<c:forEach begin="1" end="${pagesCount }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }"
					href="?page=${i }">${i }</a>
			</c:forEach>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>