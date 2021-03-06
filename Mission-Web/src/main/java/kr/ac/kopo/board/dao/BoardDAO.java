package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;


/**
 * t_board 테이블의 CRUD 담당 클래스 
 * 지금은 비즈니스 로직이 없으니까 교수님 마음대로 쓰심.
 */
public class BoardDAO {
	/**
	 * no에 해당하는 게시글 조회 메소드
	 * 
	 */
	
	
	public BoardVO selectByno(int no) {
		//db 접속해서 데어터 가져옴. try catch 1.7버전에서 사용.1.7버전 try안에서는 autoclose를 상속받은 객체만 사용 할 수 있고, void 타입이나 string이나 stringbutter 이런걸
		//사용을 못함. 왜냐, string이랑 stringbuffer는 autoclose 상속 못받아서
		StringBuilder sql= new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd')as reg_date ");
		sql.append(" from t_board ");
		sql.append(" where no=? ");
	
		try(
			Connection conn = new ConnectionFactory().getConnection();//try catch가 끝나면 자동으로 finally에 안쓰고도 close를 할 수 있도록 만들어주고
				//연결을 해제해도록 함. 문서를 확인해보면 autoclose를 상속받게 된 것을 알 수 있음.
			PreparedStatement pstmt=conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				
				int boardNo = rs.getInt("no"); //위에 public BoardVO selectByno(int no)에 no가 있어서 boardno로 바꿔줌
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content= rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(boardNo, title, writer, content, viewCnt, regDate);
				return board;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;// detail에서 최소 한개를 조회해서 가져오는 거니까 return 타입을 boardvo로 쓰고 null을 써줌. (에러 없애기 위해 null적음)
	}
	/**
	 * 전체게시글 조회 메소드를 쓰고 싶음.
	 * 
	 */
	public List<BoardVO> selectAll() {
		//나오는 레코드가 최소 0개부터 n개 있음. 여러 개의 레코드르 가져와야 하니까 배열이나 콜렉션 형태여야 함. 레코드 하나 하나 저장하는 단위가 vo클래스이므로
		//vo 클래스를 따로 만듦
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
		
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd')as reg_date ");
			sql.append(" from t_board");
			sql.append(" order by no desc");
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
		
			
			while(rs.next()) {
			int no = rs.getInt("no");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String regDate = rs.getString("reg_date"); //숫자도 가져올 수 있게 해줌. 4이렇게 입력해서. 
			
			BoardVO board = new BoardVO();
			board.setNo(no);
			board.setTitle(title);
			board.setWriter(writer);
			board.setRegDate(regDate);
			
			list.add(board);
			}
			//추출하는 단위가 vo임 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(pstmt, conn);
		}
		return list;
	}
	
	/*
	 * 새글등록 메소드 (리턴타입 필요 없음)
	 */
	public void insertBoard(BoardVO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into t_board(no,title,writer,content) ");
			sql.append("values(seq_t_board_no.nextval, ?, ?, ?) ");
			 pstmt = conn.prepareStatement(sql.toString());
			 
			 pstmt.setString(1, board.getTitle());
			 pstmt.setString(2, board.getWriter());
			 pstmt.setString(3, board.getContent());
			 
			 //쿼리 실행
			pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(pstmt, conn);
		}
		
}
}
