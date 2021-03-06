<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
#delete_btn{
	background-color: pink;
}
</style>
</head>
<body>
<div class="table table-info table-hover">
<h1>수정페이지</h1>
	<form id="modifyForm" action="/board/modify" method="post">
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdate" readonly="readonly" value='<fmt:formatDate  pattern="yyyy-MM-dd" value="${pageInfo.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="updatedate" readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.updatedate}"/>' >
	</div>
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록페이지</a>
		<a class="btn" id="modify_btn">수정완료</a>
		<a class="btn" id="delete_btn">삭제하기</a>
		<a class="btn" id="cancel_btn">수정취소</a>
	</div>
	</form>
	
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
	</form>
</div>
<script>

	let form = $("#infoForm"); // 페이지 이동 form (리스트 페이지 이동, 조회페이지 이동)
	let mForm = $("#modifyForm"); // 페이지 데이터 수정 form
	
	// 목록버튼
	$("#list_btn").on("click", function(e){
		
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	// 수정버튼
	$("#modify_btn").on("click", function(e){
		
		mForm.submit();
	});
	
	// 취소버튼
	$("#cancel_btn").on("click", function(e){
		
		form.attr("action", "/board/get");
		form.submit();
	});
	
	$("#delete_btn").on("click", function(e){
		
		form.attr("action", "/board/delete");
		form.attr("method", "post");
		form.submit();
	});
	
	
</script>
</body>
</html>