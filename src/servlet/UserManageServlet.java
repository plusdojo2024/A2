package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.UserDao;
import model.User;

@MultipartConfig(location = "C:\\pleiades\\workspace\\A2\\WebContent\\img") // アップロードファイルの一時的な保存先
@WebServlet("/UserManageServlet")

public class UserManageServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("/A2/LoginServlet");
			return;
		}

		//セッションスコープからユーザIDを取ってくる
		User user = (User)session.getAttribute("loginUser");

		//マイページのフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userManage.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("/A2/LoginServlet");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String userName = request.getParameter("name");
		Part part = request.getPart("icon"); // getPartで取得
		String introduction = request.getParameter("introduction");
		String openClose = request.getParameter("first");

		// open_closeは文字列として取得されるため、必要に応じて変換する
	    int openCloseValue = Integer.parseInt(openClose);
	    String icon = this.getFileName(part);
	    part.write(icon);

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
	    //メールアドレスの確認処理
	    boolean mail_id = uDao.checkMail(mail);
	    //boolean success = uDao.userRegist(user);


	    if(mail_id) {
	    	// すでに登録されているメールアドレスの場合、登録失敗としてフォワードする
	    	String errorMessage = "このメールアドレスはすでに使用されています。";
            request.setAttribute("errorMessage",errorMessage );
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userManage.jsp");
            dispatcher.forward(request, response);
	    } else {
	    	//更新または削除を行う
	    	if(request.getParameter("update1").equals("はい")) {
	    		boolean success = uDao.update(user);
	    		if(success) {
	    			response.sendRedirect(request.getContextPath() + "/A2/HomeServlet");
	    		} else {
	    				String errorMessage = "登録に失敗しました。";
	    				request.setAttribute("errorMessage",errorMessage );
	    				// ユーザ管理ページにフォワードする
	    				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userManage.jsp");
	    				dispatcher.forward(request, response);
	    			}
	    		}
	    		else if(request.getParameter("delete1").equals("削除") || request.getParameter("delete1").equals("はい")) {
	    			int userId = user.getUserId();
	    			boolean success = uDao.userDelete(userId);
	    			if(success) {
	    				response.sendRedirect(request.getContextPath() + "/A2/LoginServlet");
	    			} else {
	    				String errorMessage = "登録に失敗しました。";
	    				request.setAttribute("errorMessage",errorMessage );
	    				// ユーザ管理ページにフォワードする
	    				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userManage.jsp");
	    				dispatcher.forward(request, response);
	    			}
	    		}
	    	}
		}
		//ファイルの名前を取得してくる
		private String getFileName(Part part) {
			String name = null;
			for (String dispotion : part.getHeader("Content-Disposition").split(";")) {
				if (dispotion.trim().startsWith("filename")) {
					name = dispotion.substring(dispotion.indexOf("=") + 1).replace("\"", "").trim();
					name = name.substring(name.lastIndexOf("\\") + 1);
					break;
				}
			}		// TODO 自動生成されたメソッド・スタブ
					return name;
		}
}
