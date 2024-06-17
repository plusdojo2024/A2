package model;
import java.io.Serializable;

public class ReviewDisplay implements Serializable {
	private int reviewId;			//レビューID
	private String userId;			//ユーザID
	private int good;					//いいね
	private int userIdWriter;//投稿者ユーザID
	private int contentsId;		//コンテンツID
	private String title;				//タイトル
	private String review;			//レビュー内容
	private String image;				//画像
	private String createdAt;	//登録日
	private String userName;		//ユーザ名
	private String icon;				//アイコン

	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getUserIdWriter() {
		return userIdWriter;
	}
	public void setUserIdWriter(int userIdWriter) {
		this.userIdWriter = userIdWriter;
	}
	public int getContentsId() {
		return contentsId;
	}
	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}
