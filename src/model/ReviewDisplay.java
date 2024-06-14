package model;
import java.io.Serializable;

public class ReviewDisplay implements Serializable {
	private int review_id;			//レビューID
	private String user_id;			//ユーザID
	private int good;					//いいね
	private int user_id_writer;//投稿者ユーザID
	private int contents_id;		//コンテンツID
	private String title;				//タイトル
	private String review;			//レビュー内容
	private String image;				//画像
	private String created_at;	//登録日
	private String user_name;		//ユーザ名
	private String icon;				//アイコン

	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getUser_id_writer() {
		return user_id_writer;
	}
	public void setUser_id_writer(int user_id_writer) {
		this.user_id_writer = user_id_writer;
	}
	public int getContents_id() {
		return contents_id;
	}
	public void setContents_id(int contents_id) {
		this.contents_id = contents_id;
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
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}