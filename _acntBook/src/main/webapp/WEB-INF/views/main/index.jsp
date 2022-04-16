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
	<h1>Index Page</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>수입</th>
				<th>지출</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cont }" var="list">
				<tr>
					<td><c:out value="${list.income }" /></td>
					<td><c:out value="${list.expense }" /></td>
					<td><c:out value="${list.content }" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>