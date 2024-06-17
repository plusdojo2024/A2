package model;
import java.io.Serializable;

public class PostReceive implements Serializable {
    private int post_receive_id;         //ポスト受け取りID
    private int user_id;                 //ユーザID
    private int post_id;                 //ポストID
    private String created_at;           //登録日時
    private String updated_at;           //更新日時



	public int getPost_receive_id() {
		return post_receive_id;
	}
	public void setPost_receive_id(int post_receive_id) {
		this.post_receive_id = post_receive_id;
	}
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
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}


}
