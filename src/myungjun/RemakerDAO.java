package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Set;




public class RemakerDAO {
	
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
		
		public ArrayList<RemakerVO> searchRemaker(String name) {
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			ArrayList<RemakerVO> remakers = new ArrayList<RemakerVO>();
			RemakerVO remaker = new RemakerVO();			
			try{
				conn = getConnection();
				pstm = conn.prepareStatement("select * from remaker where remaker_name like ?");
				pstm.setString(1, "%" + name + "%");
				rs =pstm.executeQuery();
					while(rs.next()){
						
						remaker.setRemaker_id(rs.getString("REMAKER_ID")); 
						remaker.setRemaker_name(rs.getString("REMAKER_NAME")); 
						remaker.setRating_id(rs.getInt("RATING_ID"));
						remaker.setCount(rs.getInt("COUNT"));
						
						remakers.add(remaker);
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

			return remakers;
		}
		
}

