package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.sql.Timestamp;

import model.Post;

public class PostDao {

	//ポストに投函されたおすすめをポストテーブルに追加する
	public boolean postInsert(Post post ){
		Connection conn = null;
    	boolean result = false;

    	try {
    		// JDBCドライバを読み込む
    		Class.forName("org.h2.Driver");

    		// データベースに接続する
    		conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

    		// Java側で現在のタイムスタンプを取得
    		Timestamp createdAt = new Timestamp(System.currentTimeMillis());

    		// SQL文を準備する
    		String sql = "INSERT INTO post(user_id_writer, title, recommend, created_at) VALUE(?, ?, ?, ?) ";

    		PreparedStatement pStmt = conn.prepareStatement(sql);

    		// SQL文を完成させる
    		pStmt.setInt(1, post.getUserId());
    		pStmt.setString(2, post.getTitle());
    		pStmt.setString(3, post.getRecommend());
    		pStmt.setTimestamp(4, createdAt);

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

	//気になる！の登録
		public boolean interestRegist(int postId) {
			Connection conn = null;
			boolean result = false;

			try {
				//データベースの準備
				Class.forName("org.h2.Driver");
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// INSERT文の準備
				String sql = "UPDATE post SET interest=1 WHERE post_id=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setInt(1, postId);

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
		}//気になる！の削除
		public boolean interestDelete(int postId) {
			Connection conn = null;
			boolean result = false;

			try {
				//データベースの準備
				Class.forName("org.h2.Driver");
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// INSERT文の準備
				String sql = "UPDATE post SET interest=0 WHERE post_id=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setInt(1, postId);

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
