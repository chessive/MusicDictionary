package myungjun;

public class PublisherVO {
	private String publisher_name;
	private String ceo_name;
	private String establish_date;
	private int count;
	public PublisherVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getEstablish_date() {
		return establish_date;
	}
	public void setEstablish_date(String establish_date) {
		this.establish_date = establish_date;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "PublisherVO [publisher_name=" + publisher_name + ", ceo_name=" + ceo_name + ", establish_date="
				+ establish_date +  ", count=" + count + "]";
	}
	
		
}
