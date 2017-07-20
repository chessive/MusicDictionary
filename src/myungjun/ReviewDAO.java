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
		int temp_count1;
		int temp_count2;
		String str;	
		boolean b;
		
		int sum = 0;
		int count;
		double avg;
		
		int rt_id;
		try {
			conn = getConnection();
			
			pstm = conn.prepareStatement("select CONTENT_INDEX from DBA");
			rs = pstm.executeQuery();
			rs.next();
			temp_count1 = rs.getInt(1)+1;
			
			pstm = conn.prepareStatement("update DBA set CONTENT_INDEX = ?");
			pstm.setInt(1, temp_count1);
			pstm.executeQuery();
			
			pstm = conn.prepareStatement("insert into review(CONTENT_ID, rating_id, rating, review_comment) values(?,?,?,?)");
			pstm.setInt(1, temp_count1);
			pstm.setInt(2, review.getRating_id());
			pstm.setInt(3, review.getRating());
			pstm.setString(4, review.getReview_comment());
			pstm.executeUpdate();

			//Rating table 수정 
			
			pstm = conn.prepareStatement("select rating_id from rating where RATING_ID =?");
			pstm.setInt(1, review.getRating_id());
			rs =pstm.executeQuery();
			b = rs.next();
			// insert
			if(!b) {
				pstm = conn.prepareStatement("insert into rating(rating_id, rating, count) values(?,?,?)");
				pstm.setInt(1, review.getRating_id());
				pstm.setInt(2, review.getRating());
				pstm.setInt(3, 1);
				pstm.executeUpdate();
			}
			
			// update
			else{
				System.out.println("elsefh emf");
				
				pstm = conn.prepareStatement("select rating from review where rating_id = ?");
				pstm.setInt(1, review.getRating_id());
				rs = pstm.executeQuery();
				while(rs.next()){
					sum += rs.getInt(1);
				}
				
				pstm = conn.prepareStatement("select count from RATING where rating_id = ?");
				pstm.setInt(1, review.getRating_id());
				rs = pstm.executeQuery();
				rs.next();
				count = rs.getInt(1) + 1;
				
				pstm = conn.prepareStatement("update RATING set count = ? where rating_id = ?");
				pstm.setInt(1, count);
				pstm.setInt(2, review.getRating_id());
				pstm.executeQuery();
				
				pstm = conn.prepareStatement("update RATING set rating = ? where rating_id = ?");
				System.out.println("sum = " + sum + " : count : " + count);
				pstm.setInt(1, sum / count);
				pstm.setInt(2, review.getRating_id());
				pstm.executeQuery();
				
			} 
			
			
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
	
	public static void main(String args[]){
		ReviewDAO rd = new ReviewDAO();
		
		ReviewVO rv = new ReviewVO();
		rv.setRating(3);
		rv.setRating_id(3);
		rv.setReview_comment("hihi");
		
		rd.insertReview(rv);
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
					review.setRating_id(rs.getInt("RATING_ID")); 
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
