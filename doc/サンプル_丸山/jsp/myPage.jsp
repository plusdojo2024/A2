<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>マイページ | 名刺管理</title>
	<link rel="stylesheet" href="/myBC/css/style.css">
	<script src="https://kit.fontawesome.com/db6a44b155.js" crossorigin="anonymous"></script>
</head>
<body id="top">
    <div class="bg myPage">
		<!--ヘッダー-->
		<header>
			<div class="title">
				<a href="/myBC/HomeServlet"><h1>Business Card Manager</h1></a>
				<p align="left">
					　ユーザーID: ${LoginUser.userId}<br>
            		　${LoginUser.userName}さんの<a href="/myBC/MyPageServlet"><span class="mayPage">マイページ</span></a>
            	</p>
				<a href="/myBC/HomeServlet"><img src="/myBC/img/icon_dove.png" alt="ハトのアイコン"></a>
				<div class="top_bg">　</div>
			</div>
			<nav class="nav">
				<ul>
					<li><a href="/myBC/HomeServlet">ホーム</a></li>
                    <li><a href="/myBC/RegistServlet">登録</a></li>
                    <li><a href="/myBC/SearchServlet">検索</a></li>
                    <li><a href="/myBC/LogoutServlet">ログアウト</a></li>
				</ul>
			</nav>
		</header>
		<!--ヘッダーここまで-->
			<!-- 時計 -->
			<div id="clock">
				<p id="ymd"></p>
				<div id="time">
					<p id="time_hm"></p>
					<p id="time_s"></p>
				</div>
			</div>
        <h1 class="theme">マイページ</h1>
        <!--メイン-->
        <main>
        	<p class="myPageIntro">マイページでは、ユーザー情報の変更ができます。<br></p>
            <form id="myPage_form" action="/myBC/MyPageServlet" method="post" style="margin: auto;">
					<table class="input">
						<tr>
							<th class="loginForm"><label for="id">ID</label></th>
							<td><input type="text" name="id" value="${LoginUser.userId}" id="id"></td>
						</tr>
						<tr>
							<th class="loginForm"><label for="pw">Pass</label></th>
							<td><input type="password" name="pw" class="userRegistPw" value="${pw}" id="pw"></td><td><span id="eye" class="fa-solid fa-eye-slash" onclick="pushHideButton()"></span></td>
						</tr>
						<tr>
							<th class="loginForm"><label for="userName">ユーザー名</label></th>
							<td><input type="text" name="userName" value="${LoginUser.userName}" id="userName"></td>
						</tr>
						<tr>
							<td><input type="submit" id="update" name="submit" value="UPDATE" class="button"></td>
							<td><input type="submit" id="delete" name="submit" value="DELETE" class="button"></td>
						</tr>
					</table>
					<!-- 2種のアラートボックス -->
					<div class="overlay"></div>
					<div class="confirmBox">
						<h3>【確認】</h3>
						<p id="confirmMessage"></p>
						<input type="submit" id="yes" name="submit" value="YES" class="button">
						<button type="button" id="no" onclick="hideConfirm()" class="button">NO</button>
					</div>
					<div class="alertBox">
						<h3>【内容不正】</h3>
						<p id="alertMessage"></p>
						<button type="button" onclick="hideAlert()" class="button">CLOSE</button>
					</div>
					<!-- アラートボックスここまで -->
           	</form>
			<a href="/myBC/HomeServlet" id="back">戻る</a>
        </main>
        <!--メインここまで-->
    </div>
	<!--フッター-->
	<footer>
		<a href=#top><span class="gotop"></span></a>
		<p class="copyright">&copy; MANAHO MARUYAMA</p>
	</footer>
	<!--フッターここまで-->
    <script>
        'use strict';

      //事前設定
		//内容取得
		let formObj = document.getElementById('myPage_form');

		//submit時の処理
		formObj.onsubmit = function(e){
			// クリックされたボタンのidを取得
			const submitter = e.submitter;
			const click_id = submitter.id;

			// updateボタンの場合の処理
			if (click_id === "update") {

				// 必須項目が空欄の場合、アラートを表示
				if(formObj.id.value ==='' || formObj.pw.value ==='' || formObj.userName.value ==='') {
					e.preventDefault();		// 一旦 submit を止める
					showAlert('ID、パスワード、ユーザー名のいずれかが未入力です！');	//アラート表示
				}

			// deleteボタンの場合の処理
			} else if (click_id === "delete"){
				e.preventDefault();		// 一旦 submit を止める
				showConfirm('本当に削除してもよろしいですか？');	//確認ボックス表示
				formObj.off('submit');	// submitイベントごとキャンセル

			// 確認ボックスのyesボタンの場合の処理
			} else if (click_id === "yes"){
				hideConfirm();	// 確認ボックスを隠す
			}
		}

		// 関数リスト
		//確認ボックスを表示する関数
        function showConfirm(confirmMessage) {
            document.querySelector('.confirmBox').style.display = 'block';
            document.querySelector('.overlay').style.display = 'block';
            document.getElementById('confirmMessage').textContent = confirmMessage;
        }
        //確認ボックスを隠す関数
        function hideConfirm() {
            document.querySelector('.confirmBox').style.display = 'none';
            document.querySelector('.overlay').style.display = 'none';
        }
        //内容不正ボックスを表示する関数
        function showAlert(alertMessage) {
            document.querySelector('.alertBox').style.display = 'block';
            document.querySelector('.overlay').style.display = 'block';
            document.getElementById('alertMessage').textContent = alertMessage;
        }
		// 内容不正ボックスを隠す関数
        function hideAlert(){
            document.querySelector('.alertBox').style.display = 'none';
            document.querySelector('.overlay').style.display = 'none';
        }
		//送信するための関数
		function submitForm(){
			formObj.submit();
		}

		//目のマークを切り替える
		function pushHideButton() {
			var txtPass = document.getElementById("pw");
			var btnEye = document.getElementById("eye");
			if (txtPass.type === "text") {
				txtPass.type = "password";
				btnEye.className = "fa-regular fa-eye-slash";
			} else {
				txtPass.type = "text";
				btnEye.className = "fa-regular fa-eye";
			}
      	}

		//時計（全ページ共通）

		function recalc() {
			let now = new Date();
			let year = now.getFullYear();
			let month = ("0" + (now.getMonth() + 1)).slice(-2);
			let date= ("0" + now.getDate()).slice(-2);
			let days = ["日","月","火","水","木","金","土"];
			let day = days[now.getDay()];
			let hour = ("0" + now.getHours()).slice(-2);
			let min = ("0" + now.getMinutes()).slice(-2);
			let sec = ("0" + now.getSeconds()).slice(-2);

			document.getElementById('ymd').textContent = year + " / " + month + " / " + date + " ( " + day + " )";
            document.getElementById('time_hm').textContent = hour + ":" + min;
            document.getElementById('time_s').textContent = ":" + sec;
			refresh();
		}

		function refresh() {
    		setTimeout(recalc, 1000);
		}

		recalc();

    	//操作しなかったらログアウト（全ページ共通）
    	(function(){
			const sec = 300;
			const events = ['keydown', 'mousemove', 'click'];
			let timeoutId;

			//タイマー設定
			function setTimer(){
				timeoutId = setTimeout(logout, sec*1000);
			}
			function resetTimer(){
				clearTimeout(timeoutId);
				setTimer();
        	}

			//イベント設定
			function setEvents(func){
				let len = events.length;
				while(len--){
					addEventListener(events[len], func, false);
				}
        	}


			//ログアウト
			function logout(){
				location.href = '/myBC/LogoutServlet';
			}

			setTimer();
			setEvents(resetTimer);
    	})();
    </script>
</body>
</html>
