package model;
import java.io.Serializable;

public class User implements Serializable {
    private int userId;           //ユーザID
    private String mail;           //メールアドレス
    private String pass;           //パスワード
    private String userName;      //ユーザ名
    private String icon;           //アイコン画像
    private int openClose;        //公開・非公開
    private String introduction;   //自己紹介文
    private int flag;              //フラグ
    private String createdAt;     //登録日時
    private String updatedAt;     //更新日時
    private int reviewCount;	//投稿したレビューの総数
    private int allGoodCount;	//レビューにもらったいいねの総数

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public int getOpenClose() {
		return openClose;
	}
	public void setOpenClose(int openClose) {
		this.openClose = openClose;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getAllGoodCount() {
		return allGoodCount;
	}
	public void setAllGoodCount(int allGoodCount) {
		this.allGoodCount = allGoodCount;
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
