<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQueryの読み込み -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<input type="hidden" name="good" id="good" value="1"><br> <!-- いいね削除ボタンの場合は、このvalueが0になる -->
	<input type="hidden" name="reviewId" id="reviewId" value="${e.reviewId}">　
	<input type="button" id="goodRegist" value="いいね" onclick="goAjax()" ><br>
	いいねの数：<span id="counter">${e.goodCount}</span>

	<script>
	function goAjax(){

		//値を取得してくる
		let good = document.getElementById('good').value;
		let reviewId = document.getElementById('reviewId').value;
		let goodCount = document.getElementById('counter').value;

		//文字列を数値データに変換する
		goodCount = Number(goodCount);

		//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
		let postData = {data1:good,data2:reviewId}

		//非同期通信始めるよ
		$.ajaxSetup({scriptCharset:'utf-8'});
		$.ajax({
			//どのサーブレットに送るか
			//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
			url: '/A2/ApiGoodServlet',
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
			//成功した場合は、いいねのカウントを+1して、ハートが赤く変わる（同時にいいね削除ボタンになる）
			if(data==="true"){
				goodCount++;
				document.getElementById("counter").innerText = goodCount;
				/* この下でハートに色がついて、valueを0に変える関数を実行する */
			} else {
				//失敗した場合はなにもしない
			}
		  })
		   //非同期通信が失敗したときの処理
		  .fail(function() {
			//失敗した場合はなにもしない
		  });
	}
	</script>
</body>
</html>