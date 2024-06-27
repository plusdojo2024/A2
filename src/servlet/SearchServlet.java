package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContentsDao;
import dao.MyContentsDao;
import model.Contents;
import model.User;


@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("/A2/LoginServlet");
			return;
		}

		//セッションスコープからユーザIDを取ってくる
    	User user = (User)session.getAttribute("loginUser");
    	int userId = user.getUserId();

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String genre = request.getParameter("select");
		String freeWord = request.getParameter("search");


		// 検索処理を行う
		ContentsDao cDao = new ContentsDao();
		MyContentsDao mDao = new MyContentsDao();
		List<Contents> contentsList = cDao.searchContents(freeWord,genre);

		if(contentsList.isEmpty()) {
			//一致するコンテンツがなかったら、検索結果がなかった場合のページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/noSearchResult.jsp");
			dispatcher.forward(request, response);
		} else {

			//自分のステータスを取得し、リスト内のビーンズに格納する
			for(Contents contents: contentsList) {
        		int contentsId = contents.getContentsId();
        		contents.setMyStatus(mDao.confirmContents(userId, contentsId));
        	}
			// 検索結果をリクエストスコープに格納する
			request.setAttribute("contentsList", contentsList);

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/searchResult.jsp");
			dispatcher.forward(request, response);
		}
	}
}
