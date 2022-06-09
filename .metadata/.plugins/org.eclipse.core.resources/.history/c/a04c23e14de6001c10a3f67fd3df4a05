<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
BoardVO b = new BoardVO();
b.setNo(1);
b.setTitle("텍스트");
//pageContext영역에 객체 등록
//이름 : board 값 : 생성된 BoardVO 객체 넣고 싶음 

pageContext.setAttribute("board", b);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
no : <%= b.getNo() %><BR>
no : <%=((BoardVO)pageContext.getAttribute("board")).getNo() %> <BR>
no : ${board.no }<Br>

title: <%=((BoardVO)pageContext.getAttribute("board")).getTitle() %><BR>
title : ${board.title}<BR>
<%-- aaa : ${board.aaa }<BR> --%>
</body>
</html>