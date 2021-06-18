<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateAdoption.do" method="post">
		<table border="1">
			<tr>
				<td> 작성자 : ${adoption.adoption_name}
			<tr>
				<td>제목<input type="text" name="adoption_title" value="${adoption.adoption_title}">
			<tr>
				<td>내용
				<textarea rows="10" cols="40" name="adoption_content">${adoption.adoption_content}</textarea>
			<tr>
				<td>사진(수정필요) : ${"adoption_f_image"}
			<tr>
				<td><input type="submit" value="등록">
		</table>
	</form>
</body>
</html>
