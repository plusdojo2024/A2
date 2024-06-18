package model;

import java.io.Serializable;

public class MyContents implements Serializable {

	private int myContentsId; //マイコンテンツID
	private int contentsId;    //コンテンツID
	private int userId;         //ユーザID
	private int status;         //属性
	private String title;       //タイトル
	private String ruby;				//ふりがな
	public String getRuby() {
		return ruby;
	}
	public void setRuby(String ruby) {
		this.ruby = ruby;
	}
	private String genre;       //ジャンル
	private String creator;     //製作者
	private String year;        //公開年
	private String image;       //画像
	private String createdAt;  //登録日
	private String updatedAt;  //更新日


	public int getMyContentsId() {
		return myContentsId;
	}
	public void setMyContentsId(int myContentsId) {
		this.myContentsId = myContentsId;
	}
	public int getContentsId() {
		return contentsId;
	}
	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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