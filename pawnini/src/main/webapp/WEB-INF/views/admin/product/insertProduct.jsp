<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>Insert title here</title>

<!-- <script type="text/javascript">

	function insertProduct() {
		var product_f_code = $("#product_f_code").val();
		var product_s_code = $("#product_s_code").val();
		var product_f_code = $("#product_t_code").val();
		var product_f_code2 = $("#product_t_code2").val();
		var product_brand = $("#product_brand").val();
		var product_name = $("#product_name").val();
		var product_option = $("#product_option").val();
		var product_img = $("#product_img").val();
		var product_desc = $("#product_desc").val();
		var product_stock = $("#product_stock").val();
		var product_price = $("#product_price").val();
		var product_c_price = $("#product_c_price").val();
		
		$.ajax({
			type : "POST",
			url : "insertProduct.do",
			data : {
				"prodcut_f_code" : product_f_code,
				"product_s_code" : product_s_code,
				"product_t_code" : product_t_code,
				"product_t_code2" : product_t_code2,
				"product_brand" : product_brand,
				"product_name" : product_name,
				"product_option" : product_option,
				"product_img" : product_img,
				"product_desc" : product_desc,
				"product_stock" : product_stock,
				"product_price" : product_price,
				"product_c_price" : product_c_price
			},
			success : function(data) {
				alert("등록 성공");
			},
			error : function(error) {
				alert("오류");
			}
		});
		
	}
</script> -->

</head>
<body>
	<div class="insert_product">
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
















