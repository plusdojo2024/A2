package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.Chat;
import model.Post;
import model.ReviewDisplay;
import model.User;

//チャットのための情報を取ってくるDAO
public class ChatDao {

	//トーク履歴を表示させる
	public List<Chat> selectChatHistory(int uesrId, int otherUserId){
		Connection conn = null;
		List<Chat> chatList = new ArrayList<Chat>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT chat_id, user_id_speaker, user_id_listener, talk, image, SUBSTRING(created_at,1,19) AS created_at FROM chat"
					+ "WHERE (user_id_speaker=? AND user_id_listener=?) OR (user_id_speaker=? AND user_id_listener=?)"
					+ "ORDER BY created_at";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, uesrId);
			pStmt.setInt(2, otherUserId);
			pStmt.setInt(3, otherUserId);
			pStmt.setInt(4, uesrId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Chat record = new Chat();

				record.setChatId(rs.getInt("chat_id"));
				record.setUserIdSpeaker(rs.getInt("user_id_speaker"));
				record.setUserIdListener(rs.getInt("user_id_listener"));
				record.setTalk(rs.getString("talk"));
				record.setImage(rs.getString("image"));
				record.setCreatedAt(rs.getString("created_at"));

				chatList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			chatList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			chatList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					chatList = null;
				}
			}
		}

		// 結果を返す
		return chatList;
	}

	//トーク履歴を記録する
	public boolean registChat(Chat chat) {
		Connection conn = null;
        boolean result = false;

        try {
            // JDBCドライバを読み込むで
            Class.forName("org.h2.Driver");
            // データベースに接続するで
            conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data1/sample", "sa", "");

            // SQL文を準備するで
            String sql = "INSERT INTO chat (user_id_speaker, user_id_listener, talk, image, created_at) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pStmt = conn.prepareStatement(sql);

			// Java側で現在のタイムスタンプを取得
			Timestamp createdAt = new Timestamp(System.currentTimeMillis());

            // パラメータを設定するで
            pStmt.setInt(1, chat.getUserIdSpeaker());
            pStmt.setInt(2, chat.getUserIdListener());
            pStmt.setString(3, chat.getTalk());
            pStmt.setString(4, chat.getImage());
            pStmt.setTimestamp(5, createdAt);

            // INSERT文を実行し、登録に成功したらresultにtrueを入れる
         		if (pStmt.executeUpdate() == 1) {
         			result = true;
         		}

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // データベースを切断するで
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
	}

	//チャットした相手の一覧を表示させる（マイページのタブで利用）
	public List<Chat> selectChatList(int userId) {
		Connection conn = null;
		List<Chat> chatList = new ArrayList<Chat>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT r.review_id, r.user_id_writer, r.contents_id, r.title, r.review, r.image, SUBSTRING(r.created_at,1,19), u.user_name, u.icon FROM review AS r (INNER) JOIN user AS u ON r.user_id_writer=u.user_id WHERE r.user_id_writer=? AND u.flag=1 AND u.open_close=1";
			SELECT chat_id, user_id_speaker, user_id_listener, talk, image, SUBSTRING(created_at,1,19) AS created_at"
					+ "WHERE (user_id_speaker=? AND user_id_listener=?) OR (user_id_speaker=? AND user_id_listener=?)"
					+ "ORDER BY created_at

			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Chat record = new Chat();

				record.setReviewId(rs.getInt("r.review_id"));
				record.setUserIdWriter(rs.getInt("r.user_id_writer"));
				record.setContentsId(rs.getInt("r.contents_id"));
				record.setTitle(rs.getString("r.title"));
				record.setReview(rs.getString("r.review"));
				record.setImage(rs.getString("r.image"));
				record.setCreatedAt(rs.getString("r.created_at"));
				record.setUserName(rs.getString("u.user_name"));
				record.setIcon(rs.getString("u.icon"));

				chatList.add(record);
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
}

	//ランダムチャットの候補相手の一覧を取得する
	public List<User> selectRandomChat(int contentsId){
		Connection conn = null;
		List<User> userList = new ArrayList<User>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT m.contents_id, u.user_id, u.user_name, u.icon"
					+ "FROM my_contents AS m INNER JOIN user AS u ON m.user_id=u.user_id "
					+ "WHERE m.contents_id=?  AND u.flag=1  AND u.open_close=1";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
				while (rs.next()) {
					User record = new User();

					record.setUserId(rs.getInt("u.user_id"));
					record.setUserName(rs.getString("u.user_name"));
					record.setIcon(rs.getString("u.icon"));

					userList.add(record);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				userList = null;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				userList = null;
			}
			finally {
				// データベースを切断
				if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					userList = null;
				}
			}
		}
		// 結果を返す
		return userList;
	}

	//一度表示させたときに既読にするメソッド
	public boolean registChecked(int chatId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE chat SET checked=1 WHERE chat_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, chatId);

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
