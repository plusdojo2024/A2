<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン|レコレコ</title>
<link rel="stylesheet" type="text/css" href="/A2/css/login.css">
</head>
<header>
    <nav class="nav">
        <ul>
            <li>
                <h1>レコレコ</h1>
            </li>
        </ul>
     </nav>
</header>
  <body>
    <h3>ログイン</h3>
    <table class="table">
          <tr>
              <td>
                  <label class="id">ユーザID</label><br>
                  <input type="email" id="id" name="id" placeholder="メールアドレス">
              </td>
          </tr>
          <tr>
              <td>
                  <label class="pass">パスワード</label><br>
                  <input type="password"  id="pass" name="pass" placeholder="パスワード"><br>
                  <a href="newlogin">パスワードを忘れた方はこちら→</a>
              </td>
          </tr>
          <tr>
              <td>
                  <form id="loginForm" action="home.html" method="get"></form>
                  <input type="button" name="submit" value="ログイン" onclick="validateForm()"><br>
                  <a href="newlogin">新規会員登録はこちら→</a>
              </td>
          </tr>
      </table>
      <script>
            //アラートボックス
             function validateForm() {
            var userIdInput = document.getElementById("id").value;
            var userPassoword = document.getElementById("pass").value;
            if (userIdInput === "") {
                alert("ユーザIDを入力してください");
                return false; // フォームの送信を中止
            } else if (userPassoword === ""){
                alert("パスワードを入力してください");
                return false;
            } else {
                document.getElementById("loginForm").submit();
            }
        }
     </script>
  </body>
</html>