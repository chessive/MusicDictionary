package myungjun;

public class ReviewVO {
	private int rating;
	private String review_comment;
	
	public ReviewVO() {
		super();
	}
	
	public ReviewVO(int rating, String review_comment) {
		super();
		this.rating = rating;
		this.review_comment = review_comment;
	}

	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	@Override
	public String toString() {
		return "ReviewVO [rating=" + rating + ", review_comment=" + review_comment + "]";
	}
	
}
