package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.sql.Timestamp;

import model.PostReceive;

//ポスト受け取り表示のための情報を取ってくるDAO
public class PostReceiveDao {

	//自分がポストで受け取ったおすすめを、ポストレシーブテーブルに記録する
	public boolean postReceiveInsert(PostReceive postReceive) {
		Connection conn = null;
		boolean result = false;


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "INSERT post_recieve(user_id, post_id, created_at) VALUE(?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);



			// Java側で現在のタイムスタンプを取得
			Timestamp createdAt = new Timestamp(System.currentTimeMillis());


			// INSERTT文を準備する
			pStmt.setInt(1,postReceive.getUserId());
			pStmt.setInt(2,postReceive.getPostId());
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

			//自分が気になる！をつけたときの処理
			public boolean myInterestRegist(int userId, int postId) {
				Connection conn = null;
				boolean result = false;

				try {
					//データベースの準備
					Class.forName("org.h2.Driver");
					conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

					// INSERT文の準備
					String sql = "UPDATE post_receive SET my_interest=1 WHERE user_id=? AND post_id=?";
					PreparedStatement pStmt = conn.prepareStatement(sql);
					pStmt.setInt(1, userId);
					pStmt.setInt(2, postId);

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


			//自分がつけた気になる！の削除
			public boolean myInterestDelete(int userId, int postId) {
				Connection conn = null;
				boolean result = false;

				try {
					//データベースの準備
					Class.forName("org.h2.Driver");
					conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

					// INSERT文の準備
					String sql = "UPDATE post_receive SET my_interest=0 WHERE user_id=? AND post_id=?";
					PreparedStatement pStmt = conn.prepareStatement(sql);
					pStmt.setInt(1, userId);
					pStmt.setInt(2, postId);

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

}
