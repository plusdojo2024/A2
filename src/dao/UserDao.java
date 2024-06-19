package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;

import model.User;
//ログイン、ユーザ登録、メール確認、ユーザ情報更新、ユーザ情報削除、他ユーザを検索する

public class UserDao {
	// ログインできるならLoginUserのインスタンスを返す
	public User login(String mail,String pass) {
		Connection conn = null;
		User loginUser = new User();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");


			// SELECT文を準備する
			String sql = "SELECT user_id, mail, pass, user_name, icon, open_close, introduction FROM user WHERE mail=? AND pass=? AND flag=1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, mail);
			pStmt.setString(2, pass);



			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();//表の一行目を見に行く
			if (rs.getInt("user_id") != null) {
				loginUser.setUserId(rs.getInt("user_id"));
				loginUser.setMail(rs.getString("mail"));
				loginUser.setPass(rs.getString("pass"));
				loginUser.setUserName(rs.getString("user_name"));
				loginUser.setIcon(rs.getString("icon"));
				loginUser.setOpenClose(rs.getInt("open_close"));
				loginUser.setIntroduction(rs.getString("introduction"));
				//失敗したらLoginUserインスタンスにはnullが入る
			} else {
				loginUser = null;
			}
		}
		catch (SQLNonTransientException e) {
			loginUser = null;
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
		return loginUser;
	}



	//新しいユーザー情報を登録し、結果を返す
	public boolean userRegist(User user) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// INSERTT文を準備する
			String sql = "INSERT INTO user(mail, pass, user_name, icon, open_close, introduction, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

			pStmt.setString(1, user.getMail());
			pStmt.setString(2, user.getPass());
			pStmt.setString(3, user.getUserName());

			if (user.getIcon() != null && !user.getIcon().equals("")) {
				pStmt.setString(4,user.getIcon());
			} else {
				pStmt.setString(4, "");
			}

			pStmt.setInt(5, user.getOpenClose());


			if (user.getIntroduction() != null && ! user.getIntroduction().equals("")) {
				pStmt.setString(6, user.getIntroduction());
			} else {
				pStmt.setString(6, "");
			}

			pStmt.setString(7, user.getCreatedAt());


			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}


	// 指定されたユーザー情報を更新し、成功したらtrueを返す
	public boolean update(User user) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE user SET mail=?, pass=?, user_name=?, icon=?, open_close=?, introduction=? WHERE user_id=? AND flag=1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, user.getMail());
			pStmt.setString(2, user.getPass());
			pStmt.setString(3, user.getUserName());

			if (user.getIcon() != null && !user.getIcon().equals("")) {
				pStmt.setString(4, user.getIcon());
			} else {
				pStmt.setString(4, "");
			}

			pStmt.setInt(5, user.getOpenClose());


			if (user.getIntroduction() != null && ! user.getIntroduction().equals("")) {
				pStmt.setString(6, user.getIntroduction());
			} else {
				pStmt.setString(6, "");
			}

			pStmt.setInt(7, user.getUserId());


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



	// 引数userIDで指定されたユーザー情報を削除し、成功したらtrueを返す
	public boolean userDelete(int userID) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE user SET flag=0 WHERE user_id=? AND flag=1;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userID);

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



	//他ユーザを検索する
	public User userSelect(int userId) {
		Connection conn = null;
		User otherUser = new User();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");


			// SELECT文を準備する
			String sql = "SELECT user_id, user_name, icon, introduction FROM user WHERE user_id=? AND flag=1;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, userId);




			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			//mailが既に登録されていたらtrue 登録されていなかったらfalseを入れる
			rs.next();//表の一行目を見に行く
			if (rs.getInt("user_id") != null) {
				otherUser.setUserId(rs.getInt("user_id"));
				otherUser.setUserName(rs.getString("user_name"));
				otherUser.setIcon(rs.getString("icon"));
				otherUser.setIntroduction(rs.getString("introduction"));
				//失敗したらLoginUserインスタンスにはnullが入る
			} else {
				otherUser = null;
			}
			//失敗したらotherUserはnullを入れる
		}
		catch (SQLNonTransientException e) {
			otherUser = null;
			e.printStackTrace();
		}
		catch (SQLException e) {
			otherUser = null;
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			otherUser = null;
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
		return otherUser;
	}






	//メールアドレスに重複がないかを確認する
	public boolean checkMail(String mail) {
		Connection conn = null;
		boolean result = true;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");


			// SELECT文を準備する
			String sql = "SELECT count(*) FROM user WHERE mail=? AND flag=1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, mail);




			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			//mailが既に登録されていたらtrue 登録されていなかったらfalseを入れる
			rs.next();//表の一行目を見に行く
			if (rs.getInt("count(*)") == 0) {
				result = false;
				//失敗したらresultはtrueのまま
			}
		}
		catch (SQLNonTransientException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {

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
}























