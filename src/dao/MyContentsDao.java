package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.MyContents;

//コレクション、ウィッシュリストの表示、登録、削除のためのDAO
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
			String sql = "SELECT m.my_contents_id, m.user_id, m.contents_id, m.status, c.title, c.ruby, c.genre, c.creator, c.year, c.image FROM my_contents AS m (INNER) contents AS c ON m.contents_id=c.contents_idWHERE m.user_id=? AND m.status=1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				MyContents record = new MyContents();

				record.setMyContentsId(rs.getInt("m.my_contents_id"));
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

	//コレクションの登録を行う
	public boolean registCollection(int contentsId, int userId) {
		Connection conn = null;
		boolean result = false;


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "INSERT INTO my_contents(contents_id, user_id, status, created_at) VALUES (?,?,1,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);



			// Java側で現在のタイムスタンプを取得
			Timestamp createdAt = new Timestamp(System.currentTimeMillis());


			// INSERTT文を準備する
			pStmt.setInt(1,contentsId);
			pStmt.setInt(2,userId);
			pStmt.setTimestamp(3, createdAt);

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


	//ユーザIDで検索し、ウィッシュリストを取得する
    public List<MyContents> selectWishList(int userId) {
		Connection conn = null;
		List<MyContents> wishList = new ArrayList<MyContents>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT m.my_contents_id, m.user_id, m.contents_id, m.status, c.title, c.ruby, c.genre, c.creator, c.year, c.image FROM my_contents AS m (INNER) contents AS c ON m.contents_id=c.contents_id WHERE m.user_id=? AND m.status=0;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				MyContents record = new MyContents();

				record.setMyContentsId(rs.getInt("m.my_contents_id"));
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




	//コンテンツをウィッシュリストに登録する
	public boolean registWishList(int contentsId, int userId) {
		Connection conn = null;
		boolean result = false;


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "INSERT INTO my_contents(contents_id, user_id, status, created_at) VALUES (?,?,0,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);



			// Java側で現在のタイムスタンプを取得
			Timestamp createdAt = new Timestamp(System.currentTimeMillis());


			// INSERTT文を準備する
			pStmt.setInt(1,contentsId);
			pStmt.setInt(2,userId);
			pStmt.setTimestamp(3, createdAt);

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


	//マイコンテンツテーブルからデータを削除する
	public boolean deleteMyContents(int contentsId, int userId) {
		Connection conn = null;
		boolean result = false;

		try {
			//データベースの準備
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			//DELETE文の準備
			String sql ="DELETE FROM my_contents WHERE contents_id=? AND user_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, contentsId);
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








}
