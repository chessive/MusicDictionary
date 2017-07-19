package myungjun;

public class WriterVO {
	private String writer_id;
	private String writer_name;
	private int rating_id;
	private int count;
	public WriterVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
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
	@Override
	public String toString() {
		return "WriterVO [writer_id=" + writer_id + ", writer_name=" + writer_name + ", rating_id=" + rating_id
				+ ", count=" + count + "]";
	}
	
}
