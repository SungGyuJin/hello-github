<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여기는 메인페이지</h1>
	<table border="1">
		<thead>
			<tr>
				<th>닉네임</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="board">
			<tr>
				<td><c:out value="${board.nickname }" /></td>
				<td><c:out value="${board.title }" /></td>
				<td><c:out value="${board.content }" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br>
	<a href="../board/register">글 등록</a>
</body>
</html>