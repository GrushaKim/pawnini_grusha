<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="http://code.jquery.com/jquery-1.10.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="insertPaws.do" method="post">
			<table border="1">
				<tr>
					<td>1차분류
					<select name="paws_f_code">
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
					</select>
				<tr>
					<td>2차분류<input type="text" name="paws_s_code">
				<tr>
					<td>이름<input type="text" name="paws_name">
				<tr>
					<td>나이<input type="text" name="paws_age">
				<tr>
					<div class="inputArea">
 <label for="paws_img">이미지</label>
 <input type="file" id="paws_img" name="file" />
 <div class="select_img"><img src="" /></div>
 
 <script>
  $("#paws_img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
</div>
				<tr>
					<td>설명<input type="text" name="paws_desc">
				<tr>
					<td>성별<input type="text" name="paws_sex">
				<tr>
					<td>중성화여부
					<select name="paws_is_neutered">
                  		<option value="Y">Y</option>
                    	<option value="N">N</option>
                    </select>
				<tr>
					<td>건강상태<input type="text" name="paws_health">
				<tr>
					<td><input type="submit" value="등록">
			</table>
		</form>
		<a href="getPawsList.do">목록</a>
	</div>
</body>
</html>