package model;
import java.io.Serializable;

public class FavoriteUser implements Serializable {
	private int user_id;			//ユーザID
	private int user_id_favorite;	//お気に入りユーザID
	private String created_at;		//登録日時
	private String update_at;		//更新日時

	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getUser_id_favorite() {
		return user_id_favorite;
	}
	public void setUser_id_favorite(int user_id_favorite) {
		this.user_id_favorite = user_id_favorite;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}
}
