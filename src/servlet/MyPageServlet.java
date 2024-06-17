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

import dao.ChatDao;
import dao.FavoriteUserDao;
import dao.MyContentsDao;
import dao.ReviewDisplayDao;
import dao.ReviewDao;
import dao.GoodDao;
import model.Chat;
import model.FavoriteUser;
import model.MyContents;
import model.ReviewDisplay;
import model.User;

@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// もしもログインしていなかったらログインサーブレットにリダイレクトする
    	HttpSession session = request.getSession();
    	if (session.getAttribute("User") == null) {
    		response.sendRedirect("/A2/LoginServlet");
    		return;
    	}

    	//セッションスコープからユーザーIDを取ってくる
    	User user = (User)session.getAttribute("user");
    	int userId = user.getUserId();

    	//実績を取得してリクエストスコープに入れる
    	//DAOを生成
    		ReviewDao rDao = new ReviewDao();
    		GoodDao gDao = new GoodDao();
    	//投稿したレビューの総数を取得する
    		int reviewCount = rDao.reviewCount();
    	//レビューにもらったいいねの総数を取得する
    		int allGoodCount = gDao.allGoodCount();
    	// リクエストスコープに格納する
        	request.setAttribute("", );

        //コレクション、ウィッシュリストの一覧を取得してリクエストスコープに入れる
            //マイコレクションDAOを生成
            	MyContentsDao mDao = new MyContentsDao();
            //ユーザのコレクションとウィッシュリストを取得する
            	List<MyContents> collection = mDao.selectCollection(user_id);
            	List<MyContents> wishList = mDao.selectWishList(user_id);
            // リクエストスコープに格納する
            	request.setAttribute("collection", collection);
            	request.setAttribute("wishList", wishList);

        //自分のユーザIDで検索して、自分の書いたレビューの一覧を取得して、リクエストスコープに入れる
            //レビューディスプレイDAOを生成
            	ReviewDisplayDao rdDao = new ReviewDisplayDao();
            //ユーザのレビューリストを取得する
            	List<ReviewDisplay> reviewList = rdDao.userSelect(user_id);

            //いいね数を取得する
            	for(ReviewDisplay reviewDisplay: reviewList) {
            		int reviewDisplay.get()
            	}

            // リクエストスコープに格納する
            	request.setAttribute("reviewList", reviewList);


        //お気に入りユーザの一覧を取得して、リクエストスコープに入れる
            //お気に入りユーザDAOを生成
            	FavoriteUserDao fDao = new FavoriteUserDao();
            //お気に入りユーザのリストを取得する
            	List<FavoriteUser> favoriteUserList = fDao.select(user_id);
            // リクエストスコープに格納する
            	request.setAttribute("favoriteUserList", favoriteUserList);

        //チャット履歴の一覧を取得して、リクエストスコープに入れる
           //お気に入りユーザDAOを生成
            	ChatDao cDao = new ChatDao();
           //お気に入りユーザのリストを取得する
            	List<Chat> chatList = fDao.selectHistory(user_id);
            //リクエストスコープに格納する
        		request.setAttribute("chatList", chatList);


    	// マイページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/myPage.jsp");
		dispatcher.forward(request, response);
    }
}

