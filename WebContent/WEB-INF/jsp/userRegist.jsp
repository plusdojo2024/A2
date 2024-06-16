<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規ユーザ登録|レコレコ</title>
<link rel="stylesheet" type="text/css" href="/A2/css/common.css">
<link rel="stylesheet" type="text/css" href="/A2/css/userRegist.css">
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
<h3>新規ユーザ登録</h3>
<form action="/A2/userRegistServlet" method=post>
        <table class="table">
            <tr>
                <td>
                    <label class="id">ユーザID（メールアドレス）<span class="required">＊必須</span></label><br>
                    <input type="email" name="id">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="pass">パスワード(8~16桁)<span class="required"> ＊必須</span></label><br>
                    <input type="password" name="pass">
                </td>
             </tr>
             <tr>
                <td>
                    <label class="pass">パスワード確認（再度パスワードを入力）<span class="required">＊必須</span></label><br>
                    <input type="password" name="pass">
                </td>
             </tr>
             <tr>
                <td>
                    <label class="name">ユーザ名（他ユーザに表示される名前）<span class="required">＊必須</span></label><br>
                    <input type="text" name="name">
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
                    <label><input type="radio" name="first" id="yes" value="yes">公開</label>
                    <label><input type="radio" name="first" id="no" value="no">非公開<br></label>
                    <a >アカウントを非公開にすると、他のユーザからチャット機能が制限され、</a><br>
                    <a >あなたの書いたレビューは他ユーザから閲覧されません。</a>
                </td>
             </tr>
             <tr>
                <td>
                    <input type="button" name="submit" value="登録" onclick="registerUser()">
                </td>
             </tr>
        </table>
        </form>
        <footer>
            <a href=#top><span class="gotop"></span></a>
            <p class="copyright">&copy; WAC</p>
        </footer>
        <script>

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

        // 登録ボタンをクリックしたときに呼び出される関数
        function registerUser() {
            // ここにフォームのバリデーションコードを追加することができます
            // バリデーションが成功したら、以下のコードでリダイレクトを行います
            window.location.href = "login.html";
        }
    </script>
</body>
</html>