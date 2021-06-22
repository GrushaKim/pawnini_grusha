<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>

</head>
 <%@ include file="../include/Header.jsp" %> 
<body>

<a href="main.do">메인으로 가기</a>
<br><br><br>
This is an order list !!!!!
<br><br><br>

<section id="content">
 
 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList">
  <li>
  <div>
   <p><span>주문번호</span><a href="/getOrderDetails.do?num=${orderList.ord_id}">${orderList.ord_id}</a></p>
   <p><span>수령인</span>${orderList.recipient_name}</p>
   <p><span>주소</span>(${orderList.ord_postcode}) ${orderList.ord_f_addr} ${orderList.ord_s_addr}</p>
   <p><span>연락처</span>${orderList.ord_phone}</p>
   <%-- <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p> --%>
  </div>
  </li>
  </c:forEach>
 </ul>

</section>


</body>
 <%@ include file="../include/Footer.jsp" %> 
</html>