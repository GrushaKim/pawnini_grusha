<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<ol class="breadcrumb">
  <li>상품 후기 </li>
  <li><c:if test="${member != null}">${member.member_id } 접속 중 </c:if></li>
  <li><c:if test="${member != null}"><a href="logout.do">로그아웃</a></c:if></li>
  <li><c:if test="${member == null}"><a href="login.jsp">로그인</a></c:if></li>
</ol>