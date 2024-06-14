package model;
import java.io.Serializable;

public class User implements Serializable {
    private int user_id;           //ユーザID
    private String mail;           //メールアドレス
    private String pass;           //パスワード
    private String user_name;      //ユーザ名
    private String icon;           //アイコン画像
    private int open_close;        //公開・非公開
    private String introduction;   //自己紹介文
    private int flag;              //フラグ
    private String created_at;     //登録日時
    private String updated_at;     //更新日時


	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	public int getOpen_close() {
		return open_close;
	}
	public void setOpen_close(int open_close) {
		this.open_close = open_close;
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
