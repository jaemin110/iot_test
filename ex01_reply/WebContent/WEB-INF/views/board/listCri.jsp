<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
$(document).ready(function(){
	$("#searchBtn").click(function(){
		keyword=$("#keywordInput").val();
		searchType=$("select option:selected").val();
		self.location="listCri?searchType="+searchType+"&keyword="+keyword;
	});
	$("#newBtn").click(function(ev){
		self.location="listCri";
	});
});
</script>

</head>
<body>
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">LIST ALL PAGE</h3>
		</div>
	</div>
	<div class="box-body">
		<select name="searchType">
			<option value="n" 
				<c:out value="${cri.searchType==null?'selected':''}"/>>
			---</option>
			<option value="t" 
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
			Title</option>
			<option value="c" 
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
			Content</option>
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
		<button id="searchBtn">Search</button>
		<button id="newBtn">New Board</button>
		<table class="table table-bordered">
			<tr>
				<td style="width:10px">BNO</td>
				<td>TITLE</td>
				<td>WRITER</td>
				<td>REGDATE</td>
				<td style="width:40px">VIEWCNT</td>
			</tr>
			<c:forEach items="${list}" var="b">
				<tr>
					<td>${b.bno}</td>
					<td><a href="/board/read?bno=${b.bno}">${b.title}</a></td>
					<td>${b.writer}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${b.regdate}"/></td>
					<td><span class="badge bg-red">${b.viewcnt}</span></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pm.prev}">
				<li><a href="listCri?page=${pageMaker.startPage-1}
				&searchType=${pm.cri.searchType}&keyword=${pm.cri.keyword}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
				<li <c:out value="${pm.cri.page==idx?'class=active':''}"/>>
				<a href="listCri?page=${idx}
				&searchType=${pm.cri.searchType}&keyword=${pm.cri.keyword}">${idx}</a>
			</c:forEach>
			<c:if test="${pm.next&&pm.endPage>0}">
				<li><a href="listCri?page=${pm.endPage+1}
				&searchType=${pm.cri.searchType}&keyword=${pm.cri.keyword}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
<%@include file="../include/footer.jsp" %>
</body>
</html>