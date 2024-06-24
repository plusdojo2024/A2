<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン|レコレコ</title>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/A2/css/common.css">
<link rel="stylesheet" type="text/css" href="/A2/css/login.css">
</head>
<header>
    <nav class="nav">
        <ul>
            <li>
                <h1><a href="/A2/LoginServlet">レコレコ</a></h1>
            </li>
        </ul>
     </nav>
</header>
 <body>
   <h3>ログイン</h3>
   <form id="login_form" action="/A2/LoginServlet" method="post">
   		<table class="table">
            <tr>
                <td>
                    <label class="id">ユーザID</label><br>
                    <input type="email" id="id" name="mail" placeholder="メールアドレス">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="pass">パスワード</label><br>
                    <input type="password"  id="pass" name="pass" placeholder="パスワード">
                    <span id="buttonEye" class="fa fa-eye" onclick="pushHideButton()"></span>
                    <br>
                    <a href="/A2/UserRegistServlet">パスワードを忘れた方はこちら→</a>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" value="ログイン" id="submit"  class="submit"><br>
                    <a href="/A2/UserRegistServlet">新規会員登録はこちら→</a>
                </td>
            </tr>
        </table>
    </form>

      <!-- アラートボックス -->
	    <div class="overlay"></div>
		<div class="alertBox">
			<h4>【内容不正】</h4>
			<p id="alertMessage"></p>
			<button onclick="hideAlert()" class="submit">閉じる</button>
		</div>
		<!-- アラートボックスここまで -->

        <footer>
            <a href=#top><span class="gotop"></span></a>
            <p class="copyright">&copy; WAC</p>
        </footer>
      <script>
        'use strict';

        //アラートボックス
        //事前設定
		//内容取得（入力フォーム全体、パスワード入力フォーム）
		let formObj = document.getElementById('login_form');
        let idInput = document.getElementById('id');
        let passInput = document.getElementById('pass');

		//ボックス表示系の処理リスト
		//登録ボタン押したときの処理
        formObj.onsubmit = function(event) {

            // 入力値の取得
            let id = idInput.value.trim();
            let pass = passInput.value.trim();

            if (id === '' || pass === '') {
            	event.preventDefault(); // フォームのデフォルトの送信を防ぐ
                showAlert('ユーザID、パスワードを入力してください！');
            }else if(pass.length < 8 || pass.length > 16) {
            	event.preventDefault(); // フォームのデフォルトの送信を防ぐ
            	showAlert('パスワードは8~16桁で入力してください!');
            }
        }


		// 関数リスト
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

        //目のマークを切り替える
		//パスワードを目で見えるようにする
        function pushHideButton() {
        var txtPass = document.getElementById("pass");
        var btnEye = document.getElementById("buttonEye");
        if (txtPass.type === "text") {
          txtPass.type = "password";
          btnEye.className = "fa fa-eye";
        } else {
          txtPass.type = "text";
          btnEye.className = "fa fa-eye-slash";
        }
      }
     </script>
  </body>
</html>