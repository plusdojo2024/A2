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

import dao.ReviewDao;
import model.Review;
import model.User;

/**
 * Servlet implementation class ApiReviewServlet
 */
@WebServlet("/ApiReviewServlet")
public class ApiReviewServlet extends HttpServlet {
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
    	ReviewDao rDao= new ReviewDao();

		//追加ボタンが押されたときの処理
		if(request.getParameter("data1")!=null) {
			// 送信されたデータの取得
			String data1 = request.getParameter("data1");
			String data2 = request.getParameter("data2");
			String data3 = request.getParameter("data3");
			String data4 = request.getParameter("data4");
			String data5 = request.getParameter("data5");

			String status = data1;
			int contentsId = Integer.parseInt(data2);
			String title = data3;
			String review = data4;
			int reviewId = Integer.parseInt(data5);
				//入力されたデータを表示
				System.out.println(data1);
				System.out.println(data2);
				System.out.println(data3);
				System.out.println(data4);

			//登録時の処理
			if(status.equals ("登録")) {
					//beansを作る
					Review reviewBeans = new Review();
					reviewBeans.setContentsId(contentsId);
					reviewBeans.setTitle(title);
					reviewBeans.setReview(review);
					reviewBeans.setUserId(userId);
					//送信されたデータをreviewテーブルに追加
					boolean result = rDao.reviewRegist(reviewBeans);

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

				} //編集時の処理
					else if(status.equals ("編集")){
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
				}//削除時の処理
					else if(status.equals ("削除")){
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


