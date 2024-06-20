<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
            <title>ホーム|レコレコ</title>
            <link rel="stylesheet" href="/A2/css/common.css">
            <link rel="stylesheet" href="/A2/css/home.css">
    </head>
        <header>
            <nav class="nav">
                <ul>
                    <li>
                        <h1><a href="/A2/HomeServlet">レコレコ</a></h1>
                    </li>
                    <li>
                        <form action="/A2/SearchServlet"  class="search-form" method="post">
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
                                <input type="image" src="/A2/img/button_search.png" class="search-button" alt="虫眼鏡">
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
        <main>
            <form class="ranking">
                <h2><a href=""><img src="button_good2.png"  class="ok" alt="ハート"></a>いいねランキング</h2>
                <div class="table-wrapper">
                    <table class="table">
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="ranking1.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>rekoreko さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="ranking2.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>レコ さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="ranking3.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>れこれこ さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="ranking4.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>ReCo さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="ranking5.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>樋口 さん</p>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            <form class="ranking">
                <h2><a href=""><img src="point_timeline.png"  class="ok"  alt="時計"></a>タイムライン</h2>
                <div class="table-wrapper">
                    <table class="table">
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="content_hagaren.jpg" class="timeline1" alt="timeline">
                                        <img src="icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>鋼の錬金術師</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="button_good1.png" class="heart" alt="ハート">
                                    <h5>123</h5>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="content_hh_anime.jpg" class="timeline1" alt="timeline">
                                        <img src="icon_default.png"  class="icon1" alt="アイコン">
                                        <p>樋口 さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="button_good1.png" class="heart" alt="ハート">
                                    <h5>123</h5>
                                </div>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="content_hh_comic.jpg" class="timeline1" alt="timeline">
                                        <img src="icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="button_good1.png" class="heart" alt="ハート">
                                    <h5>123</h5>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="content_hagaren.jpg" class="timeline1" alt="timeline">
                                        <img src="icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>鋼の錬金術師</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="button_good1.png" class="heart" alt="ハート">
                                    <h5>123</h5>
                                </div>
                            </td>
                        </tr> <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="content_hh_anime.jpg" class="timeline1" alt="timeline">
                                        <img src="icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="button_good1.png" class="heart" alt="ハート">
                                    <h5>123</h5>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="content_hh_comic.jpg" class="timeline1" alt="timeline">
                                        <img src="icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="button_good1.png" class="heart" alt="ハート">
                                    <h5>123</h5>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </main>
        <footer>
            <a href=#top><span class="gotop"></span></a>
            <p class="copyright">&copy; WAC</p>
        </footer>
    </body>
</html>