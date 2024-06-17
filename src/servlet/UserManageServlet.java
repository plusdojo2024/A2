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

@WebServlet("/UserManageServlet")

public class UserManageServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("mail") == null) {
			response.sendRedirect("/A2/LoginServlet");
			return;
		}

		//セッションスコープからユーザIDを取ってくる
		User user = (User)session.getAttribute("User");
		int user_id = user.getUserId();

		//パスワードを調べてスコープに入れる
		UserDao uDao = new UserDao();
		String pass = uDao.selectPass(pass);

		session.setAttribute("pass", pass);

		//マイページのフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/A2/jsp/home.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("mail") == null) {
		response.sendRedirect("/A2/LoginServlet");
		return;
		}

		//セッションスコープからユーザIDを取ってくる
		User userId = (User)session.getAttribute("User");
		int user_id = userId.getUserId();

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String userName = request.getParameter("name");
		String icon = request.getParameter("icon");
		String introduction = request.getParameter("introduction");
		String openClose = request.getParameter("first");

		// open_closeは文字列として取得されるため、必要に応じて変換する
	    int openCloseValue = Integer.parseInt(openClose);

	    //Userオブジェクトを作成し、セットする
	    User user = new User();
	    user.setMail(mail);
	    user.setPass(pass);
	    user.setUserName(userName);
	    user.setIcon(icon);
	    user.setIntroduction(introduction);
	    user.setOpenClose(openCloseValue);

	    //登録処理を行う
	    UserDao uDao = new UserDao();
	    boolean success = uDao.insert(user);

	    //更新または削除を行う
	    if(request.getParameter("update").equals("更新")) {
	    	if(success) {
	    		response.sendRedirect(request.getContextPath() + "/UserManageServlet");
	    	} else {
	    		// ユーザ管理ページにフォワードする
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserManage.jsp");
		    	dispatcher.forward(request, response);
	    	}
	    }
	    else if(request.getParameter("delete1").equals("削除") || request.getParameter("delete1").equals("Yes")) {
	    	if(success) {
	    		response.sendRedirect(request.getContextPath() + "/LoginServlet");
	    	} else {
	    		// ユーザ管理ページにフォワードする
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserManage.jsp");
		    	dispatcher.forward(request, response);
	    	}
	    }
	}
}
