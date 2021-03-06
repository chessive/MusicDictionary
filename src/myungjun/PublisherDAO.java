package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Set;




public class PublisherDAO {
	
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
		
		public ArrayList<PublisherVO> searchPublisher(PublisherVO input_putblisher) {
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			ArrayList<PublisherVO> publishers = new ArrayList<PublisherVO>();
			PublisherVO publisher = null;	
			try{
				conn = getConnection();
				pstm = conn.prepareStatement("select * from publisher where publisher_name like ?");
				pstm.setString(1, "%" + input_putblisher.getPublisher_name() + "%");
				rs =pstm.executeQuery();
					while(rs.next()){
						publisher= new PublisherVO();
						publisher.setPublisher_name(rs.getString("PUBLISHER_NAME")); 
						publisher.setCeo_name(rs.getString("CEO_NAME")); 
						publisher.setEstablish_date(rs.getString("ESTABLISH_DATE")); 
						publisher.setCount(rs.getInt("COUNT"));
						
						publishers.add(publisher);
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

			return publishers;
		}
		
}

