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
value 속성만 지정 : <c:out value="hello JSTL...." /><BR>
el msg : ${msg}<Br>
msg : <c:out value="${msg}" default = "msg 변수 찾을 수 없음" /><br>
escapeXML =true 설정 <BR>
<c:set var="msg" value="<em>hello......</em><hr>"/>
<c:out value="${msg}"/>

escapeXML =false 설정 <BR>
<c:out value="${msg}" escapeXml="false"/>
${msg}

</body>
</html>