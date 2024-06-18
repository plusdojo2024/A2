package dao;

import model.Post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

	public List<Post> postSelect(int postId ){
		Connection conn = null;
    	List<Post> reviewList = new ArrayList<Post>();

    	try {
    		// JDBCドライバを読み込む
    		Class.forName("org.h2.Driver");

    		// データベースに接続する
    		conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");

    		// SQL文を準備する
    		String sql = "";

    		PreparedStatement pStmt = conn.prepareStatement(sql);

    		// SQL文を完成させる
    		pStmt.setInt(1, postId);
    	}
	}
}
