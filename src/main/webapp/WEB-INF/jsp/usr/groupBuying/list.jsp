<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GROUPBUYING LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<div>
	<span class="">${address1 }</span>
</div>
<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="badge badge-outline">${groupBuyingsCount }개</div>
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
<div>
	<span class="">${address2 }</span>
</div>
<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="badge badge-outline">${groupBuyingsCount }개</div>
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
<div>
	<span class="">${address3 }</span>
</div>
<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="badge badge-outline">${groupBuyingsCount }개</div>
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



<%@ include file="../common/foot.jspf"%>