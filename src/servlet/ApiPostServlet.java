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

import dao.PostDao;
import dao.PostListDao;
import dao.PostReceiveDao;
import model.Post;
import model.PostList;
import model.User;

@WebServlet("/ApiPostServlet")
public class ApiPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
    	User user = (User)session.getAttribute("loginUser");
    	int userId = user.getUserId();

    	//DAOをインスタンス（実体）化
    	PostDao pDao= new PostDao();
    	PostReceiveDao prDao= new PostReceiveDao();
    	PostListDao plDao= new PostListDao();

		//追加ボタンが押されたときの処理
		if(request.getParameter("data1")!=null) {
			// 送信されたデータの取得
			String data1 = request.getParameter("data1");
			String data2 = request.getParameter("data2");
			String data3 = request.getParameter("data3");

			int status = Integer.parseInt(data1);
			String title = data2;
			String recommend = data3;

			//入力されたデータを表示
			System.out.println(data1);
			System.out.println(data2);
			System.out.println(data3);

			//投函時の処理
			if(status==0) {
					//beansを作る
					Post postBeans = new Post();
					postBeans.setTitle(title);
					postBeans.setRecommend(recommend);
					postBeans.setUserId(userId);
					//送信されたデータをpostテーブルに追加
					boolean result = pDao.postInsert(postBeans);

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

				} //受け取り時の処理
					else if(status==1){
						//postDAOからオススメを全て取ってくる
						List<Post> postList = pDao.selectAllPost();
						Post postBeans = new Post();
						Map<String, String> map = new HashMap<>();

						int postId;
						//最大を調べる
						int size = postList.size();
//						while(true){
							//オススメの中から一件ランダムで選ぶ
							//ランダムに整数を生成
							Random rand = new Random();
							int num = rand.nextInt(size);

							//その整数のインデックスの要素を取ってくる
							postBeans = postList.get(num);
							postId = postBeans.getPostId();	//要素のポストIDを取得
							String rTitle = postBeans.getTitle();	//titleを取得

							String rRecommend = postBeans.getRecommend();	//recommendを取得

							System.out.println(rTitle);

				        	map.put("title", rTitle);
				        	map.put("recommend", rRecommend);

							//既に受け取っているかのチェック
							//受け取ったことがあれば再度処理を繰り返す、受け取っていなければbreak
//							if(!prDao.confirmRecommendHistory(postId)) {
//								break;
//							}
//						}

						//受け取ったおすすめをpost_receuveテーブルに追加
						boolean result = prDao.postReceiveInsert(userId,postId);

						//成功したらJSPの方におすすめを渡す
						if(result) {
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
						else {

						}
				}//一覧時の処理
					else if(status==2) {
							List<PostList> postList = plDao.postSelect(userId);
							List<PostList> receiveList = plDao.postReceiveSelect(userId);

			        //自分の投函に気になるが付いているかの情報を取得する
		        	for(PostList pl: postList) {
		        		int postId = pl.getPostId();
		        		int interest = prDao.checkInterest(postId);
		        		pl.setInterest(interest);
		        	}
			        //自分が気になるを付けているかの情報を取得する
		        	for(PostList pl: receiveList) {
		        		int postId = pl.getPostId();
		        		int myInterest = prDao.checkMyInterest(userId, postId);
		        		pl.setMyInterest(myInterest);
		        	}

		        	// 2つのArrayListをMapに格納
		        	Map<String, List<PostList>> map = new HashMap<>();
		        	map.put("postList", postList);
		            map.put("receiveList", receiveList);

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
