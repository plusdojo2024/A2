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

import dao.GoodDao;
import dao.ReviewDisplayDao;
import dao.TimelineDao;
import model.ReviewDisplay;
import model.User;

@WebServlet("/HomeServlet")

public class HomeServlet extends HttpServlet{
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
		int goodCount=0;
		int myGood=0;
		int reviewId=0;
    	for(ReviewDisplay reviewDisplay: timeline) {
    		reviewId = reviewDisplay.getReviewId();
    		goodCount = rdDao.countGood(reviewId);
    		myGood = rdDao.confirmGood(userId, reviewId);
    		reviewDisplay.setGoodCount(goodCount);
    		reviewDisplay.setMyGood(myGood);
    	}

		//全ユーザのいいね数の合計を取得し、上位５名のユーザ名とアイコンを取得する
    	//全ユーザのいいね数順のランキングを取得する
		GoodDao gDao = new GoodDao();
		List<User> ranking = gDao.rankingSelect();

		//いいね数の多い順に並んだリストのうち、上位5名のみを選出したリストを作る

		User r1 = new User();
		User r2 = new User();
		User r3 = new User();
		User r4 = new User();
		User r5 = new User();


		if(ranking != null) {

			 r1 = ranking.get(0);
			 r2 = ranking.get(1);
			 r3 = ranking.get(2);
			 r4 = ranking.get(3);
			 r5 = ranking.get(4);

		}

		//リクエストスコープにセット
		request.setAttribute("timeline", timeline);
		// request.setAttribute("rankingTopFive", rankingTopFive);
		request.setAttribute("r1", r1);
		request.setAttribute("r2", r2);
		request.setAttribute("r3", r3);
		request.setAttribute("r4", r4);
		request.setAttribute("r5", r5);

		//マイページのフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
		dispatcher.forward(request, response);
	}

}
