<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>Insert title here</title>


</head>
   <%@ include file="../../include/Header.jsp" %> 
<body>
	<div class="insert_product" align="center">
		<form action="insertProduct.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>1차 분류 : 
					<select name="product_f_code">
						<option value="DOG">강아지</option>
						<option value="CAT">고양이</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>2차 분류 : 
					<select name="product_s_code">
						<option value="MEAL">사료</option> 
						<option value="SNACK">간식</option> 
						<option value="SUPPLIES">용품</option> 
					</select>
				</td>
			</tr>
			<tr>
				<td>3-1차분류 : 
					<input type="text" name="product_t_code">
				</td>
			</tr>
			<tr>
				<td>3-2차분류 : 
					<input type="text" name="product_t_code2">
				</td>
			</tr>
			<tr>
				<td>브랜드 :
					<input type="text" name="product_brand">
				</td>
			</tr>
			<tr>
				<td>상품명 :
					<input type="text" name="product_name">
				</td>
			</tr>
			<tr>
				<td>상품 옵션 :
					<input type="text" name="product_option">
				</td>
			</tr>
			<tr>
				<td>
					<label for="product_img">상품 이미지: </label>
					<input type="file" name="file" id="product_img">
				</td>
			</tr>
			<tr>
				<td>미리보기
				<div class="select_img"><img src="" /></div>
				</td>
			</tr>
			<tr>
				<td>상품 설명 :
					<textarea rows="10" cols="40" name="product_desc"></textarea>
				</td>
			</tr>
			<tr>
				<td>상품 재고 :
					<input type="text" name="product_stock">
				</td>
			</tr>
			<tr>
				<td>상품 가격 :
					<input type="text" name="product_price">
				</td>
			</tr>
			<tr>
				<td>상품 원가 :
					<input type="text" name="product_c_price">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="등록하기">
				</td>
			</tr>	
		</table>
		</form>

	</div>
</body>
    <%@ include file="../../include/Footer.jsp" %>
 <script>
  $("#product_img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

</html>
















