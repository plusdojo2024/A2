package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/UserRegistServlet")

public class UserRegistServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 新規ユーザ登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegist.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String user_name = request.getParameter("name");
		String icon = request.getParameter("icon");
		String my_introduction = request.getParameter("my_introduction");
		String open_close = request.getParameter("first");

		// open_closeは文字列として取得されるため、必要に応じて変換する
	    int openCloseValue = Integer.parseInt(open_close);

	    //登録処理を行う
	    UserDao uDao = new UserDao();
	    //登録が成功したかどうかを判断する
	    boolean success = uDao.insert(new User());

	    if(success) {
	    	//登録成功の場合
	    	request.setAttribute();
	    } else {
	    	request.setAttribute("result", uDao);
	    }

	    // 結果ページにフォワードする
	 	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
	 	dispatcher.forward(request, response);

	}
}
