package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AlbumDAO {

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

	public ArrayList<AlbumVO> searchAlbum(AlbumVO input_album) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<AlbumVO> albums = new ArrayList<AlbumVO>();
		AlbumVO album = null;
		try {
			conn = getConnection();
			pstm = conn.prepareStatement("select * from album where ALBUM_NAME like ?");
			pstm.setString(1, "%" + input_album.getAlbum_name() + "%");
			rs = pstm.executeQuery();

			while (rs.next()) {
				album = new AlbumVO();
				album.setAlbum_id(rs.getInt("ALBUM_ID"));
				album.setAlbum_name(rs.getString("ALBUM_NAME"));
				album.setArtist_name(rs.getString("ARTIST_NAME"));
				
				album.setArtist_count(rs.getInt("ARTIST_COUNT"));
				album.setRating_id(rs.getInt("RATING_ID"));
				album.setCount(rs.getInt("COUNT"));
				
				switch (album.getArtist_count()) {
				case 6:
					album.setArtist_id_6(rs.getString("ARTIST_ID_6"));
				case 5:
					album.setArtist_id_5(rs.getString("ARTIST_ID_5"));
				case 4:
					album.setArtist_id_4(rs.getString("ARTIST_ID_4"));
				case 3:
					album.setArtist_id_3(rs.getString("ARTIST_ID_3"));
				case 2:
					album.setArtist_id_2(rs.getString("ARTIST_ID_2"));
				case 1:
					album.setArtist_id_1(rs.getString("ARTIST_ID_1"));
				}

				System.out.println(album);
				albums.add(album);

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

		return albums;
	}
	
}
