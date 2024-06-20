package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

//URLマッピング
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");

		// ログイン処理を行う
		UserDao uDao = new UserDao();	//UserDaoのインスタンス生成
		User loginUser = uDao.login(mail, pass);	//UserDaoのloginメソッドを使用

		if (loginUser !=null) {
			// ログイン成功の場合、セッションスコープにloginUserインスタンスを格納
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);

			// ホームサーブレットにリダイレクトする
			response.sendRedirect("/A2/HomeServlet");
		}
		else {
			// ログイン失敗の場合、
			String errorMessage = "ログインに失敗しました。";
	    	request.setAttribute("errorMessage",errorMessage );
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
	    	dispatcher.forward(request, response);
		}
	}
}

