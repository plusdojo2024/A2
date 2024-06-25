package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.sql.Timestamp;
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
				String sql = "INSERT INTO favorite_user(user_id_favorite,user_id, created_at) VALUES (?,?,?)";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// Java側で現在のタイムスタンプを取得
				Timestamp createdAt = new Timestamp(System.currentTimeMillis());

				pStmt.setInt(1, userIdFavorite);
				pStmt.setInt(2, userId);
				pStmt.setTimestamp(3, createdAt);

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
				String sql = "SELECT f.user_id, f.user_id_favorite, u.user_name, u.icon FROM favorite_user AS f INNER JOIN user AS u ON f.user_id_favorite=u.user_id WHERE f.user_id=? AND u.flag=1  AND u.open_close=1";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, userId);

				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// 結果表をコレクションにコピーする
				while (rs.next()) {
					FavoriteUser record = new FavoriteUser();

					record.setUserId(rs.getInt("user_id"));
					record.setUserIdFavorite(rs.getInt("user_id_favorite"));
					record.setUserNameFavorite(rs.getString("user_name"));
					record.setIconFavorite(rs.getString("icon"));

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

	  //ユーザIDで指定した他ユーザについて、自分がお気に入りをつけているかどうか確認する。つけていたら1、つけていなかったら0を返す
	    public int confirmFavorite(int userId, int userIdFavorite) {
			Connection conn = null;
			int favorite = 0;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// SQL文を準備する
				String sql = "SELECT count(*) FROM favorite_user WHERE user_id=? AND user_id_favorite=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, userId);
	            pStmt.setInt(2, userIdFavorite);

				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

	            //結果のテーブルの1行目を見に行く
	            rs.next();

	            //countの結果が1なら、いいねがついているのでtrue。0なら、いいねはついていないのでfalseのまま
	            if (rs.getInt("count(*)") == 1) {
	                favorite = 1;
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
			return favorite;
		}


}

