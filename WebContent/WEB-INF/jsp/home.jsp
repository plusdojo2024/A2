<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    HttpSession session = request.getSession();
    User loginUser = (User) session.getAttribute("loginUser");
%>
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
                            <li><a href=""><img src="<%= loginUser.getIcon() %>" class="icon-img" name="icon" alt="アイコン"><span class="user-name"><%= loginUser.getUserName() %></span>
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
            <c:forEach var="e" items="${rankingTopFive}" >
                <h2><a href=""><img src="/A2/img/button_good2.png"  class="ok" alt="ハート"></a>いいねランキング</h2>
                <div class="table-wrapper">
                    <table class="table">
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking1.png" class="good" alt="good">
                                    <img src="${e.icon}"  class="icon" alt="アイコン">
                                    <p>${e.userName} さん</p>
                                </div>
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking2.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>レコ さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking3.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>れこれこ さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking4.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>ReCo さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking5.png" class="good" alt="good">
                                    <img src="icon_default.png"  class="icon" alt="アイコン">
                                    <p>樋口 さん</p>
                                </div>
                            </td>
                        </tr>
                        -->
                    </table>
                </div>
            </form>
            </c:forEach>
            <c:forEach var="e" items="${timeline}" >
            <form class="ranking">
                <h2><a href=""><img src="/A2/img/point_timeline.png"  class="ok"  alt="時計"></a>タイムライン</h2>
                <div class="table-wrapper">
                    <table class="table">
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="${e.image }" class="timeline1" alt="timeline">
                                        <img src="${e.icon }"  class="icon1" alt="アイコン">
                                        <p>${e.userName } さん</p>
                                        <p>${e.createdAt } 投稿</p>
                                    </div>
                                    <h3>${e.title }</h3>
                                    <h4 class="truncate">${e.review }</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                    <h5>${e.goodCount }</h5>
                                </div>
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <td>
                                <div class="review">
                                    <div class="timeline">
                                        <img src="content_hh_anime.jpg" class="timeline1" alt="timeline">
                                        <img src="icon_default.png"  class="icon1" alt="アイコン" >
                                        <p>樋口 さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4 class="truncate">おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
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
                                    <h4 class="truncate">おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
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
                                    <h4 class="truncate">おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
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
                                        <p>rekoreko さん</p>
                                        <p>06/06 23:35 投稿</p>
                                    </div>
                                    <h3>HUNTER×HUNTER</h3>
                                    <h4 class="truncate">おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
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
                                    <h4 class="truncate">おもろい！おもろい！おもろい！おもろい！</h4>
                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                    <h5>123</h5>
                                </div>
                            </td>
                        </tr>
                         -->
                    </table>
                </div>
            </form>
            </c:forEach>
        </main>
        <footer>
            <a href=#top><span class="gotop"></span></a>
            <p class="copyright">&copy; WAC</p>
        </footer>
        <script>
            // h4要素のテキストを制限して省略する関数
            const truncateText = (element, maxLength) => {
                let text = element.textContent;
                if (text.length > maxLength) {
                    element.textContent = text.slice(0, maxLength) + '…';
                }
            };

            // h4要素を持つ要素を取得して処理する
            document.querySelectorAll('h4.truncate').forEach(h4 => {
                truncateText(h4, 20); // 20文字まで表示し、それ以降を省略する
            });

            // ハートの画像をトグルする関数
            function toggleHeart(element) {
                if (element.src.includes('/A2/img/button_good1.png')) {
                    element.src = '/A2/img/button_good2.png';
                    // ハートをプラス1する
                    incrementHeart(element.nextElementSibling);
                } else {
                    element.src = '/A2/img/button_good1.png';
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
        </script>
    </body>
</html>