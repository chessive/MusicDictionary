package myungjun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SongDAO {

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

	public ArrayList<SongVO> searchSong(String name) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<SongVO> songs = new ArrayList<SongVO>();
		SongVO song = null;
		try {
			conn = getConnection();
			pstm = conn.prepareStatement("select * from song where NAME like ?");
			pstm.setString(1, "%" + name + "%");
			rs = pstm.executeQuery();

			while (rs.next()) {
				song = new SongVO();
				song.setSong_id(rs.getString("SONG_ID"));
				song.setName(rs.getString("NAME"));
				song.setArtist_name(rs.getString("ARTIST_NAME"));
				song.setPublish_date(rs.getString("PUBLISH_DATE"));
				song.setPublisher_name(rs.getString("PUBLISHER_NAME"));
				song.setAlbum_name(rs.getString("ALBUM_NAME"));
				song.setAlbum_id(rs.getInt("ALBUM_ID"));
				song.setComposer_count(rs.getInt("COMPOSER_COUNT"));
				song.setRemaker_count(rs.getInt("REMAKER_COUNT"));
				song.setWriter_count(rs.getInt("WRITER_COUNT"));
				song.setArtist_count(rs.getInt("ARTIST_COUNT"));
				song.setSong_index(rs.getInt("SONG_INDEX"));
				song.setRating_id(rs.getInt("RATING_ID"));
				song.setCount(rs.getInt("COUNT"));
				
				switch (song.getComposer_count()) {
				case 5:
					song.setComposer_id_5(rs.getString("COMPOSER_ID_5"));
				case 4:
					song.setComposer_id_4(rs.getString("COMPOSER_ID_4"));
				case 3:
					song.setComposer_id_3(rs.getString("COMPOSER_ID_3"));
				case 2:
					song.setComposer_id_2(rs.getString("COMPOSER_ID_2"));
				case 1:
					song.setComposer_id_1(rs.getString("COMPOSER_ID_1"));
				}
				
				switch (song.getRemaker_count()) {
				case 5:
					song.setRemaker_id_5(rs.getString("REMAKER_ID_5"));
				case 4:
					song.setRemaker_id_4(rs.getString("REMAKER_ID_4"));
				case 3:
					song.setRemaker_id_3(rs.getString("REMAKER_ID_3"));
				case 2:
					song.setRemaker_id_2(rs.getString("REMAKER_ID_2"));
				case 1:
					song.setRemaker_id_1(rs.getString("REMAKER_ID_1"));
				}
				
				switch (song.getArtist_count()) {
				case 5:
					song.setArtist_id_5(rs.getString("ARTIST_ID_5"));
				case 4:
					song.setArtist_id_4(rs.getString("ARTIST_ID_4"));
				case 3:
					song.setArtist_id_3(rs.getString("ARTIST_ID_3"));
				case 2:
					song.setArtist_id_2(rs.getString("ARTIST_ID_2"));
				case 1:
					song.setArtist_id_1(rs.getString("ARTIST_ID_1"));
				}
				
				switch (song.getWriter_count()) {
				case 5:
					song.setWriter_id_5(rs.getString("WRITER_ID_5"));
				case 4:
					song.setWriter_id_4(rs.getString("WRITER_ID_4"));
				case 3:
					song.setWriter_id_3(rs.getString("WRITER_ID_3"));
				case 2:
					song.setWriter_id_2(rs.getString("WRITER_ID_2"));
				case 1:
					song.setWriter_id_1(rs.getString("WRITER_ID_1"));
				}


				songs.add(song);

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

		return songs;
	}

	public static void main(String[] args) {
		SongDAO songs = new SongDAO();
		System.out.println(songs.searchSong("고"));
	}
}
