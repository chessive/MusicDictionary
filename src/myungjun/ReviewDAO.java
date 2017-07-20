package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewDAO {
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
	
	public void insertReview(ReviewVO review) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int temp_count;
				
		try {
			conn = getConnection();
			
			pstm = conn.prepareStatement("select CONTENT_INDEX from DBA");
			rs = pstm.executeQuery();
			rs.next();
			temp_count = rs.getInt(1)+1;
			
			pstm = conn.prepareStatement("update DBA set CONTENT_INDEX = ?");
			pstm.setInt(1, temp_count);
			pstm.executeQuery();
			
			pstm = conn.prepareStatement("insert into review(CONTENT_ID, rating_id, rating, review_comment) values(?,?,?,?)");
			pstm.setInt(1, temp_count);
			pstm.setInt(2, review.getRating_id());
			pstm.setInt(3, review.getRating());
			pstm.setString(4, review.getReview_comment());
			pstm.executeUpdate();

		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
	}
	public ArrayList<ReviewVO> searchReview(ReviewVO input_review) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> reviews = new ArrayList<ReviewVO>();
		ReviewVO review = null;			
		try{
			conn = getConnection();
			pstm = conn.prepareStatement("select * from review where RATING_ID =?");
			pstm.setInt(1, input_review.getRating_id());
			rs =pstm.executeQuery();
				while(rs.next()){
					review = new ReviewVO();
					review.setRating(rs.getInt("RATING")); 
					review.setReview_comment(rs.getString("REVIEW_COMMENT"));
					
					reviews.add(review);
				}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return reviews;
	}
}
