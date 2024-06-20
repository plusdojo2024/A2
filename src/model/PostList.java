package model;
import java.io.Serializable;
//ポスト一覧（受け取り）表示用Beans
public class PostList implements Serializable{

	private int userId; //ポスト受け取ったユーザのID
	private int postId;
	private String title;
	private String recommend;
	private int myInterest;
	private int userIdWriter;
	private int interest;
	private String createdAt; //ポストを受け取った時点の日時（つまりポスト受け取りテーブルのカラム）

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
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
	public int getMyInterest() {
		return myInterest;
	}
	public void setMyInterest(int myInterest) {
		this.myInterest = myInterest;
	}
	public int getUserIdWriter() {
		return userIdWriter;
	}
	public void setUserIdWriter(int userIdWriter) {
		this.userIdWriter = userIdWriter;
	}
	public int getInterest() {
		return interest;
	}
	public void setInterest(int interest) {
		this.interest = interest;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}




}