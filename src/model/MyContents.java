package model;

import java.io.Serializable;

public class MyContents implements Serializable {

	private int my_contents_id; //マイコンテンツID
	private int contents_id;    //コンテンツID
	private int user_id;        //ユーザID
	private int status;         //属性
	private String created_at;  //登録日
	private String updated_at;  //更新日


	public int getMy_contents_id() {
		return my_contents_id;
	}
	public void setMy_contents_id(int my_contents_id) {
		this.my_contents_id = my_contents_id;
	}
	public int getContents_id() {
		return contents_id;
	}
	public void setContents_id(int contents_id) {
		this.contents_id = contents_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
