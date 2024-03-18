<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ImgTest"></c:set>
<%@ include file="../common/head.jspf"%>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../home/doImgTest" enctype="multipart/form-data" method="POST">
			<div class="imgFile_box">
				<input type="file" id="fileItem" name='inputImgFile' style="height: 30px;" multiple />
			</div>
			<input type="submit" class="btn imgFile_submit_Btn" />
		</form>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>