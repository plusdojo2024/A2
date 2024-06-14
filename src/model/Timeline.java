package model;
import java.io.Serializable;

public class Timeline implements Serializable {
	private User user;					//Userクラス
	private FavoriteUser favoriteUser;	//FavoriteUserクラス
	private Review review;				//Reviewクラス
	private Good good;					//Goodクラス

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public FavoriteUser getFavoriteUser() {
		return favoriteUser;
	}
	public void setFavoriteUser(FavoriteUser favoriteUser) {
		this.favoriteUser = favoriteUser;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public Good getGood() {
		return good;
	}
	public void setGood(Good good) {
		this.good = good;
	}
}
