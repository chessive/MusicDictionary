package myungjun;

public class AlbumVO {
	private String album_name;
	private int album_id;
	private String artist_name;
	private String artist_id_1;
	private String artist_id_2;
	private String artist_id_3;
	private String artist_id_4;
	private String artist_id_5;
	private String artist_id_6;
	private int artist_count;
	private int rating_id;
	private int count;
	public AlbumVO() {
		super();
	}
	public String getAlbum_name() {
		return album_name;
	}
	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}
	public int getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}
	public String getArtist_name() {
		return artist_name;
	}
	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}
	public String getArtist_id_1() {
		return artist_id_1;
	}
	public void setArtist_id_1(String artist_id_1) {
		this.artist_id_1 = artist_id_1;
	}
	public String getArtist_id_2() {
		return artist_id_2;
	}
	public void setArtist_id_2(String artist_id_2) {
		this.artist_id_2 = artist_id_2;
	}
	public String getArtist_id_3() {
		return artist_id_3;
	}
	public void setArtist_id_3(String artist_id_3) {
		this.artist_id_3 = artist_id_3;
	}
	public String getArtist_id_4() {
		return artist_id_4;
	}
	public void setArtist_id_4(String artist_id_4) {
		this.artist_id_4 = artist_id_4;
	}
	public String getArtist_id_5() {
		return artist_id_5;
	}
	public void setArtist_id_5(String artist_id_5) {
		this.artist_id_5 = artist_id_5;
	}
	public String getArtist_id_6() {
		return artist_id_6;
	}
	public void setArtist_id_6(String artist_id_6) {
		this.artist_id_6 = artist_id_6;
	}
	public int getRating_id() {
		return rating_id;
	}
	public void setRating_id(int rating_id) {
		this.rating_id = rating_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public int getArtist_count() {
		return artist_count;
	}
	public void setArtist_count(int artist_count) {
		this.artist_count = artist_count;
	}
	@Override
	public String toString() {
		return "AlbumVO [album_name=" + album_name + ", album_id=" + album_id + ", artist_name=" + artist_name
				+ ", artist_id_1=" + artist_id_1 + ", artist_id_2=" + artist_id_2 + ", artist_id_3=" + artist_id_3
				+ ", artist_id_4=" + artist_id_4 + ", artist_id_5=" + artist_id_5 + ", artist_id_6=" + artist_id_6
				+ ", rating_id=" + rating_id + ", count=" + count + "]";
	}
	
}
