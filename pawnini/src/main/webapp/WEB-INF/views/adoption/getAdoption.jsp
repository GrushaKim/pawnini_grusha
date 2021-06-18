<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table border="1">
			<tr>
				<td>제목
				<td>작성자
				<td>내용
			<tr>
				<td>${adoption.adoption_title}
				<td>${adoption.adoption_name}
				<td>${adoption.adoption_content}
		</table>
	</div>
	<a href="goUpdate.do?adoption_id=${adoption.adoption_id}">수정</a>
	<a href="deleteAdoption.do?adoption_id=${adoption.adoption_id}">삭제</a>
</body>
</html>
