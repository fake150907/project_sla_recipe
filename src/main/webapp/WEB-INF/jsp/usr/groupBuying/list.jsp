<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GROUPBUYING LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.table {
	overflow: scroll;
	white-space: nowrap;
}

.address1_text_box, .address2_text_box, .address3_text_box {
	width: 75px;
	height: 30px;
	position: absolute;
	border-radius: 10px;
	background-color: #CDEAC0;
}

.address1_text, .address2_text, .address3_text {
	position: absolute;
	left: 16.5%;
}
</style>

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
	<div>
		<div class="div-box-1 div" border="1">
			<div class="">
				<div class="">번호</div>
				<div class="">날짜</div>
				<div class="">제목</div>
				<div class="">작성자</div>
			</div>
			<div>
				<c:forEach var="groupBuying" items="${groupBuyingsByAddress1 }">
					<div class="hover">
						<div class="">${groupBuying.id }</div>
						<div class="">${groupBuying.regDate.substring(0,10) }</div>
						<div class="">
							<a href="detail?id=${groupBuying.id }">${groupBuying.title }</a>
						</div>
						<div class="">${groupBuying.extra__writer }</div>
					</div>
				</c:forEach>
			</div>
		</div>
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
	<div>
		<div class="div-box-1 div" border="1">
			<div class="">
				<div class="">번호</div>
				<div class="">날짜</div>
				<div class="">제목</div>
				<div class="">작성자</div>
			</div>
			<div>
				<c:forEach var="groupBuying" items="${groupBuyingsByAddress2 }">
					<div class="hover">
						<div class="">${groupBuying.id }</div>
						<div class="">${groupBuying.regDate.substring(0,10) }</div>
						<div class="">
							<a href="detail?id=${groupBuying.id }">${groupBuying.title }</a>
						</div>
						<div class="">${groupBuying.extra__writer }</div>
					</div>
				</c:forEach>
			</div>
		</div>
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
	<div>
		<div class="div-box-1 div" border="1">
			<div class="">
				<div class="">번호</div>
				<div class="">날짜</div>
				<div class="">제목</div>
				<div class="">작성자</div>
			</div>
			<div>
				<c:forEach var="groupBuying" items="${groupBuyingsByAddress3 }">
					<div class="hover">
						<div class="">${groupBuying.id }</div>
						<div class="">${groupBuying.regDate.substring(0,10) }</div>
						<div class="">
							<a href="detail?id=${groupBuying.id }">${groupBuying.title }</a>
						</div>
						<div class="">${groupBuying.extra__writer }</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>