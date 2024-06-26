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

import dao.ContentsDao;
import model.Contents;
import model.User;

@WebServlet("/ApiContentsRegistServlet")
public class ApiContentsRegistServlet extends HttpServlet {
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
    	ContentsDao cDao = new ContentsDao();

    	//登録ボタンが押されたときの処理
    	if(request.getParameter("data1")!=null) {
    		// 送信されたデータの取得
    		String data1 = request.getParameter("data1");
    		String data2 = request.getParameter("data2");
    		String data3 = request.getParameter("data3");
    		String data4 = request.getParameter("data4");
    		String data5 = request.getParameter("data5");
    		String data6 = request.getParameter("data6");

    		String title = data1;
    		String ruby = data2;
    		String image = data3;
    		String genre = data4;
    		String year = data5;
    		String creater = data6;


    		//入力されたデータを表示
    		System.out.println(data1);
    		System.out.println(data2);
    		System.out.println(data3);
    		System.out.println(data4);
    		System.out.println(data5);
    		System.out.println(data6);

    		//登録時の処理
    		//beansを作る
    		Contents contentsBeans = new Contents();
    		contentsBeans.setTitle(title);
    		contentsBeans.setRuby(ruby);
   			contentsBeans.setGenre(genre);
   			contentsBeans.setCreator(creater);
    		contentsBeans.setYear(year);
    		contentsBeans.setImage(image);


    		//送信されたデータをcontentsテーブルに追加
    		boolean result = cDao.contentsRegist(contentsBeans);

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


