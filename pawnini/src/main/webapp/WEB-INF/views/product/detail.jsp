<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../style/detail.css" />
<link rel="stylesheet" href="../style/main.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
//장바구니 추가
	function addToCart() {
		var product_id = $("#product_id").val();
		var cart_amount = $("#cart_amount").val();

		var data = {
			product_id : product_id,
			cart_amount : cart_amount,
		};

		$.ajax({
			url : "addToCart.do",
			type : "post",
			data : data,
			success : function() {
				swal({
					icon : "success",
					text : "장바구니로 이동하시겠습니까?",
					buttons : [ "예", "아니오" ],
				}).then(function(isConfirm) {
					if (isConfirm) {
						window.location.reload();
					} else {
						window.location.href = "getCartList.do";
						$("#cart_amount").val("1");
					}
				});

			},
			error : function() {
				swal("", "로그인 후 이용해 주시기 바랍니다.", "warning").then(function() {
					window.location.href = "login.do";
				});
			},
		})
	}
// 바로 구매 시
	function goToPurchase() {
		var product_id = $("#product_id").val();
		var cart_amount = $("#cart_amount").val();

		var data = {
			product_id : product_id,
			cart_amount : cart_amount,
		};

		$.ajax({
			url : "addToCart.do",
			type : "post",
			data : data,
			success : function() {
				swal("", "주문서로 이동합니다.", "info");
				window.location.href = "orderFormView.do";
			},
			error : function() {
				swal("", "로그인 후 이용해 주시기 바랍니다.", "warning").then(function() {
					window.location.href = "login.do";
				});
			},
		});
	}
</script>
<%@ include file="../include/Header.jsp"%>
<body>

	<div class="grid">
		<div class="product_image">
			<img src="${product.product_img }">
		</div>
		<div>
			<ul class="product_dis">
				<li>${product.product_brand}</li>
				<li>${product.product_name}</li>
				<li>❤❤❤❤</li>
				<c:set var="c_price" value="${product.product_c_price}" />
				<c:set var="price" value="${product.product_price}" />
				<script type="text/javascript">
					var c_price = '<c:out value = "${product.product_c_price}"/>'
					var price = '<c:out value = "${product.product_price}"/>'
					var sale = c_price - price;
					$(document).ready(function() {
						$("#salePrice").text(sale + "원");
					});
				</script>
				<li>정가<span>${product.product_c_price} 원</span></li>
				<li>판매가<span>${product.product_price} 원</span></li>

				<li>할인된 가격<span id="salePrice"></span></li>
				<li class="js-clock">남은시간 <span class="clock">00:00</span>
				</li>
			</ul>
			<div class="product_stock">
				<div class="stpck_one">
					<ul>
						<li>재고:</li>
						<li>${product.product_stock}개</li>
					</ul>
				</div>
				<div>
					<ul>
						<li>무료배송</li>
						<li>😘</li>
					</ul>
				</div>
				<div>
					<ul>
						<li>신속배송</li>
						<li>🎁</li>
					</ul>

				</div>
			</div>
			<div class="button">
				<input type="hidden" id="product_id" value="${product.product_id}" />
				<select id="cart_amount">
					<c:forEach begin="1" end="10" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>

				<button type="button" class="button_two" onclick="addToCart();">장바구니
					담기</button>
				<c:set var="stock" value="${product.product_stock}" />
				<c:if test="${product.product_stock != 0 }">
					<button class="button_two" onclick="goToPurchase();">바로구매</button>
				</c:if>
				<c:if test="${product.product_stock == 0 }">
					<button class="button_two">품절</button>
				</c:if>
			</div>
		</div>
	</div>
	<div class="product_Information">
		<h1>상품 상세 정보</h1>
	</div>
	<div>
		<div align="center">
			<img src="${product.product_img }"><br>
			${product.product_desc}
		</div>
	</div>




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<script src="./time.js"></script>
</body>
<%@ include file="../include/Footer.jsp"%>

</html>
