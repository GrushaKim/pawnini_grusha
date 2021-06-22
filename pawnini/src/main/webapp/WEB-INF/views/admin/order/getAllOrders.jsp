<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orders span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
</head>
 <%@ include file="../../include/Header.jsp" %> 
<body>
<ul class="orders">
 <c:forEach items="${allOrders}" var="orders">
 <li>
 <div>
  <p><span>주문번호&nbsp;</span><a href="getOrder.do?num=${orders.ord_id}">${orders.ord_id}</a></p>
  <p><span>주문인 계정&nbsp;</span>${orders.member_id}</p>
  <p><span>주문일자&nbsp;</span>${orders.ord_date}</p>
  <p><span>수령인&nbsp;</span>${orders.recipient_name}</p>
  <p><span>주소&nbsp;</span>(${orders.ord_postcode}) ${orders.ord_f_addr} ${orders.ord_s_addr}</p>
  <%-- <p><span>주문 금액</span><fmt:formatNumber pattern="###,###,###" value="${orders.amount}" /> 원</p>  --%>
 </div>
 </li>
 <hr>
 </c:forEach>
</ul>
</body>
<%@ include file="../../include/Footer.jsp" %>
</html>