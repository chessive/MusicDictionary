package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Set;




public class ComposerDAO {
	
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
		
		public ArrayList<ComposerVO> searchComposer(String name) {
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			ArrayList<ComposerVO> composers = new ArrayList<ComposerVO>();
			ComposerVO composer = new ComposerVO();			
			try{
				conn = getConnection();
				pstm = conn.prepareStatement("select * from composer where composer_name like ?");
				pstm.setString(1, "%" + name + "%");
				rs =pstm.executeQuery();
					while(rs.next()){
						
						composer.setComposer_id(rs.getString("COMPOSER_ID")); 
						composer.setComposer_name(rs.getString("COMPOSER_NAME")); 
						composer.setRating_id(rs.getInt("RATING_ID"));
						composer.setCount(rs.getInt("COUNT"));
						
						composers.add(composer);
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

			return composers;
		}
		
}

