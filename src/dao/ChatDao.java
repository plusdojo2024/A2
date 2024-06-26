package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import model.Chat;
import model.User;

//チャットのための情報を取ってくるDAO
public class ChatDao {

	//トーク履歴を表示させる
	public List<Chat> selectChatHistory(int userId, int otherUserId){
		Connection conn = null;
		List<Chat> chatList = new ArrayList<Chat>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT chat_id, user_id_speaker, user_id_listener, talk, image, SUBSTRING(created_at,1,19) AS created_at FROM chat "
					+ "WHERE (user_id_speaker=? AND user_id_listener=?) OR (user_id_speaker=? AND user_id_listener=?)"
					+ "ORDER BY created_at";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);
			pStmt.setInt(2, otherUserId);
			pStmt.setInt(3, otherUserId);
			pStmt.setInt(4, userId);

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
            conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

            // SQL文を準備するで
            String sql = "INSERT INTO chat (user_id_speaker, user_id_listener, talk, image, created_at) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pStmt = conn.prepareStatement(sql);

			  // パラメータを設定するで
            pStmt.setInt(1, chat.getUserIdSpeaker());
            pStmt.setInt(2, chat.getUserIdListener());
            pStmt.setString(3, chat.getTalk());
            pStmt.setString(4, chat.getImage());
            pStmt.setString(5, chat.getCreatedAt());

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
	public List<Integer> selectChatList(int userId) {
		Connection conn = null;
		Set <Integer> chatSet = new LinkedHashSet<Integer>();
		List<Integer> chatList;


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT DISTINCT user_id_speaker, user_id_listener "
					+ "FROM (SELECT user_id_speaker, user_id_listener FROM chat "
					+ "WHERE user_id_speaker=? OR user_id_listener=? ORDER BY created_at DESC)";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);
			pStmt.setInt(2, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();



			// 結果表から自分のuser_idを除き、重複を許さないコレクションにコピーする
			while (rs.next()) {
				if(rs.getInt("user_id_speaker") != userId) {
					chatSet.add(rs.getInt("user_id_speaker"));
				}
				if(rs.getInt("user_id_listener") != userId) {
					chatSet.add(rs.getInt("user_id_listener"));
				}
			}
			chatList = new ArrayList<Integer>(chatSet);
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


	//userIdで指定した相手との最後の会話内容を取得する
	public String getLastTalk(int userId, int otherUserId) {
		Connection conn = null;
		String talk = null;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT LAST_VALUE(talk) IGNORE NULLS OVER (ORDER BY created_at) AS talk "
					+ "FROM chat WHERE (user_id_speaker=? AND user_id_listener=?) OR (user_id_speaker=? AND user_id_listener=?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);
			pStmt.setInt(2, otherUserId);
			pStmt.setInt(3, otherUserId);
			pStmt.setInt(4, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

            //結果のテーブルの1行目を見に行く
            rs.next();

            //talkに会話内容を入れる。失敗したらnullのままになる
            talk = rs.getString("talk");
            System.out.println(talk);
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
		return talk;
	}


	//userIdで指定した相手との未読数をカウントする
	public int countUnChecked(int userId, int otherUserId) {
		Connection conn = null;
		int unChecked = 0;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "SELECT COUNT(checked) "
					+ "FROM chat WHERE checked=0 AND ((user_id_speaker=? AND user_id_listener=?) OR (user_id_speaker=? AND user_id_listener=?))";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, userId);
			pStmt.setInt(2, otherUserId);
			pStmt.setInt(3, otherUserId);
			pStmt.setInt(4, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

            //結果のテーブルの1行目を見に行く
            rs.next();

            //unCheckedに未読数(checked=0)を入れる。失敗したらnullのままになる
            unChecked = rs.getInt("COUNT(checked)");
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
		return unChecked;
	}


	//一度表示させたときに既読にするメソッド
	public boolean registChecked(String talk) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE chat SET checked=1 WHERE talk=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, talk);

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
					+ "WHERE m.contents_id=? AND m.status=1 AND u.flag=1  AND u.open_close=1";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
				while (rs.next()) {
					User record = new User();

					record.setUserId(rs.getInt("user_id"));
					record.setUserName(rs.getString("user_name"));
					record.setIcon(rs.getString("icon"));

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
}
