package model;
import java.io.Serializable;

public class FavoriteUser implements Serializable {
	private int userId;			//自分のユーザID
	private int userIdFavorite;	//お気に入りユーザのユーザID
	private String userNameFavorite;	//お気に入りユーザのユーザ名
	private String iconFavorite;	//お気に入りユーザのアイコン画像
	private String createdAt;	//登録日時
	private String updateAt;	//更新日時

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserIdFavorite() {
		return userIdFavorite;
	}
	public void setUserIdFavorite(int userIdFavorite) {
		this.userIdFavorite = userIdFavorite;
	}
	public String getUserNameFavorite() {
		return userNameFavorite;
	}
	public void setUserNameFavorite(String userNameFavorite) {
		this.userNameFavorite = userNameFavorite;
	}
	public String getIconFavorite() {
		return iconFavorite;
	}
	public void setIconFavorite(String iconFavorite) {
		this.iconFavorite = iconFavorite;
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

