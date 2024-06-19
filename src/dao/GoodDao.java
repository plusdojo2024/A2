package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class GoodDao {

	//いいねの登録
	public boolean goodRegist(int reviewId, int userId) {
		Connection conn = null;
		boolean result = false;

		try {
			//データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// INSERT文の準備
			String sql = "INSERT INTO Good(review_id, user_id) VALUES (?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, reviewId);
			pStmt.setInt(2, userId);

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


	//いいねの削除
	public boolean goodDelete(int reviewId, int userId) {
		Connection conn = null;
		boolean result = false;

		try {
			//データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			//DELETE文の準備
			String sql ="DELETE FROM good WHERE review_id=? AND user_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, reviewId);
			pStmt.setInt(2, userId);

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


	//いいね総数の表示
	public int countTotalGood(int userIdWriter) {
		Connection conn = null;
		int count = 0;

		try {
			// データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文の準備
			String sql = "SELECT count(*) FROM good AS g INNER JOIN review AS r ON g.review_id = r.review_id + WHERE r.user_id_writer=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, userIdWriter);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			//結果のテーブルの1行目を見に行く
			rs.next();

			//countに指定したレビュー総数を入れる。失敗したらcountは0のままになる
			count = rs.getInt("count(*)");
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


	//ランキング表示
	public List<User> rankingSelect(){
		Connection conn = null;
		List<User> rankingList = new ArrayList<User>();

		try {
			// データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文の準備
			String sql = "SELECT r.user_id_writer, u.user_name, u.icon, count(r.user_id_writer)"
					+ "FROM review AS r"
					+ "INNER JOIN user AS u ON r.user_id_writer = u.user_id"
					+ "INNER JOIN good AS g ON r.review_id = g.review_id"
					+ "GROUP BY r.user_id_writer"
					+ "ORDER BY count(r.user_id_writer)(LIMIT 5)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				User record = new User();
				record.setUserId(rs.getInt("r.user_id_writer"));
				record.setUserName(rs.getString("u.user_name"));
				record.setIcon(rs.getString("u.icon"));
				record.setAllGoodCount(rs.getInt("count(r.user_id_writer)"));

				rankingList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			rankingList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			rankingList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					rankingList = null;
				}
			}
		}

		// 結果を返す
		return rankingList;
	}
}
