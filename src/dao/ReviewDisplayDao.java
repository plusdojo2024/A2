package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ReviewDisplay;

//レビュー表示のための情報を取ってくるDAO
public class ReviewDisplayDao {

    //ユーザIDでレビューを検索し、指定したユーザが書いたレビューとそれを書いたユーザ情報の一覧のリストを返す(いいねの情報のみ別途取得)
    public List<ReviewDisplay> userSelect(int userIdWriter) {
		Connection conn = null;
		List<ReviewDisplay> reviewList = new ArrayList<ReviewDisplay>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT r.review_id, r.user_id_writer, r.contents_id, r.title, r.review, r.image, r.created_at, u.user_name, u.icon FROM review AS r (INNER) JOIN user AS u ON r.user_id_writer=u.user_id WHERE r.user_id_writer=? AND u.flag=1 AND u.open_close=1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userIdWriter);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				ReviewDisplay record = new ReviewDisplay();

				record.setReviewId(rs.getInt("r.review_id"));
				record.setUserIdWriter(rs.getInt("r.user_id_writer"));
				record.setContentsId(rs.getInt("r.contents_id"));
				record.setTitle(rs.getString("r.title"));
				record.setReview(rs.getString("r.review"));
				record.setImage(rs.getString("r.image"));
				record.setCreatedAt(rs.getString("r.created_at"));
				record.setUserName(rs.getString("u.user_name"));
				record.setIcon(rs.getString("u.icon"));

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


    //コンテンツIDでレビューを検索し、指定したコンテンツに対するレビューとそれを書いたユーザ情報のリストを返す(いいねの情報のみ別途取得)
    public List<ReviewDisplay> contentsSelect(int contentsId) {
		Connection conn = null;
		List<ReviewDisplay> reviewList = new ArrayList<ReviewDisplay>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT r.review_id, r.user_id_writer, r.contents_id, r.title, r.review, r.image, r.created_at, u.user_name, u.icon FROM review AS r (INNER) JOIN user AS u ON r.user_id_writer=u.user_id WHERE r.user_id_writer=? AND u.flag=1 AND u.open_close=1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, contentsId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				ReviewDisplay record = new ReviewDisplay();

				record.setReviewId(rs.getInt("r.review_id"));
				record.setUserIdWriter(rs.getInt("r.user_id_writer"));
				record.setContentsId(rs.getInt("r.contents_id"));
				record.setTitle(rs.getString("r.title"));
				record.setReview(rs.getString("r.review"));
				record.setImage(rs.getString("r.image"));
				record.setCreatedAt(rs.getString("r.created_at"));
				record.setUserName(rs.getString("u.user_name"));
				record.setIcon(rs.getString("u.icon"));

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



    //レビューIDで指定したレビューのいいねの数を返す
    public int countGood(int reviewId) {
		Connection conn = null;
		int count = 0;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT count(review_id) FROM good WHERE review_id=? GROUP BY review_id";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, reviewId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

            //結果のテーブルの1行目を見に行く
            rs.next();

            //countに指定したレビューのいいね数を入れる。失敗したらcountは0のままになる
            count = rs.getInt("count(review_id)");
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
		return count;
	}

    //レビューIDで指定したレビューに、自分がいいねをつけているかどうか確認する。つけていたらtrue、つけていなかったらfalseを返す
    public boolean confirmGood(int userId, int reviewId) {
		Connection conn = null;
		boolean good = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT count(*) FROM good WHERE user_id=? AND review_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);
            pStmt.setInt(2, reviewId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

            //結果のテーブルの1行目を見に行く
            rs.next();

            //countの結果が1なら、いいねがついているのでtrue。0なら、いいねはついていないのでfalseのまま
            if (rs.getInt("count(*)") == 1) {
                good = true;
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
		return good;
	}

}
