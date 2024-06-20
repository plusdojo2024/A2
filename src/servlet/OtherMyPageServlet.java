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

import dao.FavoriteUserDao;
import dao.MyContentsDao;
import dao.ReviewDao;
import dao.ReviewDisplayDao;
import dao.UserDao;
import model.MyContents;
import model.ReviewDisplay;
import model.User;

@WebServlet("/OtherMyPageServlet")
public class OtherMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// もしもログインしていなかったらログインサーブレットにリダイレクトする
    	HttpSession session = request.getSession();
    	if (session.getAttribute("loginUser") == null) {
    		response.sendRedirect("/A2/LoginServlet");
    		return;
    	}

    	//セッションスコープからユーザーIDを取ってくる
    	User user = (User)session.getAttribute("user");
    	int userId = user.getUserId();

    	// リクエストパラメータを取得する
    	request.setCharacterEncoding("UTF-8");
		int otherUserId = Integer.parseInt(request.getParameter("id"));

    	//他ユーザのインスタンスを作成する
		UserDao uDao = new UserDao();
		User otherUser = uDao.userSelect(otherUserId);

		//DAOを生成
		ReviewDao rDao = new ReviewDao();
		FavoriteUserDao fDao = new FavoriteUserDao();

    	//実績を取得する
    	//投稿したレビューの総数を取得する
    		int reviewCount = rDao.countTotalReview(otherUserId);
    	// UserのBeansに入れる
    		otherUser.setReviewCount(reviewCount);

    	//他ユーザのインスタンスをリクエストスコープに入れる
    		request.setAttribute("otherUser", otherUser);

    	//そのユーザがお気に入りユーザに登録済みかどうかを判断する
    		//int型の戻り値をInteger型に変換し、リクエストスコープに入れる(int型はスコープに入らないため)
    		Integer favorite = Integer.valueOf(fDao.confirmFavorite(userId, otherUserId));
    		request.setAttribute("favorite", favorite);

        //コレクション、ウィッシュリストの一覧を取得してリクエストスコープに入れる
            //マイコレクションDAOを生成
            	MyContentsDao mDao = new MyContentsDao();
            //ユーザのコレクションを取得する
            	List<MyContents> collection = mDao.selectCollection(otherUserId);
            // リクエストスコープに格納する
            	request.setAttribute("collection", collection);

        //他ユーザのユーザIDで検索して、他ユーザの書いたレビューの一覧を取得して、リクエストスコープに入れる
            //レビューディスプレイDAOを生成
            	ReviewDisplayDao rdDao = new ReviewDisplayDao();
            //ユーザのレビューリストを取得する
            	List<ReviewDisplay> reviewList = rdDao.userSelect(otherUserId);

            //いいね数を取得する
            	for(ReviewDisplay reviewDisplay: reviewList) {
            		int reviewId = reviewDisplay.getReviewId();
            		reviewDisplay.setGoodCount(rdDao.countGood(reviewId));
            		reviewDisplay.setMyGood(rdDao.confirmGood(userId, reviewId));
            	}

            // リクエストスコープに格納する
            	request.setAttribute("reviewList", reviewList);

    	// マイページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/otherMyPage.jsp");
		dispatcher.forward(request, response);
    }
}
