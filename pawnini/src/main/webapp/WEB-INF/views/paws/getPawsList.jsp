<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		
		<h1> 등록 동물 관리 </h1>
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td bgcolor="orange">등록번호
				<td bgcolor="orange">1차분류
				<td bgcolor="orange">2차분류
				<td bgcolor="orange">이름
				<td bgcolor="orange">나이
				<td bgcolor="orange">성별
				<td bgcolor="orange">중성화여부
				<td bgcolor="orange">건강
				<td bgcolor="orange">등록일시
				<td bgcolor="orange" colspan="2">
				
			<c:forEach items="${pawsList}" var="paws">
			<tr>
				<td>${paws.paws_id}	
				<td>${paws.paws_f_code}	
				<td>${paws.paws_s_code}
				<td>${paws.paws_name}
				<td>${paws.paws_age}
				<td>${paws.paws_sex}
				<td>${paws.paws_is_neutered}
				<td>${paws.paws_health}
				<td>${paws.paws_regdate}
				<td><a href="getPaws.do?paws_id=${paws.paws_id}">수정</a>
				<td><a href="deletePaws.do?paws_id=${paws.paws_id}">삭제</a>
			</c:forEach>
		</table>
		<a href="goInsertPaws.do">신규 등록</a>
	</div>
</body>
</html>