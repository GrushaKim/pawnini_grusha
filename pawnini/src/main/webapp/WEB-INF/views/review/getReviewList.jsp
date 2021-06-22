<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getReviewList</title>
<style type="text/css">
	li {
		list-style: none;
		float: left;
		padding: 6px;
	}
	.main_title {
		text-align: center;
		padding: 20px auto;
		color: rosyBrown;
	}
	a, a:hover, a:focus, a:active {
		color: black;
		text-decoration: none;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div>
			<%@include file="reviewNav.jsp" %>
		</div>
		<div class="main_title">
		<h1> 후기 목록 </h1>
		</div>
		
		<form role="searchForm" method="get">
		<div class="search_row">
			<div class="col-xs-2 col-sm-2">
				<select name="searchType" class="form-control">
					<option value="n"<c:out value="${scri.searchType == null ? 'selected' : '' }"/>>-----</option>
					<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
					<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
					<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : '' }"/>>제목+내용</option>
				</select>
			</div>
			
			<div class="col-xs-10 col-sm-10">
				<div class="input-group">
					<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control">
					<span class="input-group-btn">
						<button id="searchBtn" type="button" class="btn btn-default">검색</button>
					</span>
				</div>
			</div>
		
				<script>
					$(function(){
						$("#searchBtn").click(function(){
							self.location = "/getReviewList.do"+'${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()); 
						});
					});
				</script>
	<section id="container">
		
		<table class="table table-hover">
			<tr>
				<td bgcolor="orange">번호
				<td bgcolor="orange">상품번호
				<td bgcolor="orange">글쓴이
				<td bgcolor="orange">제목
				<td bgcolor="orange">크기
				<td bgcolor="orange">평점
				<td bgcolor="orange">등록일
				<td bgcolor="orange" colspan="2">
				
			<c:forEach items="${reviewList}" var="review">
			<tr>
				<td>${review.rev_id}	
				<td>${review.product_id}	
				<td>${review.rev_writer}
				<td><a href="/getReview.do?rev_id=${review.rev_id}&
														page=${scri.page}&
														perPageNum=${scri.perPageNum}&
														searchType=${scri.searchType}&
														keyword=${scri.keyword}">${review.rev_title}
					<c:if test="${review.rev_com_cnt ne 0}">
						<small><b>[&nbsp;<c:out value="${review.rev_com_cnt}"/>&nbsp;]</b></small>
					</c:if></a>
				<td>${review.rev_f_category}
				<td>${review.rev_stars}
				<td><fmt:formatDate value="${review.rev_date}" pattern="yyyy-MM-dd" />
				<%-- <td><a href="getReview.do?rev_id=${review.rev_id}">수정</a>
				<td><a href="deleteReview.do?rev_id=${review.rev_id}">삭제</a> --%>
			</c:forEach>
		</table>
		</section>
		<div class="col-md-offset-3">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="getReviewList${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx ? 'class=info ' : '' }"/>>
					<a href="getReviewList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="getReviewList${pageMaker.makeSearch(pageMaker.endPage +1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
		<a href="/review/insertReviewView.do">후기 작성</a>
	</div>
	</form>
	</div>
</body>
</html>