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

import model.Contents;

public class ContentsDao {

//コンテンツ情報を登録し、結果を返す
		public boolean contentsRegist(Contents contents) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// INSERTT文を準備する
				String sql = "INSERT INTO contents(title,ruby,image,genre,year,creator,created_at) VALUES (?,?,?,?,?,?,?)";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// Java側で現在のタイムスタンプを取得
				Timestamp createdAt = new Timestamp(System.currentTimeMillis());

				pStmt.setString(1, contents.getTitle());
				pStmt.setString(2, contents.getRuby());
				pStmt.setString(4, contents.getGenre());
				pStmt.setString(5, contents.getYear());
				pStmt.setString(6, contents.getCreator());
				pStmt.setTimestamp(7, createdAt);

				//画像がnullだった場合は、デフォルト画像を登録する
				if(contents.getImage() == null) {
					pStmt.setString(3,"icon_default.png");
				} else {
					pStmt.setString(3, contents.getImage());
				}


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



			//コンテンツIDで指定されたコンテンツの情報返す
			public Contents contentsSelect(int contentsId) {
					Connection conn = null;
					Contents contents = new Contents();

				try {
					// JDBCドライバを読み込む
					Class.forName("org.h2.Driver");

					// データベースに接続する
					conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");


					// SELECT文を準備する
					String sql = "SELECT contents_id,title,ruby,genre,creator,year,image FROM contents WHERE contents_id=?";
					PreparedStatement pStmt = conn.prepareStatement(sql);

					pStmt.setInt(1,contentsId);

					// SELECT文を実行し、結果表を取得する
					ResultSet rs = pStmt.executeQuery();
					//表の一行目が入っていたら
					if (rs.next()) {
						contents.setContentsId(rs.getInt("contets_id"));
						contents.setContentsId(rs.getInt("title"));
						contents.setContentsId(rs.getInt("ruby"));
						contents.setContentsId(rs.getInt("genre"));
						contents.setContentsId(rs.getInt("creator"));
						contents.setContentsId(rs.getInt("year"));
						contents.setContentsId(rs.getInt("image"));
					} else {
						contents = null;
					}
					//失敗したらresultはtrueのまま
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
				return contents;
			}


	    //フリーワードで検索してヒットしたコンテンツのリストを返す
	    public List<Contents> searchContents(String freeWord) {
			Connection conn = null;
			List<Contents> contentsList = new ArrayList<Contents>();

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

				// SQL文を準備する
				String sql = "SELECT contents_id,title,ruby,genre,creator,year,image FROM contents"
						+ "WHERE title LIKE ? OR ruby LIKE ? OR genre LIKE ? creator LIKE ? OR year LIKE ? OR"
						+ "ORDER BY ruby";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setString(1, "%" + freeWord + "%");
				pStmt.setString(2, "%" + freeWord + "%");
				pStmt.setString(3, "%" + freeWord + "%");
				pStmt.setString(4, "%" + freeWord + "%");
				pStmt.setString(5, "%" + freeWord + "%");

				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// 結果表をコレクションにコピーする
				while (rs.next()) {
					Contents record = new Contents();

					record.setContentsId(rs.getInt("contents_id"));
					record.setTitle(rs.getString("title"));
					record.setRuby(rs.getString("ruby"));
					record.setGenre(rs.getString("genre"));
					record.setCreator(rs.getString("creator"));
					record.setYear(rs.getString("year"));
					record.setImage(rs.getString("image"));

					contentsList.add(record);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				contentsList = null;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				contentsList = null;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						contentsList = null;
					}
				}
			}

			// 結果を返す
			return contentsList;
		}
}