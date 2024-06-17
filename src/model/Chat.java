package model;

import java.io.Serializable;

public class Chat implements Serializable{

	private int chatId;
	private int userIdSpeaker;
	private int userIdListener;
	private String talk;
	private String image;
	private int check;
	private String createdAt;
	private String updateAt;


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


}
