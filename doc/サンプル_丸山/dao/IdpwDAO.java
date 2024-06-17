package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;

import model.Idpw;
import model.LoginUser;

public class IdpwDAO {
	// ログインできるならLoginUserのインスタンスを返す
	public LoginUser login(Idpw idpw) {
		Connection conn = null;
		LoginUser loginUser = new LoginUser(idpw.getId());

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/DOJO2024DB/ BC_PROTOTYPE", "sa", "");

			// SELECT文を準備するカウントだとネームが表示されない1しか表示されない
			String sql = "SELECT COUNT(*), NAME FROM Idpw WHERE id = ? AND pw = ? GROUP BY NAME";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, idpw.getId());
			pStmt.setString(2,idpw.getPw());

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();//表の一行目を見に行く
			if (rs.getInt("COUNT(*)") == 1) {
				loginUser.setUserName(rs.getString("name"));
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

		// パスワードを調べて返す
		public String selectPw(String id) {
			Connection conn = null;
			String pw = null;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/DOJO2024DB/ BC_PROTOTYPE", "sa", "");

				// SELECT文を準備するカウントだとネームが表示されない1しか表示されない
				String sql = "SELECT pw FROM IDPW WHERE id = ?";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setString(1, id);

				// SELECT文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
				//表の一行目を見に行く
				rs.next();
				if (rs.getString("pw") != null) {
					pw = rs.getString("pw");
				}//失敗したらnullのまま
			}
			catch (SQLNonTransientException e) {
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
			return pw;
		}

		// 新しいユーザー情報を登録し、結果を返す
		public boolean userRegist(Idpw idpw, String userName) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/DOJO2024DB/ BC_PROTOTYPE", "sa", "");

				// INSERTT文を準備する
				String sql = "INSERT INTO IDPW VALUES (?, ?, ?)";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setString(1, idpw.getId());
				pStmt.setString(2, idpw.getPw());
				pStmt.setString(3, userName);

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

		//指定されたユーザー情報を更新し、成功したらtrueを返す
		public boolean UserUpdate(String newId, String newPw, String newUserName, String id) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/DOJO2024DB/ BC_PROTOTYPE", "sa", "");

				// SQL文を準備する
				String sql = "UPDATE IDPW SET id=?, pw=?, name=? WHERE id = ?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setString(1, newId);
				pStmt.setString(2, newPw);
				pStmt.setString(3, newUserName);
				pStmt.setString(4, id);

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

		// 引数numberで指定されたユーザー情報を削除し、成功したらtrueを返す
		public boolean UserDelete(String id) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/DOJO2024DB/ BC_PROTOTYPE", "sa", "");

				// SQL文を準備する
				String sql = "DELETE FROM IDPW WHERE id = ?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setString(1, id);

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