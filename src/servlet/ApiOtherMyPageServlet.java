package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.FavoriteUserDao;
import model.User;

public class ApiOtherMyPageServlet {
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
		    	User user = (User)session.getAttribute("loginUser");
		    	int userId = user.getUserId();

		    	//DAOをインスタンス（実体）化
		    	FavoriteUserDao fDao= new FavoriteUserDao();

				//お気に入りユーザ登録または削除ボタンが押された時の処理
				if(request.getParameter("data1")!=null && request.getParameter("data2")!=null ) {
					// 送信されたデータの取得
					String data1 = request.getParameter("data1");
					String data2 = request.getParameter("data2");

					int userIdFavorite = Integer.parseInt(data1);
					int life = Integer.parseInt(data2);
						//入力されたデータを表示
						System.out.println(data1);
						System.out.println(data2);


					//登録時の処理
					if(life == 1) {

							//送信されたデータをFavoriteUserテーブルに追加
							boolean result = fDao.userRegist(userIdFavorite,userId);

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



					//削除時の処理
					} else {
						//送信されたデータをFavoriteUserテーブルから削除
						boolean result = fDao.userDelete(userIdFavorite,userId);

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
