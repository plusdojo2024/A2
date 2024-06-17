<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
            <title>マイページ|レコレコ</title>
            <link rel="stylesheet" href="css/myPage.css">
            <link rel="stylesheet" href="css/common.css">
    </head>
    <header>
        <nav class="nav">
            <ul>
                <li>
                    <h1>レコレコ</h1>
                </li>
                <li>
                    <form action="" method="get">
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
                <li><a href=""><img src="image/post.png" width="60px" height="60px" name="post" alt="ポスト"></a></li>
                <li><a href=""><img src="image/login1.png" width="75px" height="75px" name="icon" alt="アイコン"></a></li>
            </ul>
        </nav>
    </header>
    <body id="top">
        <div>
            <img src="image/icon.png">
            <div>
                <h3>ユーザ名</h3>
                <p>
                    総レビュー件数　${count_review}件<br>
                    総いいね件数　${count_allGood}件
                </p>
            </div>
            <p>
                ${introduction}
            </p>
        </div>

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
                        <img src="image/icon.png" class="login" alt="アイコン" width="150px" height="150px">
                        <input type="button" name="upload" value="写真をアップロード"><br>
                        <div>
                            <button class="delete-button" onclick="deleteItem()">
                                <img src="image/garbage_can.png" class="delete-icon" width="30px" height="30px" alt="ゴミ箱">削除
                                </button>
                        </div>
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
    </body>
	<footer>
		<a href=#top><span class="gotop"></span></a>
		<p class="copyright">&copy; WAC</p>
	</footer>
</html>