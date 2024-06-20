package model;
import java.io.Serializable;
//ポスト一覧（受け取り）表示用Beans
public class PostList implements Serializable{

	private int user_id; //ポスト受け取ったユーザのID
	private int post_id;
	private String created_at; //ポストを受け取った時点の日時（つまりポスト受け取りテーブルのカラム）
	private String title;
	private String recommend;
	private int interest;

	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public int getInterest() {
		return interest;
	}
	public void setInterest(int interest) {
		this.interest = interest;
	}

}