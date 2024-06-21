package model;

import java.io.Serializable;

public class Chat implements Serializable{

	private int chatId;				//チャットID
	private int userIdSpeaker;		//ユーザID（発言者)
	private int userIdListener;		//ユーザID（相手)
	private String talk;			//発言
	private String image;			//画像
	private int check;				//既読
	private String createdAt;		//登録日時
	private String updateAt;		//更新日時
	private String userName;        //相手のユーザ名
	private String userIcon;       //相手のアイコン


	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public int getUserIdSpeaker() {
		return userIdSpeaker;
	}
	public void setUserIdSpeaker(int userIdSpeaker) {
		this.userIdSpeaker = userIdSpeaker;
	}
	public int getUserIdListener() {
		return userIdListener;
	}
	public void setUserIdListener(int userIdListener) {
		this.userIdListener = userIdListener;
	}
	public String getTalk() {
		return talk;
	}
	public void setTalk(String talk) {
		this.talk = talk;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(String updateAt) {
		this.updateAt = updateAt;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}


}
