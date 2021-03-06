
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
작업 순서
1. t_board 테이블에서 전체게시글 조회
2. 조회된 게시물을 하나씩 웹브라우저 출력 
--%>

<%
BoardDAO dao = new BoardDAO();
List<BoardVO> list = dao.selectAll();
//공유 영역에 등록해야 함. 이제 el도 쓰기 위해. 4가지 공유영역은 page, context, request, session이 있음 
pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		location.href = 'writeForm.jsp'
	})
})
</script>
</head>
<!-- http://localhost9999/Mission-Web/jsp/board/list.jsp -->
<body>

	<div align="center">
		<hr>
		<h1>전체게시글 조회</h1>
		<hr>
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<td width="7%">번호</td>
				<th>제목</th>
				<th width="7%">작성자</td>
				<th width="20%">등록일</td>
			</tr>
			
			<c:forEach items="${list}" var="board">
			<tr>
			<td>${board.no }</td> 
			<td>
			<a href="detail.jsp?no=${board.no }">
			<c:out value="${board.title }"/>
			</a>
			</td>
			<td>${board.writer }</td>
			<td><c:out value="${board.regDate }"/></td>
			
			</tr>
			</c:forEach>
			
			
						
		</table>
		<br>
		<button id="addBtn">새글등록</button>
		
	
	</div>


</body>
</html>
