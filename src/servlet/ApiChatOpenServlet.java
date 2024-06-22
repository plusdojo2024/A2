package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.ChatDao;
import dao.UserDao;
import model.Chat;
import model.User;

@WebServlet("/ApiChatOpenServlet")
public class ApiChatOpenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//コンテンツIdまたはユーザIdを受け取り、ランダムチャットまはた指定チャットの相手のユーザ情報を返す
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//決まりの文章、とりあえず書くと覚えておこう
				request.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.setHeader("Cache-Control", "nocache");
				//文字コードの指定（これがないとJSPで文字化けする）
				response.setContentType("text/html;charser=UTF-8");


				// もしもログインしていなかったらログインサーブレットにリダイレクトする
		    	HttpSession session = request.getSession();
		    	if (session.getAttribute("loginUser") == null) {
		    		response.sendRedirect("/A2/LoginServlet");
		    		return;
		    	}

		    	//セッションスコープからユーザーIDを取ってくる
		    	User user = (User)session.getAttribute("user");
		    	int userId = user.getUserId();

		    	//DAOをインスタンス（実体）化
		    	ChatDao cDao= new ChatDao();
		    	UserDao uDao = new UserDao();

				//チャット開始ボタンが押されたときの処理
				if(request.getParameter("data1")!=null && request.getParameter("data2")!=null) {
					// 送信されたデータの取得
					String data1 = request.getParameter("data1");
					String data2 = request.getParameter("data2");

					String status = data1; //ランダムチャットか指定チャットかを区別する
					int id = Integer.parseInt(data2); //ランダムチャットの場合はコンテンツId、指定チャットの場合は相手のuserIdが入る

					//ランダムチャットの場合の処理
					if(status.equals ("ランダム")) {
						//該当コンテンツをコレクションに登録している全ユーザを取得する
						List<User> userList = cDao.selectRandomChat(id);
						//その中から1名のユーザをランダムで選ぶ
							//リストの要素の個数を調べる
							int size = userList.size();
							//ランダムに整数を生成
							Random rand = new Random();
							int num = rand.nextInt(size);

							//その整数のインデックスの要素を取得
							User otherUser = userList.get(num);

						//そのユーザとのトーク履歴を取得
							List<Chat> talkHistory = cDao.selectChatHistory(userId, otherUser.getUserId());

						//ランダムで選んだユーザの情報と、今までのトーク履歴を送信
							//ユーザ情報と、トーク履歴をMapに格納。
								Map<String, Object> map = new HashMap<>();
					        	map.put("otherUser", otherUser);
					            map.put("talkHistory", talkHistory);

							//Jackson機能のmapperをインスタンス（実体）化
							ObjectMapper mapper = new ObjectMapper();
							try {
						        //JavaオブジェクトからJSONに変換
						        String resultJson = mapper.writeValueAsString(map);
						        System.out.println(resultJson);
						        //JSONの出力
						        response.setContentType("application/json; charset=UTF-8");
						        response.getWriter().write(resultJson);
						    } catch (JsonProcessingException e) {
						        e.printStackTrace();
						    }

					} else if(status.equals ("指定")) {
						//指定されたユーザの情報を取得
						User otherUser = uDao.userSelect(id);

						//そのユーザとのトーク履歴を取得
						List<Chat> talkHistory = cDao.selectChatHistory(userId, id);

						//ユーザの情報と、今までのトーク履歴を送信
							//ユーザ情報と、トーク履歴をMapに格納。
								Map<String, Object> map = new HashMap<>();
					        	map.put("otherUser", otherUser);
					            map.put("talkHistory", talkHistory);

							//Jackson機能のmapperをインスタンス（実体）化
							ObjectMapper mapper = new ObjectMapper();
							try {
						        //JavaオブジェクトからJSONに変換
						        String resultJson = mapper.writeValueAsString(map);
						        System.out.println(resultJson);
						        //JSONの出力
						        response.setContentType("application/json; charset=UTF-8");
						        response.getWriter().write(resultJson);
						    } catch (JsonProcessingException e) {
						        e.printStackTrace();
						    }
					}
				}
	}

}
