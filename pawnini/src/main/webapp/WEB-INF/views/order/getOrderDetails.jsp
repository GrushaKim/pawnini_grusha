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
   <%@ include file="../include/Header.jsp" %> 
<body>

<br><br><br>
OrderDetails
<br><br><br>

<section id="content">

 <div class="orderInfo">
  <c:forEach items="${orderDetails}" var="orderDetails" varStatus="status">
   
   <c:if test="${status.first}">
    <p><span>주문일</span>${orderDetails.ord_date}</p>
    <p><span>수령인</span>${orderDetails.recipient_name}</p>
    <p><span>연락처</span>${orderDetails.ord_phone}</p>
    <p><span>주소</span>(${orderDetails.ord_postcode}) ${orderDetails.ord_f_addr} ${orderDetails.ord_s_addr}</p>
   <%--  <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderDetails.amount}" /> 원</p> --%>
   </c:if>
   
  </c:forEach>
 </div>
 
 <ul class="orderView">
  <c:forEach items="${orderDetails}" var="orderDetails">     
  <li>
   <div class="thumb">
    <img src="${orderDetails.product_thumb_img}" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명</span>${orderDetails.product_name}<br />
     <span>판매가</span><fmt:formatNumber pattern="###,###,###" value="${orderDetails.product_price}" /> 원<br />
     <span>구입 수량</span>${orderDetails.cart_amount} 개<br />
     <span>주문금액</span><fmt:formatNumber pattern="###,###,###" value="${orderDetails.product_price * orderDetails.cart_amount}" /> 원                  
    </p>
   </div>
  </li>     
  </c:forEach>
 </ul>
</section>


</body>
<%@ include file="../include/Footer.jsp" %>
</html>