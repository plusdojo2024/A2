package servlet;
import java.io.IOException;
import java.util.ArrayList;
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
import dao.ReviewDisplayDao;
import model.Contents;
import model.ReviewDisplay;
import model.User;

/**
 * Servlet implementation class ContentsDetailServlet
 */
@WebServlet("/ContentsDetailServlet")
public class ContentsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("/A2/LoginServlet");
			return;
		}
		//セッションスコープからユーザIDを取ってくる
    	User user = (User)session.getAttribute("loginUser");
    	int userId = user.getUserId();

		//コンテンツIDをパラメータとして取得する
		request.setCharacterEncoding("UTF-8");
		int contentsId = Integer.parseInt(request.getParameter("id"));
		//コンテンツDAOをnewする
		ContentsDao cDao = new ContentsDao();
		MyContentsDao mDao = new MyContentsDao();

		//コンテンツ情報を取得する
		Contents contents = cDao.contentsSelect(contentsId);

		//自分のステータスを取得し、リスト内のビーンズに格納する
		contents.setMyStatus(mDao.confirmContents(userId, contentsId));

		//コンテンツ情報をリクエストスコープに入れる
		request.setAttribute("contents", contents);

		//他ユーザのユーザIDで検索して、他ユーザの書いたレビューの一覧を取得して、リクエストスコープに入れる
        //レビューディスプレイDAOを生成
        	ReviewDisplayDao rdDao = new ReviewDisplayDao();
        //ユーザのレビューリストを取得する
        	List<ReviewDisplay> reviewList = rdDao.contentsSelect(contentsId);

        //いいね数を取得する
        	for(ReviewDisplay reviewDisplay: reviewList) {
        		int reviewId = reviewDisplay.getReviewId();
        		reviewDisplay.setGoodCount(rdDao.countGood(reviewId));
        		reviewDisplay.setMyGood(rdDao.confirmGood(userId, reviewId));
        	}

        //自分のレビューと、他ユーザのレビューに分ける
            //自分のレビューを入れるリストと、他の人のレビューを入れるリストを作る
            List<ReviewDisplay> myReviewList = new ArrayList<ReviewDisplay>();
            List<ReviewDisplay> otherReviewList = new ArrayList<ReviewDisplay>();

            //レビューを書いたユーザID＝自分のユーザIDならmyReviewListへ、それ以外はotherReviewListへ入れる
            for(ReviewDisplay temp: reviewList) {
            	if(temp.getUserIdWriter() == userId) {
            		myReviewList.add(temp);
            	} else {
            		otherReviewList.add(temp);
            	}
            }


        // リクエストスコープに格納する
        	request.setAttribute("myReviewList", myReviewList);
        	request.setAttribute("otherReviewList", otherReviewList);

		// コンテンツ詳細ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/contentsDetail.jsp");
				dispatcher.forward(request, response);


	}
}
