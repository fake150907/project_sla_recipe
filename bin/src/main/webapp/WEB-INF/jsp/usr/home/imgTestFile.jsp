<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ImgTestFile"></c:set>
<%@ include file="../common/head.jspf"%>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.imgTestFile {
	width: 500px;
	height: 500px;
}
</style>
<section>
	<div class="imgTest_box">
		<img class="imgTestFile"
			src="${imgTestFile.imagePath }+  4f426baf-165f-40fb-8e01-5b9b034c1204_KakaoTalk_20240216_131441639_01.jpg" alt="" />
		${imgTestFile.imagePath }
	</div>
</section>
<%@ include file="../common/foot.jspf"%>