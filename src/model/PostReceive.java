package model;
import java.io.Serializable;

public class PostReceive implements Serializable {
    private int postReceiveId;         //ポスト受け取りID
    private int userId;                 //ユーザID
    private int postId;                 //ポストID
    private String createdAt;           //登録日時
    private String updatedAt;           //更新日時

	public int getPostReceiveId() {
		return postReceiveId;
	}
	public void setPostReceiveId(int postReceiveId) {
		this.postReceiveId = postReceiveId;
	}
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
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}




}
