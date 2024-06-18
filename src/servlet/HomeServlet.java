package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDisplayDao;
import dao.UserDao;
import model.FavoriteUser;
import model.Review;
import model.ReviewDisplay;
import model.User;

import javax.servlet.annotation.WebServlet;

@WebServlet("/HomeServlet")

public class HomeServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("/A2/LoginServlet");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("");

		//セッションスコープからユーザIDを取ってくる
		Review review = (Review)session.getAttribute("Review");
		int user_id = review.getUserId();

		//実績を取得する
    	//DAOを生成
		Review rDao = new Review();
		//投稿したレビューの総数を取得する
		int reviewCount = rDao.reviewCount(otherUserId);

		//お気に入りユーザ検索
		FavoriteUser fDao = new FavoriteUser();
		boolean favoriteuser = fDao.



		//マイページのフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/A2/jsp/home.jsp");
		dispatcher.forward(request, response);
	}

}
