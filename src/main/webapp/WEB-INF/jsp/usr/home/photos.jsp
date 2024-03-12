<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
	/* 이미지 업로드 */
	$("#fileItem").on("change", function(e) {
		alert("동작");
	});
</script>
</head>
<form action="">
	<div class="form_section">
		<div class="form_section_title">
			<label>상품 이미지</label>
		</div>
		<div class="form_section_content">
			<input type="file" id="fileItem" name='uploadFile' style="height: 30px;">
		</div>
	</div>
	<button class="">등록</button>
</form>
</body>
</html>