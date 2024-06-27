<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://kit.fontawesome.com/db6a44b155.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/myBC/css/style.css">
	<title>ログイン | 名刺管理</title>
</head>
<body id="top">
	<div  class="bg login">
		<!--ヘッダー-->
		<header>
			<div class="title">
				<a href="/myBC/HomeServlet"><h1>Business Card Manager</h1></a>
				<p align="left">　<br><!-- 高さを他のページと合わせるため -->
            					　</p>
				<a href="/myBC/HomeServlet"><img src="/myBC/img/icon_dove.png" alt="ハトのアイコン"></a>
				<div class="top_bg">　</div>
			</div>
			<nav class="nav">
				<ul>
					<li><a href="/myBC/HomeServlet">ホーム</a></li>
                    <li><a href="/myBC/RegistServlet">登録</a></li>
                    <li><a href="/myBC/SearchServlet">検索</a></li>
                    <li><a href="/myBC/UserRegistServlet">新規登録</a></li>
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
		<!-- 時計ここまで -->
		<h1 class="theme">ログイン</h1>
		<!--メイン-->
		<main>
			<div>
				<form id="login_form" action="/myBC/LoginServlet" method="post">
					<table class="input">
						<tr>
							<th class="loginForm"><label for="id">ID</label></th>
							<td><input type="text" name="id" placeholder="ID" id="id"></td>
						</tr>
						<tr>
							<th class="loginForm"><label for="pw">Pass</label></th>
							<td><input type="password" name="pw" class="loginPw" placeholder="パスワード" id="pw"></td>
							<td><span id="eye" class="fa-solid fa-eye-slash" onclick="pushHideButton()"></span></td>
						</tr>
						<tr>
							<td><input type="submit"  name="login" value="LOGIN" class="button"> </td>
							<td><button type="button" id="resetBtn" class="button">RESET</button></td>
						</tr>
					</table>
				</form>
			</div>

			<!-- 2種のアラートボックス -->
			<div class="overlay"></div>
			<div class="confirmBox">
				<h3>【確認】</h3>
				<p id="confirmMessage"></p>
				<button id="yes" onclick="resetForm();hideConfirm()" class="button">YES</button>
				<button id="no" onclick="hideConfirm()" class="button">NO</button>
			</div>
			<div class="alertBox">
				<h3>【内容不正】</h3>
				<p id="alertMessage"></p>
				<button onclick="hideAlert()" class="button">CLOSE</button>
			</div>
			<!-- アラートボックスここまで -->
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
		//内容取得（入力フォーム全体、リセットボタン、パスワード入力フォーム）
		let formObj = document.getElementById('login_form');
		let resetObj = document.getElementById('resetBtn');

		//ボックス表示系の処理リスト
		//リセットボタンを押したときの処理
		resetObj.onclick = function(){
            showConfirm('本当にリセットしてもよろしいですか？');
		}

		//送信ボタン押したときの処理
		formObj.onsubmit = function(){
			if(formObj.id.value ==='' || formObj.pw.value ===''){
				showAlert('IDまたはパスワードを入力してください！');
				return false;
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
        // 内容不正ボックスを表示する関数
        function hideAlert(){
            document.querySelector('.alertBox').style.display = 'none';
            document.querySelector('.overlay').style.display = 'none';
        }

        //入力内容をリセットする関数
        function resetForm(){
            formObj.reset();
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
