<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ管理|レコレコ</title>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/A2/css/common.css">
<link rel="stylesheet" type="text/css" href="/A2/css/userManage.css">
</head>
<header>
    <nav class="nav">
        <ul>
            <li>
                <h1><a href="/A2/HomeServlet">レコレコ</a></h1>
            </li>
            <li>
                <form action="/A2/SearchServlet"  class="search-form" method="post" id="userManage_form">
                    <div class="search-box">
                        <select name="select">
                            <option value="all">すべて</option>
                            <option value="movie">映画</option>
                            <option value="dorama">ドラマ</option>
                            <option value="anime">アニメ</option>
                            <option value="sonota1">その他（映像）</option>
                            <option value="novel">小説</option>
                            <option value="comics">マンガ</option>
                            <option value="sonota2">その他（書籍）</option>
                            <option value="game">ゲーム</option>
                        </select>
                        <input type="text" name="search"  class="search-input" placeholder="コンテンツ名を検索・登録">
                        <input type="image" src="img/button_search.png" class="search-button" alt="虫眼鏡">
                    </div>
                </form>
            </li>
            <li><a href=""><img src="/A2/img/button_post.png" class="post-button" name="post" alt="ポスト"></a></li>
            <div class="co">
                <div class="user-container"></div>
                    <li><a href=""><img src="/A2/img/icon_default.png" class="icon-img" name="icon" alt="アイコン"><span class="user-name">recoreco</span>
                        <ul class="dropdown-menu">
                            <li><a href="/A2/MyPageServlet">マイページ</a></li>
                            <li><a href="/A2/userManageServlet">ユーザ管理</a></li>
                            <li><a href="/A2/LoginServlet">ログアウト</a></li>
                        </ul>
                        </a>
                    </li>
                </div>
            </div>
        </ul>
    </nav>
</header>
<body>
	<c:forEach var="e" items="${userList}">
        <h3>ユーザ管理</h3>
        <form id="user_management" method="get" action="/A2/HomeServlet">
            <table class="table">
                <tr>
                    <td>
                        <label class="id">ユーザID（メールアドレス）</label><br>
                        <input type="email" name="id" id="id" value="${e.mail}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="pass">パスワード(8~16桁)</label><br>
                        <input type="password" name="pass" id="pass" value="${e.pass}">
                        <span id="buttonEye1" class="fa fa-eye" onclick="togglePasswordVisibility('pass', 'buttonEye1')"></span>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <label class="pass">パスワード確認（再度パスワードを入力）</label><br>
                        <input type="password" name="pass" id="passConfirm" value="${e.pass}">
                        <span id="buttonEye2" class="fa fa-eye" onclick="togglePasswordVisibility('passConfirm', 'buttonEye2')"></span>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <label class="name">ユーザ名（他ユーザに表示される名前）</label><br>
                        <input type="text" name="name" id="name" value="${e.user_name}">
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <label class="photo">アイコン画像の選択</label><br>
                        <div class="icon">
                        <img src="${e.icon}"  id="preview" class="login" alt="アイコン" width="180px" height="200px">
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
                        <input type="text" name="my_introduction" placeholder="200文字以内" value="${e.introduction}">
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <label class="open">アカウント公開設定</label><br>
                        <label><input type="radio" name="first" id="yes" value="yes" <c:if test="${e.open_close.equals('yes')}">checked</c:if>>公開</label>
                        <label><input type="radio" name="first" id="no" value="no" <c:if test="${e.open_close.equals('no')}">checked</c:if>>非公開<br></label>
                        <a >アカウントを非公開にすると、他のユーザからチャット機能が制限され、</a><br>
                        <a >あなたの書いたレビューは他ユーザから閲覧されません。</a>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <input type="submit" name="update"  id="submit" value="更新">
                        <input type="button" name="delete1" value="削除" onclick="showDeleteConfirm()">
                    </td>
                 </tr>
            </table>
        </form>
	</c:forEach>
        <!-- 2種のアラートボックス -->
			<div class="overlay"></div>
			<div class="confirmBox">
				<h4>【確認】</h4>
				<p id="confirmMessage"></p>
                <div class="aa">
				<button id="yes" onclick="resetForm();hideConfirm()" class="button1">はい</button>
				<button id="no" onclick="hideConfirm()" class="button1">いいえ</button>
			</div>
            </div>
			<div class="alertBox">
				<h4>【内容不正】</h4>
				<p id="alertMessage"></p>
				<button onclick="hideAlert()" class="button">閉じる</button>
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
    // 更新ボタン押下時の処理
    var formObj = document.getElementById('user_management');
    var idInput = document.getElementById('id');
    var passInput = document.getElementById('pass');
    var passConfirmInput = document.getElementById('passConfirm');
    var nameInput = document.getElementById('name');
    var openInputs = document.getElementsByName('first');

    formObj.addEventListener('submit', function(event) {
        event.preventDefault(); // デフォルトの送信を防ぐ

        var id = idInput.value.trim();
        var pass = passInput.value.trim();
        var passConfirm = passConfirmInput.value.trim();
        var name = nameInput.value.trim();
        var open = '';

        // 選択されたラジオボタンの値を取得
        for (var i = 0; i < openInputs.length; i++) {
            if (openInputs[i].checked) {
                open = openInputs[i].value;
                break;
            }
        }

        if (pass.length < 8 || pass.length > 16) {
            showAlert('パスワードは8~16桁で入力してください!');
        } else if (pass !== passConfirm) {
            showAlert('確認パスワードの値が間違っています！');
        } else {
            var confirmMessage = '更新してもよろしいですか？';
            showConfirm(confirmMessage);
        }
    });

    // 削除ボタン押下時の処理
    function showDeleteConfirm() {
        var confirmMessage = '本当に削除してもよろしいですか？';
        showConfirm(confirmMessage);
    }

    // 確認ボックスのYESボタンをクリックしたときの処理
    function deleteConfirmed() {
        formObj.submit(); // フォームを送信して削除処理を実行
    }

    // 確認ボックスのNOボタンをクリックしたときの処理
    function hideConfirm() {
        document.querySelector('.confirmBox').style.display = 'none';
        document.querySelector('.overlay').style.display = 'none';
    }

    // アラートボックスのCLOSEボタンをクリックしたときの処理
    function hideAlert() {
        document.querySelector('.alertBox').style.display = 'none';
        document.querySelector('.overlay').style.display = 'none';
    }

    // アラートボックスを表示する関数
    function showAlert(alertMessage) {
        document.querySelector('.alertBox').style.display = 'block';
        document.querySelector('.overlay').style.display = 'block';
        document.getElementById('alertMessage').textContent = alertMessage;
    }

    // 確認ボックスを表示する関数
    function showConfirm(confirmMessage) {
        document.querySelector('.confirmBox').style.display = 'block';
        document.querySelector('.overlay').style.display = 'block';
        document.getElementById('confirmMessage').textContent = confirmMessage;
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