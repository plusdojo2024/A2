package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.sql.Timestamp;

import model.Review;

public class ReviewDao {
	//レビュー情報を登録し結果を返す
	public boolean reviewRegist(Review review) {
		Connection conn = null;
		boolean result = false;

		try {
			//データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");
			//INSERT文の準備
			String sql = "INSERT INTO review(user_id, contents_id, title, review, image, created_at) VALUES (?,?,?,?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// Java側で現在のタイムスタンプを取得
			Timestamp createdAt = new Timestamp(System.currentTimeMillis());

			//sql文を完成させる
			pStmt.setInt(1, review.getUserId());
			pStmt.setInt(2, review.getContentsId());
			pStmt.setString(3, review.getTitle());
			pStmt.setString(4, review.getReview());
			pStmt.setString(5, review.getImage());
			pStmt.setTimestamp(6, createdAt);

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

	//レビュー情報の削除
	public boolean reviewDelete(int reviewId) {
		Connection conn = null;
		boolean result = false;

		try {
			//データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");
			//DELETE文の準備
			String sql ="DELETE FROM review WHERE review_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, reviewId);

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

	//レビュー情報の更新
	public boolean reviewUpdate(Review review) {
		Connection conn = null;
		boolean result = false;

		try {
			//データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");
			//UPDATE文の準備
			String sql = "UPDATE review SET user_id=?, contents_id=?, title=?, review=?, image=?, update_at=DEFAULT WHERE review_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			//sql文を完成させる
			pStmt.setInt(1, review.getUserId());
			pStmt.setInt(2, review.getContentsId());
			pStmt.setString(3, review.getTitle());
			pStmt.setString(4, review.getReview());
			pStmt.setString(5, review.getImage());
			pStmt.setInt(6, review.getReviewId());

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

	//レビュー総数の表示
	public int countTotalReview(int userIdWriter) {
		Connection conn = null;
		int count = 0;

		try {
			//データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");
			//SELECT文の準備
			String sql = "SELECT COUNT(review_id) FROM review WHERE user_id_writer=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, userIdWriter);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			//結果のテーブルの1行目を見に行く
			rs.next();

			//countに指定したレビュー総数を入れる。失敗したらcountは0のままになる
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
}
