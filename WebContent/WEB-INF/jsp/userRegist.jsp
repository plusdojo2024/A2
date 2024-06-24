<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規ユーザ登録|レコレコ</title>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/A2/css/common.css">
<link rel="stylesheet" type="text/css" href="/A2/css/userRegist.css">
</head>
<header>
  <nav class="nav">
    <ul>
      <li>
        <h1><a href="/A2/UserRegistServlet">レコレコ</a></h1>
      </li>
    </ul>
  </nav>
</header>
<body>
<h3>新規ユーザ登録</h3>
<form action="/A2/userRegistServlet" id="userRegist_form" method=post>
        <table class="table">
            <tr>
                <td>
                    <label class="id">ユーザID（メールアドレス）<span class="required">＊必須</span></label><br>
                    <input type="email" name="id" id="id">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="pass">パスワード(8~16桁)<span class="required"> ＊必須</span></label><br>
                    <input type="password" name="pass" id="pass">
                    <span id="buttonEye1" class="fa fa-eye" onclick="togglePasswordVisibility('pass', 'buttonEye1')"></span>
                </td>
             </tr>
             <tr>
                <td>
                    <label class="pass">パスワード確認（再度パスワードを入力）<span class="required">＊必須</span></label><br>
                    <input type="password" name="pass" id="passConfirm">
                    <span id="buttonEye2" class="fa fa-eye" onclick="togglePasswordVisibility('passConfirm', 'buttonEye2')"></span>
                </td>
             </tr>
             <tr>
                <td>
                    <label class="name">ユーザ名（他ユーザに表示される名前）<span class="required">＊必須</span></label><br>
                    <input type="text" name="name" id="name">
                </td>
             </tr>
             <tr>
                <td>
                    <label class="photo">アイコン画像の選択</label><br>
                    <div class="icon">
                    <img src="/A2/img/icon_default.png" name="icon" id="preview" class="login" alt="アイコン" width="180px" height="200px">
                    <input type="file" name="upload" accept="image/*" onchange="previewImage(event)"><br>
                    </div>
                        <button class="delete-button" onclick="deleteItem()">
                            <img src="/A2/img/point_delete.png" class="delete-icon" alt="ゴミ箱"> <span class="delete-text">削除</span>
                        </button>

                </td>
             </tr>
             <tr>
                <td>
                    <label class="my_introduction">自己紹介</label><br>
                    <input type="text" name="my_introduction" placeholder="200文字以内">
                </td>
             </tr>
             <tr>
                <td>
                    <label class="open">アカウント公開設定<span class="required"> ＊必須</span></label><br>
                    <label><input type="radio" name="first" id="open" value="yes">公開</label>
                    <label><input type="radio" name="first" id="open" value="no" class="first">非公開<br></label>
                    <a >アカウントを非公開にすると、他のユーザからチャット機能が制限され、</a><br>
                    <a >あなたの書いたレビューは他ユーザから閲覧されません。</a>
                </td>
             </tr>
             <tr>
                <td>
                    <input type="submit" name="submit" value="登録" id="submit" class="submit">
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

        // ファイル選択時に呼び出される関数
        function previewImage(event) {
        // 選択されたファイルを取得
        var selectedFile = event.target.files[0];
        // ファイルが選択されている場合
        if (selectedFile) {
            // FileReaderオブジェクトを作成
            var reader = new FileReader();
            // ファイルの読み込みが完了した時の処理を定義
            reader.onload = function(event) {
                // プレビュー画像のsrc属性に選択されたファイルの内容を設定
                document.getElementById('preview').src = event.target.result;
            };
            // ファイルの読み込みを実行
            reader.readAsDataURL(selectedFile);
        } else {
            // ファイルが選択されていない場合は元のアイコンを表示
            document.getElementById('preview').src = "/A2/img/icon_default.png";
        }
    }

     // 削除ボタンをクリックしたときに呼び出される関数
     function deleteItem() {
        // 元のアイコン画像のパスを設定
        document.getElementById('preview').src = "/A2/img/icon_default.png";
        // ファイル選択のinput要素もリセットする場合は次の行を追加
        document.querySelector('input[type="file"]').value = null;

        // ページの再読み込みを防ぐ
        event.preventDefault();
    }

    //アラートボックス
    //事前設定
    //内容取得（入力フォーム全体、パスワード入力フォーム）
    let formObj = document.getElementById('userRegist_form');
    let idInput = document.getElementById('id');
    let passInput = document.getElementById('pass');
    let passConfirmInput = document.getElementById('passConfirm');
    let nameInput = document.getElementById('name');
    let openInputs = document.getElementsByName('first');
    let introductionInput = document.getElementsByName('my_introduction')[0];


    // 登録ボタン押したときの処理
    formObj.onsubmit = function(event) {
        event.preventDefault(); // フォームのデフォルトの送信を防ぐ

        // 入力値の取得
        let id = idInput.value.trim();
        let pass = passInput.value.trim();
        let passConfirm = passConfirmInput.value.trim();
        let name = nameInput.value.trim();
        let open = '';
        let introduction = introductionInput.value.trim();

        // 選択されたラジオボタンの値を取得
        for (let i = 0; i < openInputs.length; i++) {
            if (openInputs[i].checked) {
                open = openInputs[i].value;
                break;
            }
        }

        // 全ての必須項目が入力されているかチェック
        if (id === '' || pass === '' || passConfirm === '' || name === '' || open === '') {
        	event.preventDefault(); // フォームのデフォルトの送信を防ぐ
            showAlert('必須項目を入力してください！');
        } else if (pass.length < 8 || pass.length > 16) {
        	event.preventDefault(); // フォームのデフォルトの送信を防ぐ
            showAlert('パスワードは8~16桁で入力してください!');
        } else if (pass !== passConfirm) {
        	event.preventDefault(); // フォームのデフォルトの送信を防ぐ
            showAlert('確認パスワードの値が間違っています！');
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
        function togglePasswordVisibility(inputId, buttonId) {
        var txtPass = document.getElementById(inputId);
        var btnEye = document.getElementById(buttonId);
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