<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>CS 등록</h1>
	<form action="insertCs.do" method="post">
		<table>
			<tr>
				<td>제목<input type="text" name="cs_title"></td>
			</tr>
			<tr>
				<td>작성자<input type="text" name="cs_writer"></td>
			</tr>
			<tr>
				<td>공개 여부
						<select name="cs_show">
	                  		<option value="Y">Y</option>
	                    	<option value="N">N</option>
                    	</select>
				</td>
			</tr>
			<tr>
				<td>작성일<input type="date" name="cs_regdate"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="getCsList.do">글 목록</a>
</div>
</body>
</html>