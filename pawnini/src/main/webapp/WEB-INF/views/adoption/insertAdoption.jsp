<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertAdoption.do" method="post">
		<table>
			<tr>
				<td>작성자<input type="text" name="adoption_name">
			<tr>
				<td>제목<input type="text" name="adoption_title">
			<tr>
				<td>내용
				<textarea rows="10" cols="40" name="adoption_content"></textarea>
			<tr>
				<td>사진(수정필요)<input type="text" name="adoption_f_image">
			<tr>
				<td><input type="submit" value="등록">
		</table>
	</form>
</body>
</html>
