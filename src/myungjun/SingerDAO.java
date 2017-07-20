package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Set;




public class SingerDAO {
	
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
		
		public ArrayList<SingerVO> searchSinger(SingerVO input_singer) {
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			ArrayList<SingerVO> singers = new ArrayList<SingerVO>();
			SingerVO singer = null;			
			try{
				conn = getConnection();
				pstm = conn.prepareStatement("select * from singer where singer_name like ?");
				pstm.setString(1, "%" + input_singer.getSinger_name() + "%");
				rs =pstm.executeQuery();
					while(rs.next()){
						singer = new SingerVO();
						singer.setSinger_id(rs.getInt("SINGER_ID")); 
						singer.setSinger_name(rs.getString("SINGER_NAME")); 
						singer.setBirth_date(rs.getString("birth_date")); 
						singer.setArtist_id_1(rs.getInt("artist_id_1")); 
						singer.setArtist_id_2(rs.getInt("artist_id_2")); 
						singer.setArtist_id_3(rs.getInt("artist_id_3")); 
						singer.setArtist_id_4(rs.getInt("artist_id_4")); 
						singer.setRating_id(rs.getInt("RATING_ID"));
						singer.setCount(rs.getInt("COUNT"));
						
						singers.add(singer);
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

			return singers;
		}
		
}

