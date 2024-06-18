package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;

import model.User;
//ログイン、ユーザ登録、メール確認、ユーザ情報更新、ユーザ情報削除
public class UserDao {
	// ログインできるならLoginUserのインスタンスを返す
		public boolean login(String mail,String pass) {
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



//引数userで指定されたレコードを登録し、成功したらtrueを返す
		public boolean userRegist(String mail, String pass, String userName, String icon, int openClose, String introduction, String createdAt) {
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

				pStmt.setString(1, mail);


				pStmt.setString(2, pass);

				pStmt.setString(3, userName);

			if (user.getIcon() != null && !user.getIcon().equals("")) {
				pStmt.setString(4, user.getIcon());
			} else {
				pStmt.setString(4, "");
			}

			/*不明*/	pStmt.setInt(5, private);


			if (user.getIntroduction() != null && !user.getIntroduction().equals("")) {
				pStmt.setString(6, user.getIntroduction());
			} else {
				pStmt.setString(6, "");
			}


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


	// 引数userで指定されたレコードを更新し、成功したらtrueを返す
		public boolean update(User user) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// SQL文を準備する
				String sql = "UPDATE Bc SET company=?, department=?, position=?, name=?, zipcode=?, address=?, phone=?, fax=?, email=?, remarks=? WHERE number=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				if (user.getCompany() != null && !card.getCompany().equals("")) {
					pStmt.setString(1, card.getCompany());
				}
				else {
					pStmt.setString(1, null);
				}
				if (user.getDepartment() != null && !card.getDepartment().equals("")) {
					pStmt.setString(2, card.getDepartment());
				}
				else {
					pStmt.setString(2, null);
				}
				if (user.getPosition() != null && !card.getPosition().equals("")) {
					pStmt.setString(3, card.getPosition());
				}
				else {
					pStmt.setString(3, null);
				}
				if (card.getName() != null && !card.getName().equals("")) {
					pStmt.setString(4, card.getName());
				}
				else {
					pStmt.setString(4, null);
				}
				if (card.getZipcode() != null && !card.getZipcode().equals("")) {
					pStmt.setString(5, card.getZipcode());
				}
				else {
					pStmt.setString(5, null);
				}
				if (card.getAddress() != null && !card.getAddress().equals("")) {
					pStmt.setString(6, card.getAddress());
				}
				else {
					pStmt.setString(6, null);
				}
				if (card.getPhone() != null && !card.getPhone().equals("")) {
					pStmt.setString(7, card.getPhone());
				}
				else {
					pStmt.setString(7, null);
				}
				if (card.getFax() != null && !card.getFax().equals("")) {
					pStmt.setString(8, card.getFax());
				}
				else {
					pStmt.setString(8, null);
				}
				if (card.getEmail() != null && !card.getEmail().equals("")) {
					pStmt.setString(9, card.getEmail());
				}
				else {
					pStmt.setString(9, null);
				}
				if (card.getRemarks() != null && !card.getRemarks().equals("")) {
					pStmt.setString(10, card.getRemarks());
				}
				else {
					pStmt.setString(10, null);
				}
				pStmt.setInt(11, card.getNumber());

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









}
