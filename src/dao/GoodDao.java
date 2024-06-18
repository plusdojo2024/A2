package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GoodDao {
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
}

	//ランキング表示


