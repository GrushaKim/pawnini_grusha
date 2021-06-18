<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li>
		<c:if test="${member != null}">
			<p>${member.member_id}님 환영합니다. </p>
		</c:if>
	</li>
</ul>
<div align="center">
	<a href="getPawsList.do">동물관리</a>
	<a href="getCsList.do">고객서비스</a>
	<a href="getAdoptionList.do">분양</a>
	<a href="getReviewList.do">후기</a>
	<a href="login.jsp">로그인</a>
	<a href="/view/signUp.jsp">회원가입</a>
</div>
</body>
</html>