package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.GoodDao;
import dao.ReviewDisplayDao;
import model.User;


@WebServlet("/ApiGoodServlet")
public class ApiGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//決まりの文章、とりあえず書くと覚えておこう
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		//文字コードの指定（これがないとJSPで文字化けする）
		response.setContentType("text/html;charser=UTF-8");


		// もしもログインしていなかったらログインサーブレットにリダイレクトする
    	HttpSession session = request.getSession();
    	if (session.getAttribute("loginUser") == null) {
    		response.sendRedirect("/A2/LoginServlet");
    		return;
    	}

    	//セッションスコープからユーザーIDを取ってくる
    	User user = (User)session.getAttribute("user");
    	int userId = user.getUserId();

    	//DAOをインスタンス（実体）化
    	GoodDao gDao = new GoodDao();
		ReviewDisplayDao rdDao = new ReviewDisplayDao();

		//いいねボタンが押されたときの処理
		if(request.getParameter("data1")!=null && request.getParameter("data2")!=null) {
			// 送信されたデータの取得
			String data1 = request.getParameter("data1");
			String data2 = request.getParameter("data2");
			int good = Integer.parseInt(data1);
			int reviewId = Integer.parseInt(data2);
				//入力されたデータを表示
				System.out.println(data1);
				System.out.println(data2);

			//いいねがつけられた時の処理
			if(good == 1) {

				//送信されたデータをGoodテーブルに追加
				boolean result = gDao.goodRegist(reviewId, userId);

				//Jackson機能のmapperをインスタンス（実体）化
				ObjectMapper mapper = new ObjectMapper();
				try {
			        //JavaオブジェクトからJSONに変換
			        String resultJson = mapper.writeValueAsString(result);
			        System.out.println(resultJson);
			        //JSONの出力
			        response.setContentType("application/json; charset=UTF-8");
			        response.getWriter().write(resultJson);
			    } catch (JsonProcessingException e) {
			        e.printStackTrace();
			    }

			//いいねが削除された時の処理
			} else {
				//送信されたデータをGoodテーブルに追加
				boolean result = gDao.goodDelete(reviewId, userId);

				//Jackson機能のmapperをインスタンス（実体）化
				ObjectMapper mapper = new ObjectMapper();
				try {
			        //JavaオブジェクトからJSONに変換
			        String resultJson = mapper.writeValueAsString(result);
			        System.out.println(resultJson);
			        //JSONの出力
			        response.setContentType("application/json; charset=UTF-8");
			        response.getWriter().write(resultJson);
			    } catch (JsonProcessingException e) {
			        e.printStackTrace();
			    }
			}
		//１秒毎にいいねの数を取得するメソッド←今のシステムの構造だと、表示してる全部のレビューIDをとってこないといけないのでめんどくさい
//		}else {
//			int count = rdDao.countGood();
//			//Jackson機能のmapperをインスタンス（実体）化
//			ObjectMapper mapper = new ObjectMapper();
//			try {
//		        //JavaオブジェクトからJSONに変換
//		        String testJson = mapper.writeValueAsString(count);
//		        System.out.println(testJson);
//		        //JSONの出力
//		        response.setContentType("application/json; charset=UTF-8");
//		        response.getWriter().write(testJson);
//		    } catch (JsonProcessingException e) {
//		        e.printStackTrace();
//		    }
		}
	}

}
