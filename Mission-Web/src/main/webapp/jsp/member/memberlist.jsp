
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
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
1. t_member 테이블에서 전체게시글 조회
2. 조회된 게시물을 하나씩 웹브라우저 출력 
--%>


<%
MemberDAO dao = new MemberDAO();
List<MemberVO> list = dao.selectAll();
pageContext.setAttribute("list",list);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
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
		<h1>회원 전체 조회</h1>
		<hr>
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<th width="7%">아이디</td>
				<th width="7%">이름</th>
				<th width="7%">비밀번호</th>
				<th width="7%">이메일 아이디</th>
				<th width="7%">전화번호</th>
				<th width="7%">우편번호</th>
				<th width="20%">기본주소</th>
				<th width="20%">상세주소</th>
				<th width="7%">타입</th>
				<th width="7%">날짜</th>
			</tr>
		
			<c:forEach items="${list}" var="member">
			<tr>
			<td><c:out value="${member.id}"/></td>	
			<td><c:out value="${member.name }"/></td>
			<td><c:out value="${member.password }"/></td>
			<td><c:out value="${member.email_id }"/></td>
			<td><c:out value="${member.tel1} -${member.tel2}-${member.tel3}"/></td>
			<td><c:out value="${member.post}"/></td>
			<td><c:out value="${member.basic_addr }"/></td>
			<td><c:out value="${member.detail_addr }"/></td>
			<td><c:out value="${member.type}"/></td>
			<td><c:out value="${member.reg_date}"/></td>
			</tr>
			
			</c:forEach>
			
			
		</table>
		<br>   
<button id="addBtn">회원 등록</button>	
	</div>


</body>
</html>
