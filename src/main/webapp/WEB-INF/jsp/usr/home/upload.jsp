<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="UPLOAD IMG"></c:set>
<%@ include file="../common/head.jspf"%>
<h1>Image Upload</h1>
<form action="/usr/home/upload" method="post" enctype="multipart/form-data">
	Select image to upload:
	<input type="file" name="file" id="file">
	<input type="submit" value="Upload" name="submit">
</form>
</body>
</html>