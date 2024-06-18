package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.PostReceive;

public class PostReceiveDao {

    public List<PostReceive> userSelect(int user_id_writer) {
		Connection conn = null;
		List<PostReceive> receiveList = new ArrayList<PostReceive>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT r.review_id, r.user_id_writer, r.contents_id, r.title, r.review, r.image, r.created_at, u.user_name, u.icon FROM review AS r (INNER) JOIN user AS u ON r.user_id_writer=u.user_id WHERE r.user_id_writer=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, user_id_writer);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				PostReceive record = new PostReceive();

				record.setPostReceiveId(rs.getInt("r.post_receive_id"));
				record.setUserId(rs.getInt("r.user_id"));
				record.setPostId(rs.getInt("r.post_id"));
				record.setCreatedAt(rs.getString("r.created_at"));
				record.setUpdatedAt(rs.getString("r.updated_at"));


				receiveList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			receiveList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			receiveList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					receiveList = null;
				}
			}
		}

		// 結果を返す
		return receiveList;
	}

}
