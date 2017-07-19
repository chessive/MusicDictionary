package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Set;




public class WriterDAO {
	
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
		
		public ArrayList<WriterVO> searchWriter(String name) {
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			ArrayList<WriterVO> writers = new ArrayList<WriterVO>();
			WriterVO writer = null;			
			try{
				conn = getConnection();
				pstm = conn.prepareStatement("select * from writer where writer_name like ?");
				pstm.setString(1, "%" + name + "%");
				rs =pstm.executeQuery();
					while(rs.next()){
						writer = new WriterVO();
						writer.setWriter_id(rs.getString("WRITER_ID")); 
						writer.setWriter_name(rs.getString("WRITER_NAME")); 
						writer.setRating_id(rs.getInt("RATING_ID"));
						writer.setCount(rs.getInt("COUNT"));
						
						writers.add(writer);
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

			return writers;
		}
		
}

