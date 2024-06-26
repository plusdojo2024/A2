package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.sql.Timestamp;

//ポスト受け取り表示のための情報を取ってくるDAO
public class PostReceiveDao {

	//自分がポストで受け取ったおすすめを、ポストレシーブテーブルに記録する
	public boolean postReceiveInsert(int userId, int postId) {
		Connection conn = null;
		boolean result = false;


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

			// SQL文を準備する
			String sql = "INSERT INTO POST_RECEIVE(user_id, post_id, created_at) VALUES(?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);



			// Java側で現在のタイムスタンプを取得
			Timestamp createdAt = new Timestamp(System.currentTimeMillis());

			// INSERTT文を準備する
			pStmt.setInt(1,userId);
			pStmt.setInt(2,postId);
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

			//自分が気になる！をつけたときの処理
			public boolean myInterestRegist(int userId, int postId) {
				Connection conn = null;
				boolean result = false;

				try {
					//データベースの準備
					Class.forName("org.h2.Driver");
					conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

					// SQL文の準備
					String sql = "UPDATE post_receive SET my_interest=1 WHERE user_id=? AND post_id=?";
					PreparedStatement pStmt = conn.prepareStatement(sql);
					pStmt.setInt(1, userId);
					pStmt.setInt(2, postId);

					// SQL文を実行し、登録に成功したらresultにtrueを入れる
					if (pStmt.executeUpdate() > 0 ) {
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


			//自分がつけた気になる！の削除
			public boolean myInterestDelete(int userId, int postId) {
				Connection conn = null;
				boolean result = false;

				try {
					//データベースの準備
					Class.forName("org.h2.Driver");
					conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

					// INSERT文の準備
					String sql = "UPDATE post_receive SET my_interest=0 WHERE user_id=? AND post_id=?";
					PreparedStatement pStmt = conn.prepareStatement(sql);
					pStmt.setInt(1, userId);
					pStmt.setInt(2, postId);

					// INSERT文を実行し、登録に成功したらresultにtrueを入れる
					if (pStmt.executeUpdate() > 0) {
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

			//受け取ったおすすめを、既に受け取ったことがあるかどうか調べる。
			//既に受け取ったことがある場合はtrueを、受け取ったことがない場合はfalseを返す
			public boolean confirmRecommendHistory(int postId) {
				Connection conn = null;
				boolean result = true;

				try {
					//データベースの準備
					Class.forName("org.h2.Driver");
					conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

					// SELECT文の準備
					String sql = "SELECT count(*) FROM post_receive WHERE post_id=?";
					PreparedStatement pStmt = conn.prepareStatement(sql);
					pStmt.setInt(1, postId);

					// SELECT文を実行し、結果表を取得する
					ResultSet rs = pStmt.executeQuery();

					//mailが既に登録されていたらtrue 登録されていなかったらfalseを入れる
					rs.next();//表の一行目を見に行く
					if (rs.getInt("count(*)") == 0) {
						result = false;
						//失敗したらresultはtrueのまま
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

			//指定したポストIDのおすすめに、誰か1人でも気になる！をつけているかどうか調べる。
			//気になる！をつけている人が1人以上いた場合1を、0人だった場合0を返す。
				public int checkInterest(int postId) {
					Connection conn = null;
					int interest = 0;

					try {
						//データベースの準備
						Class.forName("org.h2.Driver");
						conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

						// SELECT文の準備
						String sql = "SELECT count(*) FROM post_receive WHERE post_id=? AND my_interest=1";
						PreparedStatement pStmt = conn.prepareStatement(sql);
						pStmt.setInt(1, postId);

						// SELECT文を実行し、結果表を取得する
						ResultSet rs = pStmt.executeQuery();

						//気になる！をつけている人が1人以上いた場合1を入れる。0人だった場合0のまま。
						rs.next();//表の一行目を見に行く
						if (rs.getInt("count(*)") > 0) {
							interest = 1;
						}//処理に失敗したら0のまま
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
					return interest;
				}

				//指定したポストIDのおすすめに、自分が気になる！をつけたかどうか調べる
					public int checkMyInterest(int userId, int postId) {
						Connection conn = null;
						int myInterest = 0;

						try {
							//データベースの準備
							Class.forName("org.h2.Driver");
							conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

							// SELECT文の準備
							String sql = "SELECT my_interest FROM post_receive WHERE user_id=? AND post_id=?";
							PreparedStatement pStmt = conn.prepareStatement(sql);
							pStmt.setInt(1, userId);
							pStmt.setInt(2, postId);

							// SELECT文を実行し、結果表を取得する
							ResultSet rs = pStmt.executeQuery();

							//気になる！をつけていた場合(つまりmy_interestが1だったら)1を入れる。0人だった場合0のまま。
							rs.next();//表の一行目を見に行く
							if (rs.getInt("my_interest") == 1) {
								myInterest = 1;
							}//処理に失敗したら0のまま
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
						return myInterest;
					}


}
