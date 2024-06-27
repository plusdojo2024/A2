package servlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.JsonUserBeans;


@WebServlet("/AjaxSampleServlet")
public class AjaxSampleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajaxInOut.jspへフォワードするだけ
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/ajaxInOut.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		// 送信されたデータの取得
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		String data3 = request.getParameter("data3");

		//ArrayListをインスタンス化
		ArrayList<JsonUserBeans> list = new ArrayList<>();

		//適当な値を突っ込む
		for(int i=0;i<5;i++) {
			JsonUserBeans jub = new JsonUserBeans();
			jub.setId(data1);
			jub.setName(data2);
			jub.setData(data3);
			list.add(jub);
		}


		ObjectMapper mapper = new ObjectMapper();
		try {
            //JavaオブジェクトからJSONに変換
            String testJson = mapper.writeValueAsString(list);
            //JSONの出力
            response.getWriter().write(testJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

//		//文字コードの設定（めんどいのでコピペでOK）
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");
//
//		//JSPに返却する値を作成する。値はoutの中に格納する
//		PrintWriter out = response.getWriter();
//		//outの中に持ってきたデータを連結したものを入れる
//		//勝手にJSPに渡り、dataという名前で使用することができる
//		out.print(data1+","+data2+","+data3);
//
//        return;

	}

}
