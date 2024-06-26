package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.PostList;


public class PostListDao {
	//ポスト投函一覧を表示させる
	public List<PostList> postSelect(int userIdWriter) {
		Connection conn = null;
		List<PostList> pList = new ArrayList<PostList>();


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT post_id, user_id_writer, title, recommend FROM post WHERE user_id_writer=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userIdWriter);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				PostList record = new PostList();

				record.setPostId(rs.getInt("post_id"));
				record.setUserIdWriter(rs.getInt("user_id_writer"));
				record.setTitle(rs.getString("title"));
				record.setRecommend(rs.getString("recommend"));



				pList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pList = null;
				}
			}
		}

		// 結果を返す
		return pList;
	}


	//ポスト受け取り一覧を表示させる
	public List<PostList> postReceiveSelect(int userId) {
		Connection conn = null;
		List<PostList> prList = new ArrayList<PostList>();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT r.user_id, p.post_id, p.title, p.recommend, r.my_interest FROM post AS p INNER JOIN post_receive AS r ON p.post_id=r.post_id WHERE r.user_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				PostList record = new PostList();

				record.setUserId(rs.getInt("user_id"));
				record.setPostId(rs.getInt("post_id"));
				record.setTitle(rs.getString("title"));
				record.setRecommend(rs.getString("recommend"));
				record.setMyInterest(rs.getInt("my_interest"));

				prList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			prList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			prList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					prList = null;
				}
			}
		}

		// 結果を返す
		return prList;
	}
}