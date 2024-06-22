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
import model.Chat;
import model.User;


@WebServlet("/ApiChatServlet")
public class ApiChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//チャットのトークを記録する
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
    	ChatDao cDao= new ChatDao();

		//チャット開始ボタンが押されたときの処理
		if(request.getParameter("data1")!=null && request.getParameter("data2")!=null) {
			// 送信されたデータの取得
			String data1 = request.getParameter("data1");
			String data2 = request.getParameter("data2");
			String data3 = request.getParameter("data3");
			String data4 = request.getParameter("data4");

			int userIdSpeaker = Integer.parseInt("data1");
	        int userIdListener = Integer.parseInt("data2");
	        String talk = request.getParameter("data3");
	        String image = request.getParameter("data4");

	        //チャットしているユーザ二者のuserIdとトークを記録する
	        Chat chat = new Chat();
	        chat.setUserIdSpeaker(userIdSpeaker);
	        chat.setUserIdListener(userIdListener);
	        chat.setTalk(talk);
	        chat.setImage(image);

	        boolean result = cDao.registChat(chat);

	      //結果を送信
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
