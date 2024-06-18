package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
	public List<Review> select(Review review) {
		Connection conn = null;
		ArrayList<Review> reviewList = new ArrayList<Review>();

		try {
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/wac", "sa", "");
			String sql =
			PreparedStatement pStmt = conn.prepareStatement(sql);
		}
	}
}
