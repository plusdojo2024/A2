<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
            <title>ホーム|レコレコ</title>
            <link rel="stylesheet" href="common.css">
            <link rel="stylesheet" href="home.css">
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
                    <div class="co">
                    	<li><a href=""><img src="image/login1.png" width="75px" height="75px" name="icon" alt="アイコン">
                        	<ul class="dropdown-menu">
                            	<li><a href="/A2/MyPageServlet">マイページ</a></li>
                            	<li><a href="/A2/userManageServlet">ユーザ管理</a></li>
                            	<li><a href="/A2/LoginServlet">ログアウト</a></li>
                        	</ul>
                    		</a>
                		</li>
                	</div>
                </ul>
            </nav>
        </header>
        <body>
        <main>
            <form class="ranking">
                <h2><a href=""><img src="/A2/img/button_good2.png"  class="ok" alt="ハート"></a>いいねランキング</h2>
                <div class="table-wrapper">
                    <table class="table">
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking1.png" class="good" alt="good">
                                    <img src="/A2/img/icon_default.png"  class="icon" alt="アイコン">
                                    <p>rekoreko さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking2.png" class="good" alt="good">
                                    <img src="/A2/img/icon_default.png"  class="icon" alt="アイコン">
                                    <p>レコ さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking3.png" class="good" alt="good">
                                    <img src="/A2/img/icon_default.png"  class="icon" alt="アイコン">
                                    <p>れこれこ さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking4.png" class="good" alt="good">
                                    <img src="/A2/img/icon_default.png"  class="icon" alt="アイコン">
                                    <p>ReCo さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking5.png" class="good" alt="good">
                                    <img src="/A2/img/icon_default.png"  class="icon" alt="アイコン">
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
                                        <img src="/A2/img/content_hagaren.jpg" class="timeline1" alt="timeline">
                                        <img src="/A2/img/icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>鋼の錬金術師</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="/A2/img/content_hh_anime.jpg" class="timeline1" alt="timeline">
                                        <img src="/A2/img/icon_default.png"  class="icon1" alt="アイコン">
                                        <p>樋口 さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート">
                                </div>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="/A2/img/content_hh_comic.jpg" class="timeline1" alt="timeline">
                                        <img src="/A2/img/icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="/A2/img/content_hagaren.jpg" class="timeline1" alt="timeline">
                                        <img src="/A2/img/icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>鋼の錬金術師</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート">
                                </div>
                            </td>
                        </tr> <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="/A2/img/content_hh_anime.jpg" class="timeline1" alt="timeline">
                                        <img src="/A2/img/icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="/A2/img/content_hh_comic.jpg" class="timeline1" alt="timeline">
                                        <img src="/A2/img/icon_default.png"  class="icon1" alt="アイコン">
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4>おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </main>
    </body>
</html>