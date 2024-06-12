package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeeBeans;

@WebServlet("/SearchSampleSarvlet")
public class SearchSampleSarvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//適当なデータを作って、リクエストスコープに格納する
		ArrayList<EmployeeBeans> list = new ArrayList<>();
		list.add(new EmployeeBeans("0001","山田",25,"情報処理","こんにちは","男","人事部"));
		list.add(new EmployeeBeans("0002","田中",22,"応用情報処理","どもども","男","総務部"));
		list.add(new EmployeeBeans("0003","白石",21,"DBスペシャリスト","いえい","女","ITソリューション部"));
		list.add(new EmployeeBeans("0004","竹中",33,"なし","頑張ります","男","経理部"));
		list.add(new EmployeeBeans("0005","稲葉",56,"簿記１級","計算します！","男","経理部"));
		list.add(new EmployeeBeans("0006","波多",22,"基本情報処理","ファイト！","女","ITソリューション部"));
		list.add(new EmployeeBeans("0007","松本",30,"oracleシルバー","んふ","女","ITソリューション部"));
		list.add(new EmployeeBeans("0008","田代",48,"SJCP","ででで","男","プロジェクト管理部"));
		list.add(new EmployeeBeans("0009","石貝",22,"普通自動車免許","ふぉ～！","女","なんとか部"));
		list.add(new EmployeeBeans("0010","大槻",25,"情報処理","こんにちは","男","人事部"));
		list.add(new EmployeeBeans("0011","木本",22,"応用情報処理","どもども","男","総務部"));
		list.add(new EmployeeBeans("0012","比嘉",21,"DBスペシャリスト","いえい","女","ITソリューション部"));
		list.add(new EmployeeBeans("0013","本田",33,"なし","頑張ります","男","経理部"));
		list.add(new EmployeeBeans("0014","新海",56,"簿記１級","計算します！","男","経理部"));
		list.add(new EmployeeBeans("0015","山下",22,"基本情報処理","ファイト！","女","ITソリューション部"));
		list.add(new EmployeeBeans("0016","五十嵐",30,"oracleシルバー","んふ","女","ITソリューション部"));
		list.add(new EmployeeBeans("0017","五百蔵",48,"SJCP","ででで","男","プロジェクト管理部"));
		list.add(new EmployeeBeans("0018","須田",22,"普通自動車免許","ふぉ～！","女","なんとか部"));
		request.setAttribute("list", list);

		//SearchSample.jspに遷移させる
		String path="/WEB-INF/jsp/SearchSample.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
