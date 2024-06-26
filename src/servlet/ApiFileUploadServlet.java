package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@MultipartConfig(location = "C:\\pleiades\\workspace\\socketSample\\WebContent\\img") // アップロードファイルの一時的な保存先
@WebServlet("/ApiFileUploadServlet")
public class ApiFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//決まりの文章、とりあえず書くと覚えておこう
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		//文字コードの指定（これがないとJSPで文字化けする）
		response.setContentType("text/html;charser=UTF-8");

		if(request.getPart("img")!=null) {
			// 送信されたデータの取得
				Part part = request.getPart("img"); // getPartで取得

				String img = null;

			    img = this.getFileName(part);
			    System.out.println(img+"：アイコンだよ");
			    if(!img.equals("")) {
				    part.write(img);
			    }

			String image = this.getFileName(part);
			// サーバの指定のファイルパスへファイルを保存
	        //場所はクラス名↑の上に指定してある
			part.write(image);
			boolean result = true;

			//結果を送信
			//Jackson機能のmapperをインスタンス（実体）化
			ObjectMapper mapper = new ObjectMapper();
			try {
		        //JavaオブジェクトからJSONに変換
		        String resultJson = mapper.writeValueAsString(result);
		        System.out.println(resultJson);
		        //JSONの出力
		        response.setContentType("application/json; charset=UTF-8");
		        response.getWriter().write(resultJson);
		    } catch (JsonProcessingException e) {
		        e.printStackTrace();
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
