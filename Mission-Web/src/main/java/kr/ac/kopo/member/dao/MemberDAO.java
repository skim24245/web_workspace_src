package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

public class MemberDAO {


	
	//ํ์ ์กฐํ 
	public List<MemberVO> selectAll(){
	
		List<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
	try {	
		conn = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ID, NAME , PASSWORD, EMAIL_ID, TEL1,TEL2,TEL3,POST,BASIC_ADDR,DETAIL_ADDR, TYPE, TO_CHAR(reg_date, 'yyyy-mm-dd')as reg_date ");
		sql.append(" from T_MEMBER ");
		sql.append(" order by ID desc");
		pstmt = conn.prepareStatement(sql.toString());
		
		ResultSet rs = pstmt.executeQuery();
	
		
		while(rs.next()){
			String id = rs.getString("ID");
			String name = rs.getString("NAME");
			String password =rs.getString("PASSWORD");
			String email_id =rs.getString("EMAIL_ID");
			String tel1 = rs.getString("TEL1");
			String tel2 =rs.getString("TEL2");
			String tel3 =rs.getString("TEL3");
			String post =rs.getString("POST");
			String basic_addr =rs.getString("BASIC_ADDR");
			String detail_addr=rs.getString("DETAIL_ADDR");
			String type=rs.getString("TYPE");	
			String reg_date = rs.getString("reg_date");		
	
			
			MemberVO member = new MemberVO();
			member.setId(id);
			member.setName(name);
			member.setPassword(password);
			member.setEmail_id(email_id);
			member.setTel1(tel1);
			member.setTel2(tel2);
			member.setTel3(tel3);
			member.setPost(post);
			member.setBasic_addr(basic_addr);
			member.setDetail_addr(detail_addr);
			member.setType(type);
			member.setReg_date(reg_date); //
			
						
	list.add(member);
	}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		JDBCClose.close(pstmt, conn);
	}
	return list;
	}
	

	}


	
	
	
	
	
	
	
	
	
