<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ホーム|レコレコ</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/searchResult.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
                        <li><a href=""><img src="img/${loginUser.icon}" class="icon-img" name="icon" alt="アイコン"><span class="user-name">${loginUser.userName}</span>
                			<input type="hidden" id="userId" value="${loginUser.userId}">
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

<body>
    <div class="title">
        <h2>検索結果一覧</h2>
    </div>
    <div class="scrollable-table">
        <c:forEach var="c" items="${contentsList}">

			        <table class = "table">
			            <tr>
			                	<div class="result">
				                    <div class="result-item">
					                     <form name="form${c.contentsId}" action="/A2/ContentsDetailServlet" method="get">
			        						<a href="javascript:form${c.contentsId}.submit()" >
						                    	<input type="hidden" id="contentsId" name="id" value="${c.contentsId}">
						                        <img src="img/${c.image}" alt="作品の写真" class="content-img">
						                        <div class="result-info">
						                            <span class="content-title"><strong>${c.title}</strong></span><br>
						                            <span>${c.genre} ${c.year}</span>
						                        </div>
					                        </a>
		        						</form>

				                        <div class="result-form">
				                            <button type="button" name="collection" id="collectionBtn" onclick="goAjaxCollection()">
				                            	<input type="hidden" id="cBtnValue" value="1">
				                                <img src="img/point_plus.png" alt="追加の画像">
				                                <span>コレクションに追加</span>
				                            </button><br>
				                            <button type="button" name="wishlist" id="wishlistBtn" onclick="goAjaxWishlist()">
				                            	<input type="hidden" id="wBtnValue" value="1">
				                                <img src="img/point_plus.png" alt="追加の画像">
				                                <span>ウィッシュリストに追加</span>
				                            </button>
				                        </div>
			                    	</div>
			                    </div>
			    		</tr>
			        </table>

        </c:forEach>
    </div>

<footer class="footer">
	<a href=#top><span class="gotop"></span></a>
	<p class="copyright">&copy; WAC</p>
</footer>
<script>
//コレクション・ウィッシュリストに追加のAjax-----------------
function goAjaxCollection() {

        //値を取得してくる
        let status = 1;
        let contentsId = document.getElementById('contentsId').value;
        let life = document.getElementById('cBtnValue').value;


        //{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
        let postData = { data1: status, data2: contentsId, data3: life }

        //非同期通信始めるよ
        $.ajaxSetup({ scriptCharset: 'utf-8' });
        $.ajax({
            //どのサーブレットに送るか
            //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
            url: '/A2/ApiMyContentsServlet',
            //どのメソッドを使用するか
            type: "POST",
            //受け取るデータのタイプ
            dataType: "json",
            //何をサーブレットに飛ばすか（変数を記述）
            data: postData,
            //この下の２行はとりあえず書いてる（書かなくても大丈夫？）
            processDate: false,
            timeStamp: new Date().getTime()
            //非同期通信が成功したときの処理
        }).done(function (data) {
            //成功した場合
                toggleCollection();
        })
            //非同期通信が失敗したときの処理
            .fail(function () {
                //失敗した場合はなにもしない
            });
    }


    function goAjaxWishlist() {

        //値を取得してくる
        let status = 0;
        let contentsId = document.getElementById('contentsId').value;
        let life = document.getElementById('wBtnValue').value;


        //{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
        let postData = { data1: status, data2: contentsId, data3: life }

        //非同期通信始めるよ
        $.ajaxSetup({ scriptCharset: 'utf-8' });
        $.ajax({
            //どのサーブレットに送るか
            //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
            url: '/A2/ApiMyContentsServlet',
            //どのメソッドを使用するか
            type: "POST",
            //受け取るデータのタイプ
            dataType: "json",
            //何をサーブレットに飛ばすか（変数を記述）
            data: postData,
            //この下の２行はとりあえず書いてる（書かなくても大丈夫？）
            processDate: false,
            timeStamp: new Date().getTime()
            //非同期通信が成功したときの処理
        }).done(function (data) {
            //成功した場合
            toggleWishlist();
        })
            //非同期通信が失敗したときの処理
            .fail(function () {
                //失敗した場合はなにもしない
            });
    }





    function toggleCollection() {
        var collectionButton = document.getElementById('collectionBtn');
            if (collectionButton.innerText.includes('コレクションに追加')) {
                collectionButton.innerHTML = '<input type="hidden" id="cBtnValue" value="0"><img src="img/point_delete.png" alt="削除の画像"> コレクションから削除';
                collectionButton.style.backgroundColor = '#ccc'; // 背景色をグレーに変更
            } else {
                collectionButton.innerHTML = '<input type="hidden" id="cBtnValue" value="1"><img src="img/point_plus.png" alt="追加の画像"> コレクションに追加';
                collectionButton.style.backgroundColor = ''; // デフォルトに戻す
            }
    }


    function toggleWishlist() {
        var wishlistButton = document.getElementById('wishlistBtn');
        if (wishlistButton.innerText.includes('ウィッシュリストに追加')) {
            wishlistButton.innerHTML = '<input type="hidden" id="wBtnValue" value="0"><img src="img/point_delete.png" alt="削除の画像"> <span style="font-size: 95%;">ウィッシュリストから削除</span>';
            wishlistButton.style.backgroundColor = '#ccc'; // 背景色をグレーに変更
        } else {
            wishlistButton.innerHTML = '<input type="hidden" id="wBtnValue" value="1"><img src="img/point_plus.png" alt="追加の画像"> ウィッシュリストに追加';
            wishlistButton.style.backgroundColor = ''; // デフォルトに戻す
        }
    }
</script>
</body>
</html>