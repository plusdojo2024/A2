package model;
import java.io.Serializable;

public class FavoriteUser implements Serializable {
	private int userId;			//ユーザID
	private int userIdFavorite;	//お気に入りユーザID
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
	}		//更新日時

