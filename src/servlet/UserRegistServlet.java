package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

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
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String user_name = request.getParameter("name");
		String icon = request.getParameter("icon");
		String introduction = request.getParameter("introduction");
		String open_close = request.getParameter("first");

		// open_closeは文字列として取得されるため、必要に応じて変換する
	    int openCloseValue = Integer.parseInt(open_close);

	    //Userオブジェクトを作成し、セットする
	    User user = new User();
	    user.setMail(mail);
	    user.setPass(pass);
	    user.setUser_name(user_name);
	    user.setIcon(icon);
	    user.setIntroduction(introduction);
	    user.setOpen_close(openCloseValue);

	    //登録処理を行う
	    UserDao uDao = new UserDao();
	    //登録が成功したかどうかを判断する
	    boolean success = uDao.insert(user);

	    if(success) {
	    	response.sendRedirect(request.getContextPath() + "/LoginServlet");
	    } else {
	    	request.setAttribute("errorMessage", "ユーザの登録に失敗しました。　再度お試しください。");
	    	// 結果ページにフォワードする
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegist.jsp");
	    	dispatcher.forward(request, response);
	    }



	}
}
