package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GoodDao;
import dao.ReviewDisplayDao;
import dao.TimelineDao;
import model.ReviewDisplay;
import model.User;

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

		//ログインしているユーザIDを取得する
		User loginUser = (User)session.getAttribute("loginUser");
		int userId = loginUser.getUserId();

		//1週間以内のお気に入りユーザのレビューを取得
		TimelineDao tDao = new TimelineDao();
		//レビューディスプレイDAOを生成
    	ReviewDisplayDao rdDao = new ReviewDisplayDao();
		List<ReviewDisplay> timeline = tDao.userSelect(userId);
		//いいね数を取得する
    	for(ReviewDisplay reviewDisplay: reviewList) {
    		int reviewId = reviewDisplay.getReviewId();
    		reviewDisplay.setGoodCount(rdDao.countGood(reviewId));
    		reviewDisplay.setMyGood(rdDao.confirmGood(userId, reviewId));
    	}


		//全ユーザのいいね数の合計を取得し、上位５名のユーザ名とアイコンを取得する
		GoodDao gDao = new GoodDao();
		List<User> ranking = gDao.rankingSelect();

		//リクエストスコープにセット
		request.setAttribute("timeline", timeline);
		request.setAttribute("ranking", ranking);

		//マイページのフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/A2/jsp/home.jsp");
		dispatcher.forward(request, response);
	}

}
