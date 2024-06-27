package model;
import java.io.Serializable;

public class Contents implements Serializable {
	private int contentsId;		//コンテンツID
	private String title;				//タイトル
	private String ruby;				//ふりがな
	private String genre;				//ジャンル
	private String creator;			//制作者
	private String year;				//公開年
	private String image;				//画像
	private String createdAt;	//登録日時
	private String updatedAt;	//更新日時
	private int myStatus; //コレクション、ウィッシュリストに入れているか否か

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
	public String getRuby() {
		return ruby;
	}
	public void setRuby(String ruby) {
		this.ruby = ruby;
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
	public int getMyStatus() {
		return myStatus;
	}
	public void setMyStatus(int myStatus) {
		this.myStatus = myStatus;
	}
}
