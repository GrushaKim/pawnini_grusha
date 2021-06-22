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
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>

</head>
 <%@ include file="../../include/Header.jsp" %> 
<body>


<section id="content">

 <div class="orderInfo">
  <c:forEach items="${spOrder}" var="spOrder" varStatus="status">
   
   <c:if test="${status.first}">
    <p><span>주문일</span>${spOrder.ord_date}</p>
    <p><span>수령인</span>${spOrder.recipient_name}</p>
    <p><span>연락처</span>${spOrder.ord_phone}</p>
    <p><span>주소</span>(${spOrder.ord_postcode}) ${spOrder.ord_f_addr} ${spOrder.ord_s_addr}</p>
   <%--  <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${spOrder.amount}" /> 원</p> --%>
   </c:if>
   
  </c:forEach>
 </div>
 
 <ul class="orderView">
  <c:forEach items="${spOrder}" var="spOrder">     
  <li>
   <div class="thumb">
    <img src="${spOrder.product_thumb_img}" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명</span>${spOrder.product_name}<br />
     <span>판매가</span><fmt:formatNumber pattern="###,###,###" value="${spOrder.product_price}" /> 원<br />
     <span>구입 수량</span>${spOrder.cart_amount} 개<br />
     <span>주문금액</span><fmt:formatNumber pattern="###,###,###" value="${spOrder.product_price * spOrder.cart_amount}" /> 원                  
    </p>
   </div>
  </li>     
  </c:forEach>
 </ul>
</section>


</body>
</html>