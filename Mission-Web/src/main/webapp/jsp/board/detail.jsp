<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=23 이렇게 날라옴.데이터베이스 키보드에 가서 해당하는 게시글을 가져와서 화면에 뿌려주면 됌.
/*
작업순서
1. no 파라미터 추출
2. 추출된 no(number)를 t_board에서 추출한다음 해당 게시물 조회
3. 조회된 게시물을 화면에 출력

1~2번 단계만 java 코드로 만들어주고 3번만 html
*/

//get방식이기때문에 set encoding 할 필요 없음.
int no = Integer.parseInt(request.getParameter("no"));
BoardDAO dao = new BoardDAO();
BoardVO board= dao.selectByno(no);//여기서는 no로 보냈지만 boardvo로 묶어서 보내도 됌
pageContext.setAttribute("board", board);//뒤에 board는 자바빈즈 클래스
//공유영역에 등록해야 html에서 가지고 와서 화면에 뿌려줌. 이때 el이나 jsp로 뿌려줌
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function doAction(type){
	switch(type){
	case 'U' : 
		location.href = "update.jsp?no=${param.no}";
		break;
	case 'D' : 
	   if(confirm('삭제하시겠습니까?')){
		   location.href = "delete.jsp?no=${param.no}"
	   }
		break;
	case 'L' : 
		location.href = "list.jsp";
		break;
	}
}
</script>

</head>
<body>
   <div align="center">
      <hr>
      <h1>게시판 상세</h1>
      <hr>
      <br>
      <table border="1" style="width: 80%">
      <tr>
         <th width="25%">번호</th>
         <td>${board.no}</td> 
      </tr>
      <tr>
         <th width="25%">제목</th>
         <td><c:out value="${board.title}"/></td> 
         
      </tr>
      <tr>
         <th width="25%">작성자</th>
         <td>${board.writer}</td> 
      </tr>
      <tr>
         <th width="25%">내용</th>
         <td><c:out value="${board.content}"/></td> 
      </tr>
      <tr>
         <th width="25%">조회수</th>
         <td>${board.viewCnt}</td> 
      </tr>
      <tr>
         <th width="25%">등록일</th>
         <td>${board.regDate}</td> 
      </tr>
   
      </table>
<button onclick="doAction('U')" >수   정</button> &nbsp;&nbsp; 
<button onclick="doAction('D')" >삭    제</button>&nbsp;&nbsp; 
<button onclick="doAction('L')">목    록</button>&nbsp;&nbsp;    


</div>
</body>
</html>