package service;

import myungjun.ReviewDAO;
import myungjun.ReviewVO;

public class ReviewService {
	ReviewDAO dao = new ReviewDAO();
	public void reviewInsert(ReviewVO review){
		dao.insertReview(review);
	}
	public void reviewSearch(Integer rating_id){
		dao.searchReview(rating_id);
	}
}