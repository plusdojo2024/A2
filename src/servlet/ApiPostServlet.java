package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.PostDao;
import dao.PostListDao;
import dao.PostReceiveDao;
import model.Post;
import model.Review;
import model.User;

public class ApiPostServlet {
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
    	PostDao pDao= new PostDao();
    	PostReceiveDao prDao= new PostReceiveDao();
    	PostListDao plDao= new PostListDao();

		//追加ボタンが押されたときの処理
		if(request.getParameter("data1")!=null) {
			// 送信されたデータの取得
			String data1 = request.getParameter("data1");
			String data2 = request.getParameter("data2");
			String data3 = request.getParameter("data3");

			String status = data1;
			String title = data2;
			String recommend = data3;
				//入力されたデータを表示
				System.out.println(data1);
				System.out.println(data2);
				System.out.println(data3);

			//投函時の処理
			if(status.equals ("投函")) {
					//beansを作る
					Post postBeans = new Post();
					postBeans.setTitle(title);
					postBeans.setRecommend(recommend);
					postBeans.setUserId(userId);
					//送信されたデータをpostテーブルに追加
					boolean result = pDao.postInsert(postBeans);

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

				} //受け取り時の処理
					else if(status.equals ("受け取り")){
					//beansを作る
					Review reviewBeans = new Review();
					reviewBeans.setContentsId(contentsId);
					reviewBeans.setTitle(title);
					reviewBeans.setReview(review);
					reviewBeans.setUserId(userId);
					//送信されたデータをreviewテーブルに追加
					boolean result = rDao.reviewUpdate(reviewBeans);

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
				}//一覧時の処理
					else if(status.equals ("一覧")){
					//送信されたデータをreviewテーブルに追加
					boolean result = rDao.reviewDelete(reviewId);

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
		}
	}

}
