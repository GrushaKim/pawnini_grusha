<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="../style/Header.css" />
  </head>
  <body>
  
    <div class="Login">
      <ul class="Login_ul">
      
 	<c:if test="${member == null}">
        <li><a href="gologin.do">LOGIN</a></li>
        <li><a href="signUp.do">SIGN UP</a></li>
 	</c:if>
 	
 	<c:set var="grade" value="${member.member_grade}"/>
    <c:if test="${member != null}">
    	<li>${member.member_nickname}님 환영 합니다.</li>
        <li><a href="myPage.do">My Pages</a></li>
        <li><a href="logout.do">Logout</a></li>
        <c:if test="${grade eq 2}">
         <li class="Manager">
          	관리 메뉴
          <span class="dropmenu">
            <!-- 관리자 카테고리 메뉴 연동 -->
            <span><a href="PawsList.do">분양관리</a></span>
            <span><a href="getMemberList.do">회원관리</a></span>
            <span><a href="getProductList.do">상품관리</a></span>
             <span><a href="getAllOrders.do">주문목록</a></span>
          </span>
        </li>
        </c:if>
    </c:if>
      </ul>
    </div>
    <header class="Header_menu">
      <div class="Title">
        <a href="main.do">
			<img src="images/Rogo.jpg">
        </a>
        <form method="GET" action="goProductList.do">
	        <input class="Header_input" type="text" placeholder="Search..." name="searchKeyword2" />
        </form>
      </div>
      <h3 class="basket"><a href="getOrderList.do">주문목록</a></h3>
      <h3 class="basket"><a href="basket.do">BASKET</a></h3>
      <a class="basket" href="getCartList.do">
        <i class="fas fa-shopping-cart fa-lg"></i>
      </a>
      
      <ul class="Header_ul">
        <li class="Dog_dropmenu">
          	강아지
          <span class="dropmenu">
            <span><a href="goProductList.do?searchOption=dog&searchKeyword=snack">간식</a></span>
            <span><a href="goProductList.do?searchOption=dog&searchKeyword=supplies">용품</a></span>
            <span><a href="goProductList.do?searchOption=dog&searchKeyword=meal">사료</a></span>
          </span>
        </li>
        <li class="Cat_dropmenu">
          	고양이
          <span class="dropmenu">
            <span><a href="goProductList.do?searchOption=cat&searchKeyword=snack">간식</a></span>
            <span><a href="goProductList.do?searchOption=cat&searchKeyword=supplies">용품</a></span>
            <span><a href="goProductList.do?searchOption=cat&searchKeyword=meal">사료</a></span>
          </span>
        </li>
        <li><a href="event.do">이벤트</a></li>
        <li><a href="service.do">고객센터</a></li>

        <li class="Dog_dropmenu">
          <a href="getPawsList.do">분양</a>
          <span class="dropmenu">
            <span><a href="getCatList.do">Cat</a></span>
            <span><a href="getDogList.do">Dog</a></span>
          </span>
        </li>
        <li><a href="getReviewList.do">후기</a></li>
      </ul>
    </header>
        <script
      src="https://kit.fontawesome.com/583cb96774.js"
      crossorigin="anonymous"></script>
  </body>
  
</html>
