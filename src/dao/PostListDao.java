package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.PostReceive;

public class PostListDao {
	//ポスト投函一覧を表示させる
	public



	Connection conn = null;


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT post_id, user_id_writer, title, recommend FROM post WHERE user_id_writer=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, user_id_writer);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();
}
		//ポスト受け取り一覧を表示させる
		public

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT r.user_id, p.title, p.recommend, p.interestFROM post AS INNER JOIN post_recieve AS ON p.post_id=r.post_id WHERE r.user_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, user_id_writer);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();
}