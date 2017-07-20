package myungjun;

public class ReviewVO {
	private int rating;
	private String review_comment;
	private int rating_id;
	public ReviewVO() {
		super();
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
	
	public int getRating_id() {
		return rating_id;
	}

	public void setRating_id(int rating_id) {
		this.rating_id = rating_id;
	}

	@Override
	public String toString() {
		return "ReviewVO [rating=" + rating + ", review_comment=" + review_comment + ", rating_id=" + rating_id + "]";
	}

	
}
