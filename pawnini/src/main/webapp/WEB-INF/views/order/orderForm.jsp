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
.orderInfo { border:5px solid #eee; padding:20px; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           var fullRoadAddr = data.roadAddress; 
           var extraRoadAddr = '';
           
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        	   extraRoadAddr += data.bname;
           }
           if(data.buildingName !== '' && data.apartment === 'Y'){
        	   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.bulidingName);
           }
           if(extraRoadAddr !== ''){
        	   extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           if(fullRoadAddr !== ''){
        	   fullRoadAddr += extraRoadAddr;
           }
           
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           $("[name=ord_postcode]").val(data.zonecode);
           $("[name=ord_f_addr]").val(fullRoadAddr);
        }
    }).open();
}

function orderCancel(){
	window.history.back();
}
function showSelect(ord_payment){
	if(ord_payment == '무통장입금'){
		$('#bank').show();
		$('#card').hide();
		$('#ord_bank').prop("disabled", false);
		$('#ord_card').prop("disabled", true);
	}else if(ord_payment =='카드결제'){
		$('#bank').hide();
		$('#card').show();
		$('#ord_bank').prop("disabled", true);
		$('#ord_card').prop("disabled", false);
	}
}
</script>
</head>
<%@ include file="../include/Header.jsp"%>
<body>


<section id="content">
  
<br><br><br>
	<table border="1">
			<tr>
				<th></th>
				<th>상품명</th>
				<th>판매가</th>
				<th>수량</th>
				<th>합계</th>
			<c:forEach var="row" items="${map.cartList}" varStatus="i">
			<tr>
				<td> <img style="width:100px; height: 150px;" src="${row.product_thumb_img}" />
				<td>
					${row.product_name}
				<td style="width: 80px" align="right">
					<fmt:formatNumber pattern="###,###,###" value="${row.product_price}" />
				<td>
					<input type="number" id="cart_amount" style="width:40px" name="cart_amount" value="${row.cart_amount}" />
					<input type="hidden" id="product_id" name="product_id" value="${row.product_id}" />
					<input type="hidden" id="cart_id" name="cart_id" value="${row.cart_id}" />
					<input type="hidden" id="member_id" name="member_id" value="${member.member_id}" />
				<td style="width:100px" align="right">
				<!-- 아이템당 수량 *가격  = cart_total-->
					<fmt:formatNumber pattern="###,###,###" value="${row.cart_total}" />
			</c:forEach>
				
		</table>
		
		<!-- 주문 정보 입력 -->
				
 <form role="form" method="post" autocomplete="off" action="insertOrder.do">
<div class="orderInfo">
  <div class="inputArea">
   <label for="">수령인</label>
   <input type="text" name="recipient_name" id="orderRec" required />
  </div>
  
  <div class="inputArea">
   <label for="orderPhone">연락처</label>
   <input type="text" name="ord_phone" id="orderPhone" placeholder="010-xxxx-xxxx" required />
  </div>
  
  <div class="inputArea">
   <label for="userAddr1">우편번호</label>
   <input type="text" name="ord_postcode" id="userAddr1" required="required" readonly />
   <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i>우편번호 찾기</button>
  </div>
  
  <div class="inputArea">
   <label for="userAddr2">도로명 주소</label>
   <input type="text" name="ord_f_addr" id="userAddr2" required="required" readonly />
  </div>
  
  <div class="inputArea">
   <label for="userAddr3">상세 주소</label>
   <input type="text" name="ord_s_addr" id="userAddr3" required="required" />
  </div>

  <div class="inputArea">
   <label for="reqMessage">요청사항</label>
   <input type="text" name="reqMessage" id="reqMessage" />
  </div>
  </div>
  <hr>
  
  <!-- 결제정보  -->
  	<div class="orderInfo">
  		<div class="inputArea">
 	<fmt:formatNumber pattern="###,###,###" value="${map.sumTotal}" /> 원 + 
		${map.shippingFee} 원 (5만원 이상 배송비 무료) = 
	결제금액: <fmt:formatNumber pattern="###,###,###" value="${map.finalSum}" /> 원
  	<br>
  		</div>
  		<div class="inputArea">
  		<b>적립금 </b> : 
  		<input name="usedMileage" id="usedMileage" type="text" value="0" size="10" 
  				oninput="chkMileage(this, '${member.member_mileage}')"/>원 
  		&nbsp;(가용 적립금 : <span style="color:scarlet; font-weight:bold">${member.member_mileage} 원</span>
  		<input type="checkbox" onclick="useAllMileage('ㅁ')">전부 사용하기)
  		<input type="button" value="사용하기" onclick="">
  		<p>적립금은 1,000원 이상일 경우 결제에 사용할 수 있습니다.</p>
  		</div>
  	</div>
  	<br>
  	<div class="orderInfo">
  		<div class="inputArea">
   			<label for="ord_payment">결제수단</label>
   			<input type="radio" name="ord_payment" id="ord_payment" value="무통장입금" onclick="showSelect(this.value)" checked />카드결제
   			<input type="radio" name="ord_payment" id="ord_payment" value="카드결제" onclick="showSelect(this.value)"  />무통장입금
   			<input type="radio" name="ord_payment" id="ord_payment" value="카카오페이" />카카오페이
   			<input type="radio" name="ord_payment" id="ord_payment" value="페이코" />PAYCO
   		</div>
   		<div class="inputArea">
   				<span id="bank">
   				<select name="ord_bank" id="ord_bank">
   					<option value="1">카카오뱅크</option>
   					<option value="2">미래은행</option>
   					<option value="3">우리은행</option>
   				</select>
   				</span>
   		</div>
   		<div class="inputArea">
   				<span id="card">
   				<select name="ord_card" id="ord_card">
   					<option value="1">미래카드</option>
   					<option value="2">삼성카드</option>
   					<option value="3">현대카드</option>
   				</select>
   				</span>
   				<span id="card_info">
   				<input type="text" name="card_info" size="20" />
   				</span>
   		</div>
   		
  	</div>
  
   <button type="submit" class="orderBtn">주문</button>
   <button type="button" class="orderCancelBtn" onclick="orderCancel();">취소</button>
  
  
 </form> 

</section>
</body>
<%@ include file="../include/Footer.jsp"%>
</html>