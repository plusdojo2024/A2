package servlet;

import java.io.IOException;
import java.util.ArrayList;
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
    	for(ReviewDisplay reviewDisplay: timeline) {
    		int reviewId = reviewDisplay.getReviewId();
    		reviewDisplay.setGoodCount(rdDao.countGood(reviewId));
    		reviewDisplay.setMyGood(rdDao.confirmGood(userId, reviewId));
    	}


		//全ユーザのいいね数の合計を取得し、上位５名のユーザ名とアイコンを取得する
    	//全ユーザのいいね数順のランキングを取得する
		GoodDao gDao = new GoodDao();
		List<User> ranking = gDao.rankingSelect();

		//いいね数の多い順に並んだリストのうち、上位5名のみを選出したリストを作る
		List<User> rankingTopFive = new ArrayList<User>();

		for(int i = 0; i < 5; i++) {
			rankingTopFive.add(ranking.get(i));
		}

		//リクエストスコープにセット
		request.setAttribute("timeline", timeline);
		request.setAttribute("rankingTopFive", rankingTopFive);

		//マイページのフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/A2/jsp/home.jsp");
		dispatcher.forward(request, response);
	}

}
