package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IdpwDAO;
import model.Idpw;
import model.LoginUser;
import model.Result;

@WebServlet("/LoginServlet")//URLマッピング
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// ログイン処理を行う
		IdpwDAO iDao = new IdpwDAO();
		LoginUser loginUser = iDao.login(new Idpw(id, pw));//SQLで名前を追加し、Beansでユーザーの情報ごと持ってきて名前を表示させるようにする
		if (loginUser != null) {	// ログイン成功
			// セッションスコープにLoginUserインスタンスを格納する
			HttpSession session = request.getSession();
			session.setAttribute("LoginUser", loginUser);

			// メニューサーブレットにリダイレクトする
			response.sendRedirect("/myBC/HomeServlet");
		}
		else {									// ログイン失敗
			// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
			request.setAttribute("result",
			new Result("ログイン失敗！", "IDまたはPWに間違いがあります。", "/myBC/LoginServlet"));

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
			dispatcher.forward(request, response);
		}
	}
}
