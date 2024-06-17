package model;

import java.io.Serializable;

public class MyContents implements Serializable {

	private int my_contents_id; //マイコンテンツID
	private int contents_id;    //コンテンツID
	private int user_id;         //ユーザID
	private int status;         //属性
	private String title;       //タイトル
	private String genre;       //ジャンル
	private String creator;     //製作者
	private String year;        //公開年
	private String image;       //画像
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
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
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}


}
