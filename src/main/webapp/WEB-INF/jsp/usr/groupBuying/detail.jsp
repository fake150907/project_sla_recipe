<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GROUPBUYING DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <iframe src="http://localhost:8081/usr/groupBuying/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>

<!-- 눌려 있는 버튼 색상 표현 -->
<style type="text/css">
.already-added {
	background-color: #0D3EA3;
	color: white;
}

.do-update-body {
	display: inline-block;
}
</style>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table-box-1" border="1">
			<tbody>
				<tr>
					<th>번호</th>
					<td>${groupBuying.id }</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${groupBuying.regDate }</td>
				</tr>
				<tr>
					<th>수정날짜</th>
					<td>${groupBuying.updateDate }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${groupBuying.extra__writer }</td>
				</tr>
				<tr>
					<th>동네</th>
					<td>${groupBuying.memberLocationTag }</td>
				</tr>
				<tr>
					<th>구매위치</th>
					<td>${groupBuying.buyingLocation }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${groupBuying.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${groupBuying.body }</td>
				</tr>
			</tbody>
		</table>
		<div class="btns mt-5">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${groupBuying.userCanModify }">
				<a class="btn btn-outline" href="../groupBuying/modify?id=${groupBuying.id }">수정</a>
			</c:if>
			<c:if test="${groupBuying.userCanDelete }">
				<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
					href="../groupBuying/doDelete?id=${groupBuying.id }">삭제</a>
			</c:if>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>