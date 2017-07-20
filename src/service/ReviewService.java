package service;

import java.util.ArrayList;

import myungjun.ReviewDAO;
import myungjun.ReviewVO;

public class ReviewService {
	ReviewDAO dao = new ReviewDAO();
	public void reviewInsert(ReviewVO review){
		dao.insertReview(review);
	}
	public ArrayList<ReviewVO> reviewSearch(ReviewVO review){
		ArrayList<ReviewVO> reviews = new ArrayList<ReviewVO>();
		reviews =dao.searchReview(review);
		return reviews;
	}
}
