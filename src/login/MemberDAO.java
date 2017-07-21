package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	public Connection getConnection() {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@192.168.3.146:1521:xe";
			conn = DriverManager.getConnection(url, "sd", "tiger");
		} catch (Exception e) {
			e.printStackTrace();

		}

		return conn;

	}

	public String searchMember_id(MemberVO mvo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		// MemberVO = null;
		String result = null;
		try {
			conn = getConnection();
			pstm = conn.prepareStatement("select id, pwd from member where id = ? ");
			pstm.setString(1, mvo.getId());
			rs = pstm.executeQuery();

			if (rs.next()) {// id존재
				//System.out.println(rs.getString(1));
				if (rs.getString(1).equals(mvo.getId())) {
					//System.out.println("getString==="+rs.getString(2));
					//System.out.println("mvo==="+mvo.getPwd());
					result = "ID가 존재합니다";
					if (rs.getString(2).equals(mvo.getPwd())) {
						result = "ID와 PWD가 일치합니다.";
						
					}
				}

			} else {// id존재X
				result = "ID가 존재하지 않습니다.";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

		}

		return result;
	}
	
	public static void main(String args[]){

	}

	public void insert(MemberVO mvo) {
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try{
			conn = getConnection();
			pstm = conn.prepareStatement("insert into member values(?,?,?,?,?)");
			pstm.setString(1, mvo.getId());
			pstm.setString(2, mvo.getPwd());
			pstm.setInt(3, mvo.getGender());
			pstm.setString(4, mvo.getM_birth());
			pstm.setString(5, mvo.getEmail());
			pstm.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(pstm != null) pstm.close();
				if(conn != null) conn.close();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}
	}

	public void update(MemberVO mvo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try{
			conn = getConnection();
			pstm = conn.prepareStatement("update member set pwd=?, gender=?,m_birth=?,email=? where id=?");
			pstm.setString(1, mvo.getPwd());
			pstm.setInt(2, mvo.getGender());
			pstm.setString(3, mvo.getM_birth());
			pstm.setString(4, mvo.getEmail());
			pstm.setString(5, mvo.getId());
			pstm.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(pstm != null) pstm.close();
				if(conn != null) conn.close();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}		
		
	}

	public void delete(MemberVO mvo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try{
			conn = getConnection();
			pstm = conn.prepareStatement("delete from member where id =?");
			pstm.setString(1, mvo.getId());
			pstm.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(pstm != null) pstm.close();
				if(conn != null) conn.close();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
