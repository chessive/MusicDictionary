package myungjun;



public class ReviewService {
	ReviewDAO dao = new ReviewDAO();
	public void reviewInsert(ReviewVO review){
		dao.insertReview(review);
	}
}
