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
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>

</head>
<script>
		$(document).ready(function(){
	   $(".delivery1_btn").click(function(){
	    $(".delivery").val("배송 중");
	    $("#orderStatus").text("배송 중");
	     run(); 
	   });
	   
	   $(".delivery2_btn").click(function(){
	    $(".delivery").val("배송 완료");
	    $("#orderStatus").text("배송 완료");
	     run(); 
	  
	  $(".cancel_btn").click(function(){
		  $(".delivery").val("주문 취소");
		  $("#orderStatus").text("주문 취소");
		  /* run(); */
	  })
	    
	   });
	   
	   function run(){
		   $(".updateOrdStatus").submit();
	   };
	});
</script>
   <%@ include file="../include/Header.jsp" %> 
<body>

<br><br><br>


<section id="content">

 <div class="orderInfo">
  <c:forEach items="${allOrderDetails}" var="allDetails" varStatus="status">
   
   <c:if test="${status.first}">
    <p><b>주문번호          </b>${allDetails.ord_id}</p>
    <p><b>주문일자          </b>${allDetails.ord_date}</p>
    <p><b>주문현황          </b><span id="orderStatus">${allDetails.ord_status}</span></p>
    
    <div class="deliveryChange">
	 <form role="form" method="post" class="updateOrdStatus" action="updateOrdStatus.do">
	 
	  <input type="hidden" name="ord_id" value="${allDetails.ord_id}" />
	  <input type="hidden" name="ord_status" class="delivery" value="배송 준비 중" />
	  
	  
	  <button type="button" class="delivery1_btn">배송 중</button>
	  <button type="button" class="delivery2_btn">배송 완료</button>
	  <button type="button" class="cancel_btn">취소</button>
	  
 </form>
 </div>
    <hr>
    <p><span>결제수단</span>카드결제&nbsp;&nbsp;(${allDetails.ord_card_info1})</p>
    <p><span>최종결제금액</span>&nbsp; <fmt:formatNumber pattern="###,###,###" value="${allDetails.ord_total}" />&nbsp;원&nbsp;
    <c:if test="${mileage != 0}">
    (사용한 적립금: <fmt:formatNumber pattern="#,###" value="${allDetails.ord_used_mileage}" />&nbsp;원)
    </c:if>
		

    <hr>
    <p><span>수령인명</span>${allDetails.recipient_name}</p>
    <p><span>배송지</span>(${allDetails.ord_postcode}) ${allDetails.ord_f_addr} ${allDetails.ord_s_addr}</p>
    <p><span>연락처</span>${allDetails.ord_phone}</p>
    <p><span>요청사항</span>${allDetails.ord_req_msg}</p>
   </c:if>
   
   
  </c:forEach>
 </div>
 <ul class="orderView">
  <c:forEach items="${allOrderDetails}" var="allDetails">     
  <li>
   <div class="thumb">
    <img src="${allDetails.product_thumb_img}" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명</span>${allDetails.product_name}<br />
     <span>판매가</span><fmt:formatNumber pattern="###,###,###" value="${allDetails.product_price}" /> 원<br />
     <span>수량</span>${allDetails.cart_amount} 개<br />
     <span>합계</span><fmt:formatNumber pattern="###,###,###" value="${allDetails.product_price * allDetails.cart_amount}" /> 원                  
    </p>
   </div>
  </li>     
  </c:forEach>
 </ul>
</section>


</body>
<%@ include file="../include/Footer.jsp" %>
</html>