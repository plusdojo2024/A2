package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.util.ArrayList;
import java.util.List;

import model.FavoriteUser;

public class FavoriteUserDao {
//お気に入りユーザー情報を登録し、結果を返す
		public boolean userRegist(int userIdFavorite, int userId) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// INSERTT文を準備する
				String sql = "INSERT INTO favorite_user(user_id_favorite,user_id) VALUES (?,?)";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setInt(1, userIdFavorite);
				pStmt.setInt(2, userId);

				// INSERT文を実行し、登録に成功したらresultにtrueを入れる
				if (pStmt.executeUpdate() == 1) {
					result = true;
				}
			}
			catch (SQLNonTransientException e) {
				e.printStackTrace();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			// 結果を返す
			return result;
		}



		// 引数numberで指定されたお気に入りユーザー情報を削除し、成功したらtrueを返す
		public boolean userDelete(int userIdFavorite, int userId) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// SQL文を準備する
				String sql = "DELETE FROM favorite_user WHERE user_id_favorite=? AND user_id=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, userIdFavorite);
				pStmt.setInt(2, userId);

				// SQL文を実行する
				if (pStmt.executeUpdate() == 1) {
					result = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			// 結果を返す
			return result;
		}

			//お気に入りユーザのリストを返す
	    public List<FavoriteUser> userSelect(int userId) {
			Connection conn = null;
			List<FavoriteUser> favoriteList = new ArrayList<FavoriteUser>();

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// SQL文を準備する
				String sql = "SELECT f.user_id, f.favorite_user, u.user_name, u.icon FROM favorite_user AS f(INNER) JOIN user AS uON f.user_id_favorite=u.user_idWHERE f.user_id=? AND u.flag=1  AND u.open_close=1;";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, userId);

				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// 結果表をコレクションにコピーする
				while (rs.next()) {
					FavoriteUser record = new FavoriteUser();

					record.setUserId(rs.getInt("f.user_id"));
					record.setUserIdFavorite(rs.getInt("f.favorite_user"));
					record.setUserNameFavorite(rs.getString("u.user_name"));
					record.setIconFavorite(rs.getString("u.icon"));

					favoriteList.add(record);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				favoriteList = null;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				favoriteList = null;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						favoriteList = null;
					}
				}
			}

			// 結果を返す
			return favoriteList;
		}

}

