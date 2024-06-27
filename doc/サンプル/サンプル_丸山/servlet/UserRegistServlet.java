package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdpwDAO;
import model.Idpw;
import model.Result;

@WebServlet("/UserRegistServlet")//URLマッピング
public class UserRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ユーザー登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegist.jsp");
		dispatcher.forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String userName = request.getParameter("userName");


				// ユーザー登録処理を行う
				IdpwDAO iDao = new IdpwDAO();
				if (iDao.userRegist(new Idpw(id, pw), userName)) {	// 登録成功
					request.setAttribute("result",
					new Result("成功", "ユーザーを新規登録しました。", "/myBC/LoginServlet"));
				}
				else {												// 登録失敗
					request.setAttribute("result",
					new Result("失敗", "ユーザーを新規登録できませんでした。", "/myBC/LoginServlet"));
				}

				// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
				dispatcher.forward(request, response);

	}
}
