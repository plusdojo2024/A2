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

import dao.ChatDao;

@WebServlet("/ApiCheckServlet")
public class ApiCheckServlet extends HttpServlet {
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

		    	//DAOをインスタンス（実体）化
		    	ChatDao cDao = new ChatDao();

				//トークが一度トーク画面に表示されたときの処理
				if(request.getParameter("data1")!=null) {
					// 送信されたデータの取得
					String data1 = request.getParameter("data1");
					int chatId = Integer.parseInt(data1);
						//入力されたデータを表示
						System.out.println(data1);

						//既読をチャットテーブルに登録
						boolean result = cDao.registChecked(chatId);

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
