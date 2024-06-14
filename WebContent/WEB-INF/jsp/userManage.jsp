<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ管理|レコレコ</title>
<link rel="stylesheet" type="text/css" href="/A2/css/userManage.css">
</head>
<header>
        <nav class="nav">
            <ul>
                <li>
                    <h1><a href="/A2/HomeServlet">レコレコ</a></h1>
                </li>
                <li>
                    <form action="/A2/SearchServlet" method="get">
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
                    <input type="text" name="search" placeholder="コンテンツ名を検索・登録">
                    <input type="image" src="image/search.png" width="20px" height="20px" alt="虫眼鏡">
                </form>
                </li>
                <li><a href=""><img src="/A2/image/post.png" width="60px" height="60px" name="post" alt="ポスト"></a></li>
                <div class="co">
                <li><a href=""><img src="/A2/image/login1.png" width="75px" height="75px" name="icon" alt="アイコン">
                <ul class="dropdown-menu">
                    <li><a href="">マイページ</a></li>
                    <li><a href="/A2/userManageServlet">ユーザ管理</a></li>
                    <li><a href="">ログアウト</a></li>
                </ul>
                </a>
                </div>
            </li>
            </ul>
        </nav>
    </header>
<body>
<body>
        <h3>ユーザ管理</h3>
        <form id="user_management" method="get" action="home.html">
            <table class="table">
                <tr>
                    <td>
                        <label class="id">ユーザID（メールアドレス）</label><br>
                        <input type="email" name="id">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="pass">パスワード(8~16桁)</label><br>
                        <input type="password" name="pass">
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <label class="pass">パスワード確認（再度パスワードを入力）</label><br>
                        <input type="password" name="pass">
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <label class="name">ユーザ名（他ユーザに表示される名前）</label><br>
                        <input type="text" name="name">
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <label class="photo">アイコン画像の選択</label><br>
                        <div class="icon">
                        <img src="/A2/image/icon.png"  id="preview" class="login" alt="アイコン" width="180px" height="200px">
                        <input type="file" name="upload" accept="image/*" onchange="previewImage(event)"><br>
                        </div>
                            <button class="delete-button" onclick="deleteItem()">
                                <img src="/A2/image/garbage_can.png" class="delete-icon" width="30px" height="30px" alt="ゴミ箱">削除
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
                        <label class="open">アカウント公開設定</label><br>
                        <label><input type="radio" name="first" id="yes" value="yes">公開</label>
                        <label><input type="radio" name="first" id="no" value="no">非公開<br></label>
                        <a >アカウントを非公開にすると、他のユーザからチャット機能が制限され、</a><br>
                        <a >あなたの書いたレビューは他ユーザから閲覧されません。</a>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <input type="button" name="update" value="更新">
                        <input type="button" name="delete1" value="削除">
                    </td>
                 </tr>
            </table>
        </form>
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
                document.getElementById('preview').src = "image/icon.png";
            }
        }

         // 削除ボタンをクリックしたときに呼び出される関数
         function deleteItem() {
            // 元のアイコン画像のパスを設定
            document.getElementById('preview').src = "image/icon.png";
            // ファイル選択のinput要素もリセットする場合は次の行を追加
            document.querySelector('input[type="file"]').value = null;
        }

        </script>
</body>
</html>