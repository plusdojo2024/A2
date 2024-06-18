package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.MyContents;

//マイコンテンツ表示のための情報を取ってくるDAO
public class MyContentsDao {

    //ユーザIDで検索し、コレクションのリストを取得する
    public List<MyContents> selectCollection(int userId) {
		Connection conn = null;
		List<MyContents> collectionList = new ArrayList<MyContents>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT m.user_id, m.contents_id, m.status, c.title, c.ruby, c.genre, c.creator, c.year, c.image FROM my_contents AS m (INNER) contents AS c ON m.contents_id=c.contents_idWHERE m.user_id=? AND m.status=1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				MyContents record = new MyContents();

				record.setUserId(rs.getInt("m.user_id"));
				record.setContentsId(rs.getInt("m.contents_id"));
				record.setStatus(rs.getInt("m.status"));
				record.setTitle(rs.getString("c.title"));
				record.setRuby(rs.getString("c.ruby"));
				record.setGenre(rs.getString("c.genre"));
				record.setCreator(rs.getString("c.creator"));
				record.setYear(rs.getString("c.year"));
				record.setImage(rs.getString("c.image"));

				collectionList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			collectionList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			collectionList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					collectionList = null;
				}
			}
		}

		// 結果を返す
		return collectionList;
	}


    //ユーザIDでレビューを検索し、指定したユーザが書いたレビューとそれを書いたユーザ情報の一覧のリストを返す(いいねの情報のみ別途取得)
    public List<MyContents> selectWishList(int userId) {
		Connection conn = null;
		List<MyContents> wishList = new ArrayList<MyContents>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT m.user_id, m.contents_id, m.status, c.title, c.ruby, c.genre, c.creator, c.year, c.image FROM my_contents AS m (INNER) contents AS c ON m.contents_id=c.contents_id WHERE m.user_id=? AND m.status=0;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				MyContents record = new MyContents();

				record.setUserId(rs.getInt("m.user_id"));
				record.setContentsId(rs.getInt("m.contents_id"));
				record.setStatus(rs.getInt("m.status"));
				record.setTitle(rs.getString("c.title"));
				record.setRuby(rs.getString("c.ruby"));
				record.setGenre(rs.getString("c.genre"));
				record.setCreator(rs.getString("c.creator"));
				record.setYear(rs.getString("c.year"));
				record.setImage(rs.getString("c.image"));

				wishList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			wishList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			wishList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					wishList = null;
				}
			}
		}

		// 結果を返す
		return wishList;
	}
}
