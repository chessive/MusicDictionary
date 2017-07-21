package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RatingDAO {
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
	
	public ArrayList<RatingVO> searchRating(int rating_id) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<RatingVO> ratings = new ArrayList<RatingVO>();
		RatingVO rating = null;			
		try{
			conn = getConnection();
			pstm = conn.prepareStatement("select * from rating where rating_id = ?");
			pstm.setInt(1, rating_id);
			rs =pstm.executeQuery();
				while(rs.next()){
					rating.setCount(rs.getInt("COUNT"));
					rating.setRating(rs.getInt("RATING"));
					rating.setRating_id(rs.getInt("RATING_ID"));
					ratings.add(rating);
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

		return ratings;
	}
}
