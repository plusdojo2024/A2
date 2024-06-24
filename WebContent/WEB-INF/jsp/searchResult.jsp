<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ホーム|レコレコ</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/searchResult.css">
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

<body>
    <div class="title">
        <h2>検索結果一覧</h2>
    </div>
    <div class="scrollable-table">
        <c:forEach var="c" items="${contentsList}">
        <table class = "table">
            <tr>
                <td>
                    <div class="result-item">
                        <img src="${c.image}" alt="作品の写真" class="content-img">
                        <div class="result-info">
                            <span class="content-title"><strong>${c.title}</strong></span><br>
                            <span>${c.genre} ${c.year}</span>
                        </div>

                        <div class="result-form">
                            <button type="button" name="collection" value="コレクションに追加">
                                <img src="img/point_plus.png" alt="追加の画像">
                                <span>コレクションに追加</span>
                            </button><br>
                            <button type="button" name="wishlist" value="ウィッシュリストに追加">
                                <img src="img/point_plus.png" alt="追加の画像">
                                <span>ウィッシュリストに追加</span>
                            </button>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="result-item">
                        <img src="${c.image}" alt="作品の写真" class="content-img">
                        <div class="result-info">
                            <span class="content-title"><strong>${c.title}</strong></span><br>
                            <span>${c.genre} ${c.year}</span>
                        </div>

                        <div class="result-form">
                            <button type="button" name="collection" value="コレクションに追加">
                                <img src="img/point_plus.png" alt="追加の画像">
                                <span>コレクションに追加</span>
                            </button><br>
                            <button type="button" name="wishlist" value="ウィッシュリストに追加">
                                <img src="img/point_plus.png" alt="追加の画像">
                                <span>ウィッシュリストに追加</span>
                            </button>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="result-item">
                        <img src="${c.image}" alt="作品の写真" class="content-img">
                        <div class="result-info">
                            <span class="content-title"><strong>${c.title}</strong></span><br>
                            <span>${c.genre} ${c.year}</span>
                        </div>

                        <div class="result-form">
                            <button type="button" name="collection" value="コレクションに追加">
                                <img src="img/point_plus.png" alt="追加の画像">
                                <span>コレクションに追加</span>
                            </button><br>
                            <button type="button" name="wishlist" value="ウィッシュリストに追加">
                                <img src="img/point_plus.png" alt="追加の画像">
                                <span>ウィッシュリストに追加</span>
                            </button>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        </c:forEach>
    </div>
</body>

<footer class="footer">
	<a href=#top><span class="gotop"></span></a>
	<p class="copyright">&copy; WAC</p>
</footer>
</html>