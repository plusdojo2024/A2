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
            <img src="img/icon_default.png" alt="アイコン" class="icon">
            <div class="userInfo">
                <h2 class="userName">recoreco</h2>
                <p class="achievements">
                    総レビュー件数　${reviewCount}件<br><!--実際に動かすときに書く値のメモ-->
                    総いいね件数　${allGoodCount}件<!--実際に動かすときに書く値のメモ-->
                </p>
            </div>
            <p class="introduction">
                ${introduction}
            </p>
        </div>

        <!-- タブ -->
        <div class="wrapper">
            <ul id="tab">
              <li><a href="#collectionList">コレクション</a></li>
              <li><a href="#reviewList">レビュー一覧</a></li>
              <li><a href="#wishList">ウィッシュリスト</a></li>
              <li><a href="#favoriteList">お気に入りユーザ</a></li>
              <li><a href="#chatList">チャット</a></li>
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
                <div id="wishList" class="area">
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
                                <form name="form${e.contentsId}" action="/A2/ContentsDetailServlet" method="get">
                                    <a href="javascript:form${e.contents_id}.submit()" class="contents">
                                        <input type="hidden" name="contens_id" value="${e.contentsId}">
                                        <img src="img/${e.image}" alt="コンテンツ画像" class="contentsImage"><br>
                                        ${e.title}<br>
                                        ${e.genre}
                                    </a>
                                </form>
                            </li>
                        </c:forEach>
                    </ul>
                <!--/area--></div>
                <div id="favoriteList" class="area">
                    <ul>
                        <c:forEach var="e" items="${favoriteList}" >
                            <table>
                                <tr>
                                    <td>
                                        <div class="good_user">
                                            <form name="form${e.user_id_favorite}" action="/A2/OtherMyPageServlet" method="get">
                                                <a href="javascript:form${e.user_id_favorite}.submit()" class="">
                                                    <input type="hidden" name="user_id_favorite" value="${e.user_id_favorite}">
                                                    <div class="user">
                                                        <img src="img/${e.iconFavorite}" class="othericon">
                                                        <h3> ${e.userNameFavorite} さん</h3>
                                                    </div>
                                                </a>
                                            </form>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="good_user">
                                            <form name="form${e.user_id_favorite}" action="/A2/OtherMyPageServlet" method="get">
                                                <a href="javascript:form${e.user_id_favorite}.submit()" class="">
                                                    <input type="hidden" name="user_id_favorite" value="${e.user_id_favorite}">
                                                    <div class="user">
                                                    <img src="img/${e.iconFavorite}" class="othericon">
                                                    <h3> ${e.userNameFavorite} さん</h3>
                                                </div>
                                                </a>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="good_user">
                                            <form name="form${e.user_id_favorite}" action="/A2/OtherMyPageServlet" method="get">
                                                <a href="javascript:form${e.user_id_favorite}.submit()" class="">
                                                    <input type="hidden" name="user_id_favorite" value="${e.user_id_favorite}">
                                                    <div class="user">
                                                        <img src="img/${e.iconFavorite}" class="othericon">
                                                        <h3> ${e.userNameFavorite} さん</h3>
                                                    </div>
                                                </a>
                                            </form>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="good_user">
                                            <form name="form${e.user_id_favorite}" action="/A2/OtherMyPageServlet" method="get">
                                                <a href="javascript:form${e.user_id_favorite}.submit()" class="">
                                                    <input type="hidden" name="user_id_favorite" value="${e.user_id_favorite}">
                                                    <div class="user">
                                                        <img src="img/${e.iconFavorite}" class="othericon">
                                                        <h3> ${e.userNameFavorite}さん</h3>
                                                    </div>
                                                </a>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </c:forEach>
                    </ul>
                <!--/area--></div>
                <div id="chatList" class="area">
                    <ul>
                        <c:forEach var="e" items="${chatList}" >
                            <li>
                                <form name="form${e.user_id}" action="/A2/ChatServlet" method="get">
                                    <a href="javascript:form${e.user_id}.submit()" class="chat-history">
                                        <input type="hidden" name="user_id" value="${e.user_id}">
                                        <div class="chat">
                                        <img src="img/${e.icon}" class="chat-icon">
                                        <h3> ${e.userName} さん</h3>
                                        <p class="talk">${e.talk}</p>
                                        <span class="check-count">${e.check}</span>
                                    </div>
                                    </a>
                                </form>
                            </li>
                            <li>
                                <form name="form${e.user_id}" action="/A2/ChatServlet" method="get">
                                    <a href="javascript:form${e.user_id}.submit()" class="chat-history">
                                        <input type="hidden" name="user_id" value="${e.user_id}">
                                        <div class="chat">
                                        <img src="img/${e.icon}" class="chat-icon">
                                        <h3> ${e.userName} さん</h3>
                                        <p class="talk">${e.talk}</p>
                                        <span class="check-count">${e.check}</span>
                                    </div>
                                    </a>
                                </form>
                            </li>
                            <li>
                                <form name="form${e.user_id}" action="/A2/ChatServlet" method="get">
                                    <a href="javascript:form${e.user_id}.submit()" class="chat-history">
                                        <input type="hidden" name="user_id" value="${e.user_id}">
                                        <div class="chat">
                                        <img src="img/${e.icon}" class="chat-icon">
                                        <h3> ${e.userName} さん</h3>
                                        <p class="talk">${e.talk}</p>
                                        <span class="check-count">${e.check}</span>
                                    </div>
                                    </a>
                                </form>
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



        //ハートが押された時の処理
        // ハートの画像をトグルする関数
        function toggleHeart(element) {
                if (element.src.includes('button_good1.png')) {
                    element.src = 'img/button_good2.png';
                    // ハートをプラス1する
                    incrementHeart(element.nextElementSibling);
                } else {
                    element.src = 'img/button_good1.png';
                    // ハートをマイナス1する
                    decrementHeart(element.nextElementSibling);
                }
            }

            // ハート数を増やす関数
            function incrementHeart(element) {
                let currentCount = parseInt(element.textContent);
                element.textContent = currentCount + 1;
            }

            // ハート数を減らす関数
            function decrementHeart(element) {
                let currentCount = parseInt(element.textContent);
                element.textContent = currentCount - 1;
            }

            //レビュー文字が180字超えたら省略する
            document.addEventListener("DOMContentLoaded", function() {
                var reviewTextElements = document.getElementsByClassName('reviewText');

                for (var i = 0; i < reviewTextElements.length; i++) {
                    var text = reviewTextElements[i].textContent.trim();
                    var maxLength = 180; // 最大文字数の設定
                    var trimmedText = text.length > maxLength ? text.slice(0, maxLength) + '...' : text;
                    reviewTextElements[i].textContent = trimmedText;
                }
            });

    </script>
    </body>
	<footer>
		<a href=#top><span class="gotop"></span></a>
		<p class="copyright">&copy; WAC</p>
	</footer>
</html>