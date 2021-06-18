<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>글 목록</h1>
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>공개 여부</td>
				<td>작성일</td>
			</tr>
			<c:forEach items="${csList}" var="cs">
			<tr>
				<td>${cs.cs_id }</td>
				<td>${cs.cs_title }</td>				
				<td>${cs.cs_writer}</td>
				<td>${cs.cs_show }</td>
				<td>${cs.cs_regdate }</td>				
			</tr>
			</c:forEach>
		</table>
		<br>
		<a href="insertCs.jsp">글 등록</a>
</div>
</body>
</html>