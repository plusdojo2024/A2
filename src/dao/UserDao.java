package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import model.User;

public class UserDao {
	// 引数paramで検索項目を指定し、検索結果のリストを返す　入力したデータが(user card)に入っている
	public List<user> select(user card) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		ArrayList<user> cardList = new ArrayList<user>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する	地図、ID、pass
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			if (card.getNumber() == 0) {///card.getNumber()に何も入っていなかったら
				String sql = "SELECT * FROM user WHERE mail LIKE ? AND pass LIKE ? AND user_name LIKE ? "
						+ "AND icon LIKE ? AND open_close LIKE ? AND introduction LIKE ? AND flag LIKE ? AND created_at LIKE ?AND updated_at LIKE ?ORDER BY user_id";




	}

}
