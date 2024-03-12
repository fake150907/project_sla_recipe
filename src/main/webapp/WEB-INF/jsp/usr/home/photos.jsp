<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="PHOTOS"></c:set>
<%@ include file="../common/head.jspf"%>
<h1>Uploaded Photos</h1>
<c:forEach var="photoUrl" items="${photoUrls}">
	<img src="${photoUrl}" alt="Uploaded Photo">
</c:forEach>
</body>
</html>