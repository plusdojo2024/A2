<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
            <title>ホーム|レコレコ</title>
            <link rel="stylesheet" type="text/css" href="css/searchResult.css">
    </head>
        <header>
            <nav class="nav">
                <ul>
                    <li>
                        <h1>レコレコ</h1>
                    </li>
                    <li>
                        <form action="" method="post">
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
                                <div class="resultphoto">
                                    <img src="${c.image}" alt="作品の写真" class="image">
                                </div>
                                <div class="resultinfo">
                                    <span class="contenttitle"><strong>${c.title}</strong></span><br>
                                    <span>${c.genre}　${c.year}

                                    </span>
                                </div>

                                <div class="reultform">
                                    <button type="button" class ="button "name="collection" value="コレクションに追加">
                                        <img src="image/point_plus.png" alt="追加の画像">
                                        コレクションに追加
                                    </button>
                                    <button type="button"  class="button1" name="wishlist" value="ウィッシュリストに追加">
                                        <img src="image/point_plus.png" alt="追加の画像">
                                        ウィッシュリストに追加
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="result-item">
                                <div class="resultphoto">
                                    <img src="${c.image}" alt="作品の写真" class="image">
                                </div>
                                <div class="resultinfo">
                                    <span class="contenttitle"><strong>${c.title}</strong></span><br>
                                    <span>${c.genre}　${c.year}</span>
                                </div>

                                <div class="reultform">
                                    <button type="button" class ="button "name="collection" value="コレクションに追加">
                                        <img src="image/point_plus.png" alt="追加の画像">
                                        コレクションに追加
                                    </button>
                                    <button type="button"  class="button1" name="wishlist" value="ウィッシュリストに追加">
                                        <img src="image/point_plus.png" alt="追加の画像">
                                        ウィッシュリストに追加
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="result-item">
                                <div class="resultphoto">
                                    <img src="${c.image}" alt="作品の写真" class="image">
                                </div>
                                <div class="resultinfo">
                                    <span class="contenttitle"><strong>${c.title}</strong></span><br>
                                    <span>${c.genre}　${c.year}</span>
                                </div>

                                <div class="reultform">
                                    <button type="button" class ="button "name="collection" value="コレクションに追加">
                                        <img src="image/point_plus.png" alt="追加の画像">
                                        コレクションに追加
                                    </button>
                                    <button type="button"  class="button1" name="wishlist" value="ウィッシュリストに追加">
                                        <img src="image/point_plus.png" alt="追加の画像">
                                        ウィッシュリストに追加
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                </c:forEach>
            </div>

    <footer class="footer">
		<a href=#top><span class="gotop"></span></a>
		<p class="copyright">&copy; WAC</p>
	</footer>
    </body>
</html>