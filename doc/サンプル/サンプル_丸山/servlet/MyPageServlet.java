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
import model.LoginUser;
import model.Result;

@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyPageServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// もしもログインしていなかったらログインサーブレットにリダイレクトする
    	HttpSession session = request.getSession();
    	if (session.getAttribute("LoginUser") == null) {
    		response.sendRedirect("/myBC/LoginServlet");
    		return;
    	}

    	//セッションスコープからユーザーIDを取ってくる
    	LoginUser loginUser = (LoginUser)session.getAttribute("LoginUser");
    	String id = loginUser.getUserId();

    	//パスワードを調べてスコープに入れる
    	IdpwDAO iDao = new IdpwDAO();
    	String pw = iDao.selectPw(id);

    	session.setAttribute("pw", pw);

    	// マイページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/myPage.jsp");
		dispatcher.forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("LoginUser") == null) {
			response.sendRedirect("/myBC/LoginServlet");
			return;
		}

		//セッションスコープからユーザーIDを取ってくる
		LoginUser loginUser = (LoginUser)session.getAttribute("LoginUser");
		String id = loginUser.getUserId();

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String newId = request.getParameter("id");
		String newPw = request.getParameter("pw");
		String newUserName = request.getParameter("userName");

		// 更新または削除を行う
		IdpwDAO iDao = new IdpwDAO();

		if (request.getParameter("submit").equals("UPDATE")) {
			if (iDao.UserUpdate(newId, newPw, newUserName, id)) {	// 更新成功
				request.setAttribute("result",
				new Result("成功", "ユーザー情報を変更しました。お手数ですが、再度ログインを行ってください。", "/myBC/LogoutServlet"));
			}
			else {												// 更新失敗
				request.setAttribute("result",
				new Result("失敗", "ユーザー情報を変更できませんでした。", "/myBC/HomeServlet"));
			}
		}
		else if (request.getParameter("submit").equals("DELETE") || request.getParameter("submit").equals("YES")){
			if (iDao.UserDelete(id)) {	// 削除成功
				request.setAttribute("result",
				new Result("成功", "ユーザーを削除しました。", "/myBC/LogoutServlet"));
			}
			else {						// 削除失敗
				request.setAttribute("result",
				new Result("失敗", "ユーザーを削除できませんでした。", "/myBC/HomeServlet"));
			}
		} else {
			request.setAttribute("result",
					new Result("失敗", "処理ができませんでした。", "/myBC/HomeServlet"));
		}

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}
}
