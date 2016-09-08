<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<table>
	<c:forEach var="r" items="${re}">
		<tr>
			<td width="100px">${r.pelyer}</td>
			<td width="500px">${r.replytext}</td>
			<td width="100px"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${r.updatedate}"/></td>
			<td width="20px"><input type="button" value="삭제" onclick="dele(${r.rno},${r.bno})"></td>
		</tr>
	</c:forEach>
</table>
<div class="text-center">
		<ul class="pagination">
			<c:if test="${pm.prev}">
				<li><a href="javascript:page(${pageMaker.startPage-1},${bno})">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
				<li <c:out value="${pm.cri.page==idx?'class=active':''}"/>>
				<a href="javascript:page(${idx},${bno})">${idx}</a>
			</c:forEach>
			<c:if test="${pm.next&&pm.endPage>0}">
				<li><a href="javascript:page(${pm.endPage+1},${bno})">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>