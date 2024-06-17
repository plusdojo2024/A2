package model;

import java.io.Serializable;

public class LoginUser implements Serializable {
	private String id;	// ログイン時のID
	private String name; // ログイン時のアカウント名
	private int count; //今まで登録した名刺の全数

	public LoginUser() {
		this(null);
	}

	public LoginUser(String id) {
		this.id = id;
	}

	public String getUserId() {
		return id;
	}

	public void setUserId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return name;
	}

	public void setUserName(String name) {
		this.name = name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
