package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;

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
				String sql = "INSERT INTO contents(Title,Ruby,Image,Genre,Year,Creator,CreatedAt) VALUES (?,?,?,?,?,?,?)";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setString(1, contents.getTitle());
				pStmt.setString(2, contents.getRuby());
				pStmt.setString(3, contents.getImage());
				pStmt.setString(4, contents.getGenre());
				pStmt.setString(5, contents.getYear());
				pStmt.setString(6, contents.getCreator());
				pStmt.setString(7, contents.getCreatedAt());

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
}