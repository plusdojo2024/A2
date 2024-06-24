<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
            <title>マイページ|レコレコ</title>
            <link rel="stylesheet" href="css/OtherMyPage.css">
            <link rel="stylesheet" href="css/common.css">
    </head>
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
                            <input type="image" src="img/button_search.png" class="search-button" alt="虫眼鏡">
                        </div>
                    </form>
                </li>
                <li><a href=""><img src="img/button_post.png" class="post-button" name="post" alt="ポスト"></a></li>
                <div class="co">
                    <div class="user-container">
                        <li><a href=""><img src="img/icon_default.png" class="icon-img" name="icon" alt="アイコン"><span class="user-name">recoreco</span>
                            <ul class="dropdown-menu">
                                <li><a href="/A2/MyPageServlet">マイページ</a></li>
                                <li><a href="/A2/UserManageServlet">ユーザ管理</a></li>
                                <li><a href="/A2/LoginServlet">ログアウト</a></li>
                            </ul>
                            </a>
                        </li>

                    </div>
                </div>
            </ul>
        </nav>
    </header>
    <body id="top">
        <!-- ユーザ情報 -->
        <div class="profile">
            <img src="img/icon_higuchi.png" alt="アイコン" class="icon">
            <div class="userInfo">
                <h2 class="userName">樋口 さん</h2>
                <p class="achievements">
                    総レビュー件数　${count_review}件<br>
                </p>
                <button type="button" name="favorite_add" class="bt">
                    <img src="img/point_favorite.png" alt="お気に入りユーザに追加の画像">
                    <span class="bt-text">お気に入りユーザに追加</span>
                </button>
                <button type="button" name="direct-chat" class="bt">
                    <img src="img/point_chat.png" alt="チャットの画像">
                    <span class="bt-text">チャットをする</span>
                </button>
            </div>
            <p class="introduction">
                ${introduction}自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介
            </p>
        </div>
        <!-- タブ -->
        <div class="wrapper">
            <ul id="tab">
              <li><a href="#collectionList">コレクション</a></li>
              <li><a href="#reviewList">レビュー一覧</a></li>
            </ul>

            <div id="tabbody">
                <div id="collectionList" class="area selected">
                    <select name="sort" class="select">
                        <option value="sort">並び替え</option>
                        <option value="fromNew">新しい順</option>
                        <option value="fromOld">古い順</option>
                    </select>
                    <select name="narrowDown" class="select">
                        <option value="narrowDown">絞り込み</option>
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
                    <ul>
                        <c:forEach var="e" items="${collectionList}" class="myContentsList">
                            <li>
                                <form name="form${e.contents_id}" action="/A2/ContentsDetailServlet" method="get">
                                    <a href="javascript:form${e.contents_id}.submit()" class="contents">
                                        <input type="hidden" name="contens_id" value="${e.contents_id}">
                                        <img src="img/${e.image}" alt="コンテンツ画像" class="contentsImage"><br>
                                        ${e.title}<br>
                                        ${e.genre}
                                    </a>
                                </form>
                            </li>
                            <li>
                                <form name="form${e.contents_id}" action="/A2/ContentsDetailServlet" method="get">
                                    <a href="javascript:form${e.contents_id}.submit()" class="contents">
                                        <input type="hidden" name="contens_id" value="${e.contents_id}">
                                        <img src="img/${e.image}" alt="コンテンツ画像" class="contentsImage"><br>
                                        ${e.title}<br>
                                        ${e.genre}
                                    </a>
                                </form>
                            </li><li>
                                <form name="form${e.contents_id}" action="/A2/ContentsDetailServlet" method="get">
                                    <a href="javascript:form${e.contents_id}.submit()" class="contents">
                                        <input type="hidden" name="contens_id" value="${e.contents_id}">
                                        <img src="img/${e.image}" alt="コンテンツ画像" class="contentsImage"><br>
                                        ${e.title}<br>
                                        ${e.genre}
                                    </a>
                                </form>
                            </li><li>
                                <form name="form${e.contents_id}" action="/A2/ContentsDetailServlet" method="get">
                                    <a href="javascript:form${e.contents_id}.submit()" class="contents">
                                        <input type="hidden" name="contens_id" value="${e.contents_id}">
                                        <img src="img/${e.image}" alt="コンテンツ画像" class="contentsImage"><br>
                                        ${e.title}<br>
                                        ${e.genre}
                                    </a>
                                </form>
                            </li>
                        </c:forEach>
                    </ul>
                <!--/area--></div>
                <div id="reviewList" class="area">
                    <select name="sort" class="select">
                        <option value="sort">並び替え</option>
                        <option value="fromNew">新しい順</option>
                        <option value="fromOld">古い順</option>
                    </select>
                    <ul>
                        <c:forEach var="e" items="${reviewList}">
                            <li class="reviewBar">
                                <div class="review">
                                    <img src="img/${e.image}" alt="写真" class="reviewImage">
                                    <p class="reviewTime">${e.createdAt}</p>
                                    <div class="review_button">
                                    <button class="update-button">
                                        <img src="img/point_delete.png">
                                        <span class="update-text">削除</span>
                                    </button>
                                    <button class="update-button">
                                        <img src="img/point_edit.png">
                                        <span class="update-text">編集</span>
                                    </button>
                                </div>
                                </div>
                                <h3 class="reviewTitle"> ${e.title}</h3>
                                <p class="reviewText">${e.review}</p>
                                <img src="img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                <h5>${e.goodCount}</h5>
                            </li>
                            <li class="reviewBar">
                                <div class="review">
                                    <img src="img/${e.image}" alt="写真" class="reviewImage">
                                    <p class="reviewTime">${e.createdAt}</p>
                                    <div class="review_button">
                                    <button class="update-button">
                                        <img src="img/point_delete.png">
                                        <span class="update-text">削除</span>
                                    </button>
                                    <button class="update-button">
                                        <img src="img/point_edit.png">
                                        <span class="update-text">編集</span>
                                    </button>
                                </div>
                                </div>
                                <h3 class="reviewTitle"> ${e.title}</h3>
                                <p class="reviewText">${e.review}</p>
                                <img src="img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                <h5>${e.goodCount}</h5>
                            </li>
                            <li class="reviewBar">
                                <div class="review">
                                    <img src="img/${e.image}" alt="写真" class="reviewImage">
                                    <p class="reviewTime">${e.createdAt}</p>
                                    <div class="review_button">
                                    <button class="update-button">
                                        <img src="img/point_delete.png">
                                        <span class="update-text">削除</span>
                                    </button>
                                    <button class="update-button">
                                        <img src="img/point_edit.png">
                                        <span class="update-text">編集</span>
                                    </button>
                                </div>
                                </div>
                                <h3 class="reviewTitle">${e.title}</h3>
                                <p class="reviewText">${e.review}</p>
                                <img src="img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                <h5>${e.goodCount}</h5>
                            </li>
                        </c:forEach>
                    </ul>
                <!--/area--></div>
            </div>
          <!--wrapper--></div>
          <script>
            'use strict';

             // ---------------------------
             // ▼A：対象要素を得る
             // ---------------------------
             var tabs = document.getElementById('tab').getElementsByTagName('a');
             var pages = document.getElementById('tabbody').getElementsByClassName('area');

             // ---------------------------
             // ▼B：タブの切り替え処理
             // ---------------------------
             function changeTab() {
                 var targetid = this.getAttribute('href').substring(1);

                 // 対象のタブページだけを表示する
                 for (var i = 0; i < pages.length; i++) {
                     if (pages[i].id === targetid) {
                         pages[i].classList.add('selected');
                     } else {
                         pages[i].classList.remove('selected');
                     }
                 }

                 // クリックされたタブにselectedクラスを追加し、他のタブから削除する
                 for (var i = 0; i < tabs.length; i++) {
                     tabs[i].classList.remove('selected');
                 }
                 this.classList.add('selected');

                 // ページ遷移しないようにfalseを返す
                 return false;
             }

             // ---------------------------
             // ▼C：すべてのタブに対して、クリック時にchangeTab関数が実行されるよう指定する
             // ---------------------------
             for (var i = 0; i < tabs.length; i++) {
                 tabs[i].onclick = changeTab;
             }

             // ---------------------------
             // ▼D：最初は先頭のタブを選択しておく
             // ---------------------------
             tabs[0].classList.add('selected');

         </script>
    </body>
	<footer>
		<a href=#top><span class="gotop"></span></a>
		<p class="copyright">&copy; WAC</p>
	</footer>
</html>