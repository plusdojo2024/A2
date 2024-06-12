<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Ajaxのサンプル</title>
</head>
<body>
	DATA1：<input type="text" name="test_data1" id="test_data1" value="${param.test_data1}"><br>
	DATA2：<input type="text" name="test_data2" id="test_data2" value="${param.test_data2}"><br>
	DATA3：<input type="text" name="test_data3" id="test_data3" value="${param.test_data3}">　
	<input type="button" value="非同期送信" onclick="goAjax()">
	<div id="test"></div>


	<script>
		function goAjax(){
			alert("functionはいったよ！");
			//入力値を取得してくる
			let testData1 = document.getElementById('test_data1').value;
			let testData2 = document.getElementById('test_data2').value;
			let testData3 = document.getElementById('test_data3').value;

			//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
			let postData = {data1:testData1,data2:testData2,data3:testData3}


			//非同期通信始めるよ
			$.ajaxSetup({scriptCharset:'utf-8'});
			$.ajax({
				//どのサーブレットに送るか
				//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
				url: '/sampleProgram/AjaxSampleServlet',
				//どのメソッドを使用するか
				type:"POST",
				//受け取るデータのタイプ
				dataType:"json",
				//何をサーブレットに飛ばすか（変数を記述）
				data: postData,
				//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
				processDate:false,
				timeStamp: new Date().getTime()
			   //非同期通信が成功したときの処理
			}).done(function(data) {
				alert("成功1");
				// 今回は上の<div id="test"></div>の中に返ってきた文字列を入れる
				document.getElementById("test").innerText=data[0].name;
			  })
			   //非同期通信が失敗したときの処理
			  .fail(function() {
				//失敗とアラートを出す
				alert("失敗！");
			  });
		}
	</script>
</body>
</html>