package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ReviewDisplay;


public class TimelineDao {

	//ユーザIDでレビューを検索し、指定したユーザが書いたレビューとそれを書いたユーザ情報の一覧のリストを返す(いいねの情報のみ別途取得)
    public List<ReviewDisplay> userSelect(int userId) {
    	Connection conn = null;
    	List<ReviewDisplay> reviewList = new ArrayList<ReviewDisplay>();

    	try {
    		// JDBCドライバを読み込む
    		Class.forName("org.h2.Driver");

    		// データベースに接続する
    		conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

    		// SQL文を準備する
    		String sql = "SELECT r.review_id, r.user_id_writer, r.contents_id, r.title, r.review,"
    				+ " r.image,  SUBSTRING(r.created_at,1,19)  AS created_at, u.user_name, u.icon, f.user_id "
    				+ "FROM review AS r INNER JOIN user AS u "
    				+ "ON r.user_id_writer=u.user_id"
    				+ " LEFT JOIN (SELECT user_id_favorite, user_id FROM favorite_user WHERE user_id=?) AS f"
    				+ " ON r.user_id_writer=f.user_id_favorite "
    				+ "WHERE f.user_id=? AND u.flag=1  AND u.open_close=1 AND LEFT(r.created_at,10) > (CURRENT_DATE-7)";
    		PreparedStatement pStmt = conn.prepareStatement(sql);

    		// SQL文を完成させる
    		pStmt.setInt(1, userId);

    		// SQL文を実行し、結果表を取得する
    		ResultSet rs = pStmt.executeQuery();

    		// 結果表をコレクションにコピーする
    		while (rs.next()) {
    			ReviewDisplay record = new ReviewDisplay ();

    			record.setReviewId(rs.getInt("r.review_id"));
    			record.setUserIdWriter(rs.getInt("r.user_id_writer"));
    			record.setContentsId(rs.getInt("r.contents_id"));
    			record.setTitle(rs.getString("r.title"));
    			record.setReview(rs.getString("r.review"));
				record.setImage(rs.getString("r.image"));
				record.setCreatedAt(rs.getString("created_at"));
				record.setUserName(rs.getString("u.user_name"));
				record.setIcon(rs.getString("u.icon"));
				record.setUserId(rs.getString("f.user_id"));

				reviewList.add(record);
    		}
		}
    	catch (SQLException e) {
			e.printStackTrace();
			reviewList = null;
		}
    	catch (ClassNotFoundException e) {
			e.printStackTrace();
			reviewList = null;
		}
    	finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					reviewList = null;
				}
			}
		}
    	// 結果を返す
		return reviewList;
	}

    //favoriteUserのuserIdで検索し、1週間以内に投稿されたレビューを表示する

}
