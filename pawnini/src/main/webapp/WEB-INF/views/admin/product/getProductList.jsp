<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../style/getList.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script>
	function addToCart(){
		var product_id = $("#product_id").val();		
		var cart_amount = $("#cart_amount").val();		
		
		var data = {
				product_id : product_id,
				cart_amount: cart_amount
		};
		
		$.ajax({
			url : "addToCart.do",
			type : "post",
			data : data,
			success : function(result){
				if(result==1){
				alert("장바구니로 이동합니다.");
				$("#cart_amount").val("1");
				location.href = "getCartList.do";
			} else {
				alert("로그인 후 이용하시기 바랍니다.");
				$("#cart_amount").val("1");
			}},
			error : function(){
				alert("카트 담기 실패");
			}
		})
	}
</script>
   <%@ include file="../../include/Header.jsp" %> 
<body>

    <div align="center">
       
       <h1> 상품 관리 리스트 </h1>
       <table border="1">
          <tr class="head">
             <td>등록번호
             <td>사진
             <td>1차분류
             <td>2차분류
             <td>3-1차분류
             <td>3-2차분류
             <td>브랜드
             <td>상품명
             <td>상품옵션
             <td>재고
             <td>가격
             <td>등록일시
             <td colspan="2">
          <c:forEach items="${productList}" var="product">
          <input type="hidden" id="product_id" name="product_id" value="${product.product_id}" />
          <tr>
             <td>${product.product_id}
             <td><img src="${product.product_thumb_img}" class="thu_img">   
             <td>${product.product_f_code}   
             <td>${product.product_s_code}
             <td>${product.product_t_code}
             <td>${product.product_t_code2}
             <td>${product.product_brand}
             <td>${product.product_name}
             <td>${product.product_option}
             <td>${product.product_stock}
             <td>${product.product_price}
             <td>${product.product_date}
             <td><a href="getProduct.do?product_id=${product.product_id}">수정</a>
             <td><a href="deleteProduct.do?product_id=${product.product_id}">삭제</a>
             <td>
             	<input type="number" id="cart_amount" />
             <td><p class="addToCart">
             <button type="button" class="addToCartBtn" onclick="addToCart()">장바구니</button>
             </p>
          </c:forEach>
       </table>
       <div class="button">
       <a href="goInsertProduct.do">신규 등록</a><br>
       <a href="getPawsList.do">상품페이지</a>
      </div>
    </div>
 </body>

    <%@ include file="../../include/Footer.jsp" %>
</html>