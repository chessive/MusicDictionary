package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ArtistDAO {

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

	public ArrayList<ArtistVO> searchArtist(ArtistVO input_artist) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<ArtistVO> artists = new ArrayList<ArtistVO>();
		ArtistVO artist = null;
		try {
			conn = getConnection();
			pstm = conn.prepareStatement("select * from artist where ARTIST_NAME like ?");
			pstm.setString(1, "%" + input_artist.getArtist_name() + "%");
			rs = pstm.executeQuery();

			while (rs.next()) {
				artist = new ArtistVO();
				artist.setArtist_id(rs.getInt("ARTIST_ID"));
				artist.setArtist_name(rs.getString("ARTIST_NAME"));
				artist.setDebut_date(rs.getString("DEBUT_DATE").substring(0, rs.getString("DEBUT_DATE").indexOf(" ") ) );
				artist.setMember_num(rs.getInt("MEMBER_NUM"));
				artist.setRating_id(rs.getInt("RATING_ID"));
				artist.setCount(rs.getInt("COUNT"));
				switch (artist.getMember_num()) {
				case 11:
					artist.setSinger_id_11(rs.getString("SINGER_ID_11"));
				case 10:
					artist.setSinger_id_10(rs.getString("SINGER_ID_10"));
				case 9:
					artist.setSinger_id_9(rs.getString("SINGER_ID_9"));
				case 8:
					artist.setSinger_id_8(rs.getString("SINGER_ID_8"));
				case 7:
					artist.setSinger_id_7(rs.getString("SINGER_ID_7"));
				case 6:
					artist.setSinger_id_6(rs.getString("SINGER_ID_6"));
				case 5:
					artist.setSinger_id_5(rs.getString("SINGER_ID_5"));
				case 4:
					artist.setSinger_id_4(rs.getString("SINGER_ID_4"));
				case 3:
					artist.setSinger_id_3(rs.getString("SINGER_ID_3"));
				case 2:
					artist.setSinger_id_2(rs.getString("SINGER_ID_2"));
				case 1:
					artist.setSinger_id_1(rs.getString("SINGER_ID_1"));
				}

				artists.add(artist);

			} // while end

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

		return artists;
	}

}
