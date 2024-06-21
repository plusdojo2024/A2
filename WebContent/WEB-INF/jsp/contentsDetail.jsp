<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>コンテンツ詳細|レコレコ</title>
    <link rel="stylesheet" href="css/test.css">
    <link rel="stylesheet" href="common.css">


</head>

<body>
    <header>
        <nav class="nav">
            <ul>
                <li>
                    <h1><a href="/A2/HomeServlet">レコレコ</a></h1>
                </li>
                <li>
                    <form action="/A2/SearchServlet" class="search-form" method="post">
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
                            <input type="text" name="search" class="search-input" placeholder="コンテンツ名・キーワードで検索">
                            <input type="image" src="img/search.png" class="search-button" alt="虫眼鏡">
                        </div>
                    </form>
                </li>
                <li><a href=""><img src="img/button_post.png" class="post-button" name="post" alt="ポスト"></a></li>
                <div class="co">
                    <div class="user-container">
                        <li><a href=""><img src="img/icon_default.png" class="icon-img" name="icon" alt="アイコン"><span
                                    class="user-name">recoreco</span>
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
    <div class="flex">
        <img src="img/ffx.png" width="180px" height="200px" name="photo" alt="写真">
        <div class="column">
            <h1 class="big">FINAL FANTASY X</h1><input type="hidden" id="contentsId" value="${contentsId}">
            <h3>ゲーム</h3>
            <h3>2001年</h3>
            <h3>スクウェア</h3>
        </div>

        <nav class="bt">
            <button type="button" name="submit">
                <img src="img/point_chat.png" alt="チャットの画像">
                ランダムチャットを開始
            </button>
            <button type="button" name="submit" id="collectionBtn" value="1" onclick="goAjaxCollection()">
                <img src="img/point_plus.png" alt="追加の画像">
                コレクションに追加
            </button>
            <button type="button" name="submit" id="wishlistBtn" value="1" onclick="goAjaxWishlist()">
                <img src="img/point_plus.png" alt="追加の画像">
                ウィッシュリストに追加
            </button>
        </nav>
    </div>

    <p id="tabcontrol">
        <a href="#tabpage1">
            自分のレビュー
        </a>
        <a href="#tabpage2">
            他ユーザのレビュー
        </a>
    </p>

    <div id="tabbody">
        <div id="tabpage1" class="area selected">
            <select name="select2">
                <option value="all">並び替え</option>
                <option value="new">新しい順</option>
                <option value="old">古い順</option>
            </select>

            <div class="contents">
                <img src="img/ffx.png" class="image" width="180px" height="200px" alt="写真">
                <p>06/06 22:22 投稿</p>
                <button class="delete-button" onclick="goAjaxDelete()">
                    <img src="img/garbage_can.png" class="delete-icon" width="20px" height="20px" alt="ゴミ箱">削除
                </button>
            </div>

            <h3 class="short" id="title" value="${title}">FINAL FANTASY X</h3>
            <div class="review" id="review" value="${review}">
                <input type="hidden" id="reviewId" value="${reviewId}">
                <p>オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！</p>
            </div>
            <button class="delete-button1" onclick="goAjaxEdit()">
                <img src="img/point_edit.png" class="delete-icon" width="20px" height="20px" alt="編集">編集
            </button>
            <div class="heart" onclick="toggleHeartColor(this)">
                <span class="heart-count">0</span>
            </div>
            <button>
            <img src="img/button_review.png" class="newreview" width="100px" height="100px" alt="新規レビューの写真">
            </button>
        </div>

        <div id="tabpage2" class="area">
            <select name="select2">
                <option value="all">並び替え</option>
                <option value="new">新しい順</option>
                <option value="old">古い順</option>
            </select>
            <div class="contents1">
                <img src="img/ffx.png" class="image" width="180px" height="200px" alt="写真">
                <div class="namae">
                    <img src="img/login1.png" class="image1" width="40px" height="40px" alt="アイコン写真"><span
                        class="namae1">名前さん</span>
                </div>
                <p>06/06 22:22 投稿</p>

            </div>

            <h3 class="short">FINAL FANTASY X</h3>
            <div class="review">
                <p>オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！オモロイ！！</p>
            </div>
            <div class="heart2" onclick="toggleHeartColor(this)">
                <span class="heart-count">0</span>
            </div>
        </div>


    </div>

    <footer>
        <a href=#top><span class="gotop"></span></a>
        <p class="copyright">&copy; WAC</p>
    </footer>
  </body>
</html>