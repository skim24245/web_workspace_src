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

<%--
http://localhost:9999/Lecture-Web/jsp/jstl/core/exam04.jsp?type=S or 
http://localhost:9999/Lecture-Web/jsp/jstl/core/exam04.jsp?type=U
 --%>

<c:if test="${empty param.type }">
<h2>type 파라미터가 전송되지 않았습니다</h2>
</c:if>


<c:if test="${param.type == 'S' }">
<h2>반갑습니다 관리자님</h2>
</c:if>

<c:if test="${param.type eq 'U' }">
<h2>반갑습니다 일반사용자님</h2>
</c:if>



</body>
</html>