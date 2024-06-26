<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>コンテンツ詳細|レコレコ</title>
    <link rel="stylesheet" href="css/contentsDetail.css">
    <link rel="stylesheet" href="css/common.css">
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
    <!--コンテンツ情報--------------------------------------->
    <div class="content-info">
        <img src="img/${contents.image}" name="content-img" alt="写真">
        <div class="column">
            <h2 name="content-title">${contents.title}</h2>
            <input type="hidden" id="contentsId" value="${contents.contentsId}">
            <h3>${contents.genre}</h3>
            <h3>${contents.year}</h3>
            <h3>${contents.creator}</h3>
        </div>

        <nav class="bt">
            <button type="button" name="submit" id="openModalBtn">
                <img src="img/point_chat.png" alt="チャットの画像">
                ランダムチャットを開始
            </button>
            <button type="button" name="submit" id="collectionBtn" onclick="goAjaxCollection()">
            	<input type="hidden" id="cBtnValue" value="1">
                <img src="img/point_plus.png" alt="追加の画像">
                コレクションに追加
            </button>
            <button type="button" name="submit" id="wishlistBtn" onclick="goAjaxWishlist()">
            	<input type="hidden" id="wBtnValue" value="1">
                <img src="img/point_plus.png" alt="追加の画像">
                ウィッシュリストに追加
            </button>
        </nav>
    </div>

    <!--タブ------------------------------------------------>
    <div class="wrapper">
        <ul id="tab">
            <li><a href="#myReview" class="tab-link" data-target="myReview">自分のレビュー</a></li>
            <li><a href="#otherReview" class="tab-link" data-target="otherReview">他ユーザのレビュー</a></li>
        </ul>

        <div id="tabbody">
            <div id="myReview" class="tab-content">
                <select name="sort" class="select">　<!--並び替えボタン-->
                    <option value="sort">並び替え</option>
                    <option value="fromNew">新しい順</option>
                    <option value="fromOld">古い順</option>
                </select>

                <ul>
                    <c:forEach var="e" items="${myReviewList}">
                        <li class="reviewBar">
                            <div class="review">
                                <img src="img/${e.image}" class="review-img" alt="写真">
                                <p class="review-time">${e.createdAt}</p>
                                <div class="review-button">
                                    <button class="button" onclick="goAjaxDelete()">
                                        <img src="img/point_delete.png">
                                        <span class="button-text">削除</span>
                                    </button>
                                    <button class="button" id="openModalBtnE">
                                        <img src="img/point_edit.png">
                                        <span class="button-text">編集</span>
                                    </button>
                                </div>
                            </div>
                            <h3 class="review-title" id="title" value="${e.title}">${e.title}</h3>
                            <p class="review-text">${e.review}</p>
                            <div class="good">
                                <img src="img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                <h4>${e.goodCount}</h4>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div><!--area(myReview)-->

            <div id="otherReview" class="tab-content">
                <select name="sort" class="select">
                    <option value="sort">並び替え</option>
                    <option value="fromNew">新しい順</option>
                    <option value="fromOld">古い順</option>
                </select>
                <ul>
                    <c:forEach var="e" items="${otherReviewList}">
                        <li class="reviewBar">
                            <div class="review">
                                <img src="img/${e.image}" class="review-img" alt="写真">
                                <div class="users-info">
                                     <form name="form${e.userIdWriter}" action="/A2/OtherMyPageServlet" method="get">
                                      <a href="javascript:form${e.userIdWriter}.submit()" >
                                         <input type="hidden" name="id" value="${e.userIdWriter}">
                                          <img src="img/${e.icon}" alt="アイコン写真">
                                      </a>
                                    </form>
                                    <span class="users-name">${e.userName}</span>
                                </div>
                                <p class="review-time">${e.createdAt}</p>
                            </div>
                            <h3 class="review-title" id="title" value="${e.title}">${e.title}</h3>
                            <p class="review-text">${e.review}</p>
                            <div class="good">
                                <img src="img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                <h4>${e.goodCount}</h4>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div><!--area(otherReview)-->
        </div><!--tabbody-->
    </div><!--wrapper-->

    <div class="floating-button"><!--レビュー新規登録ボタン-->
        <img src="img/button_review.png" id="openModalBtnR" alt="レビュー新規登録">
    </div>

    <!-- レビュー新規登録画面のモーダル --------------------->
    <div id="modal-review-regist" class="modal-review-regist">
        <div class="modal-content">
            <!--閉じるボタン-->
            <span class="close" onclick="closeModal('modal-review-regist')">&times;</span>
            <p class="modal-title">レビュー投稿</p>
            <table>
                <tr>
                    <td>
                        <input type="text" id="review-title" name="review-title" maxlength="50" placeholder="レビュータイトル（50文字）">
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="review-img">
                            <img src="img/icon_default.png"  id="preview" alt="アイコン" width="180px" height="200px">
                            <input type="file" name="upload" accept="image/*" onchange="previewImage(event)"><br>
                        </div>
                        <button class="delete-button" onclick="deleteItem()">
                            <img src="img/point_delete.png" class="delete-icon" alt="ゴミ箱"><span class="delete-text">削除</span>
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea id="review-detail" maxlength="500" rows="5" placeholder="レビュー本文（500文字以内）" required></textarea>
                     </td>
                </tr>
                <tr>
                     <td>
                    <button class="btn" onclick="submitReview()">投稿</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!--レビュー編集のモーダル----------------------------------->
    <div id="review-edit-modal1" class="review-edit-modal">
        <div class="modal-content">
            <!--閉じるボタン-->
            <span class="close" onclick="closeModal('review-edit-modal1')">&times;</span>
            <p class="modal-title">レビュー編集</p>
            <table>
                <tr>
                    <td>
                        <input type="text" id="review-title" name="review-title" maxlength="50" placeholder="レビュータイトル（50文字）" value="HUNTER×HUNTER最新巻">
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="review-img">
                            <img src="img/content_hh_comic.jpg"  id="preview" alt="アイコン" width="180px" height="200px">
                            <input type="file" name="upload" accept="image/*" onchange="previewImage(event)"><br>
                        </div>
                        <button class="delete-button" onclick="deleteItem()">
                            <img src="img/point_delete.png" class="delete-icon" alt="ゴミ箱"><span class="delete-text">削除</span>
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea id="review-detail" maxlength="500" rows="5" placeholder="レビュー本文（500文字以内）"　required>オモロイ！オモロイ！</textarea>
                     </td>
                </tr>
                <tr>
                     <td>
                    <button class="btn" onclick="openSecondModal()">更新</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!-- 成功画面のモーダル -->
    <div id="review-edit-modal2" class="review-edit-modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('review-edit-modal2')">&times;</span>
            <p class="true-text">レビューを更新しました。</p>
        </div>
    </div>


</body>

<footer>
    <a href=#top><span class="gotop"></span></a>
    <p class="copyright">&copy; WAC</p>
</footer>

<!-- モーダル -->
			<div id="modal1" class="modal">
			  <div class="modal-content">
			    <span class="close" onclick="closeModal('modal1')">&times;</span>
			        <div class="user-info">
			        		<form action="/A2/OtherMyPageServlet" method="get">
							  <button class="chat-icon-button">
							     <input type="hidden" name="id" value="${e.userIdWriter}">
							     <img src="img/icon_default.png" class="chat-icon" id="chat-icon">
							  </button>
							</form>
			            <span class="chat-name" id="chat-name"></span>
			        </div>
			        <div id="chat-container">
			          <div id="messages" class="messages"></div>
			            <div class="input-area">
			                <button class="button0" id="button0">
			                    <img src="img/point_plus_chat.png" id="point" class="point" alt="point">
			                    <form enctype="multipart/form-data"><input type="file" name="upload" id="file-button" accept="image/*" onchange="previewImage(event)"></form>
			                </button>
			              	<input type="text" id="message" placeholder="メッセージを入力(500字以内)" onkeydown="if(event.key === 'Enter') sendMessage()">
			              	<button  class="chat-submit" onclick="sendMessage()">送信</button>
			            </div>
			          </div>
			      </div>
			    </div>

<script>
    //タブの切り替え------------------------------------------------------
    document.addEventListener('DOMContentLoaded', function () {
        const tabs = document.querySelectorAll('.tab-link');
        const contents = document.querySelectorAll('.tab-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', function (event) {
                event.preventDefault();

                tabs.forEach(item => item.classList.remove('selected'));
                contents.forEach(item => item.classList.remove('active'));

                tab.classList.add('selected');
                const target = document.getElementById(tab.dataset.target);
                target.classList.add('active');
            });
        });

        tabs[0].classList.add('selected');
        contents[0].classList.add('active');
    });



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

    //レビュー新規登録モーダル-----------------------------------
    // モーダルを開くボタンを取得
    var openModalBtnR = document.getElementById("openModalBtnR");

    // モーダルを開く関数
    openModalBtnR.onclick = function() {
        openModal('modal-review-regist');
    }

    // モーダルを開く関数
    function openModal(modalId) {
        var modal = document.getElementById(modalId);
        modal.style.display = "block";
    }

    // モーダルを閉じる関数
    function closeModal(modalId) {
        var modal = document.getElementById(modalId);
        modal.style.display = "none";
    }

    // モーダルの外側がクリックされたときに閉じる処理
    window.onclick = function(event) {
        var modal1 = document.getElementById('modal-review-regist');
        if (event.target == modal) {
            closeModal('modal-review-regist');
        }
    }

    //レビュー編集モーダル-------------------------------------
    // モーダルを開くボタンを取得
    var openModalBtnE = document.getElementById("openModalBtnE");

    // モーダルを開く関数
    openModalBtnE.onclick = function() {
        openModal('review-edit-modal1');
    }

    // モーダルを開く関数
    function openModal(modalId) {
        var modal = document.getElementById(modalId);
        modal.style.display = "block";
    }

    // モーダルを閉じる関数
    function closeModal(modalId) {
        var modal = document.getElementById(modalId);
        modal.style.display = "none";
    }

    // 次のモーダルを開く関数
    function openSecondModal() {
        closeModal('review-edit-modal1');
        openModal('review-edit-modal2');
    }

    // モーダルの外側がクリックされたときに閉じる処理
    window.onclick = function(event) {
        var modal1 = document.getElementById('review-edit-modal1');
        var modal2 = document.getElementById('review-edit-modal2');
        if (event.target == modal1) {
            closeModal('review-edit-modal1');
        }
        if (event.target == modal2) {
            closeModal('review-edit-modal2');
        }
    }


    //画像プレビュー------------------------------------------------------
    // ファイル選択時に呼び出される関数
    function previewImage(event) {
        // 選択されたファイルを取得
        var selectedFile = event.target.files[0];
        // ファイルが選択されている場合
        if (selectedFile) {
            // FileReaderオブジェクトを作成
            var reader = new FileReader();
            // ファイルの読み込みが完了した時の処理を定義
            reader.onload = function(event) {
                // プレビュー画像のsrc属性に選択されたファイルの内容を設定
                document.getElementById('preview').src = event.target.result;
            };
            // ファイルの読み込みを実行
            reader.readAsDataURL(selectedFile);
        } else {
            // ファイルが選択されていない場合は元のアイコンを表示
            document.getElementById('preview').src = "img/icon_default.png";
        }
    }

    // 削除ボタンをクリックしたときに呼び出される関数
    function deleteItem(event) {
        // 元のアイコン画像のパスを設定
        document.getElementById('preview').src = "img/icon_default.png";
        // ファイル選択のinput要素もリセットする場合は次の行を追加
        document.querySelector('input[type="file"]').value = null;
         // ページの再読み込みを防ぐ
         event.preventDefault();
    }

    // 文字数制限を設定する関数
    function limitTextInput(element, maxLength) {
        element.addEventListener('input', function(event) {
            if (element.value.length > maxLength) {
                element.value = element.value.substring(0, maxLength);
                event.preventDefault();
            } else {
                // Do nothing
            }
        });
    }

    // レビュータイトルの文字数制限を設定
    var reviewTitle = document.getElementById('review-title');
    limitTextInput(reviewTitle, 50);

    // レビュー本文の文字数制限を設定
    var reviewDetail = document.getElementById('review-detail');
    limitTextInput(reviewDetail, 500);


    //ハートの色変換JavaScript----------------------------------------------
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
        var reviewTextElements = document.getElementsByClassName('review-text');

        for (var i = 0; i < reviewTextElements.length; i++) {
            var text = reviewTextElements[i].textContent.trim();
            var maxLength = 180; // 最大文字数の設定
            var trimmedText = text.length > maxLength ? text.slice(0, maxLength) + '...' : text;
            reviewTextElements[i].textContent = trimmedText;
        }
    });



  //チャット関連------------------------------------------------------

  		//モーダル関連------------------------------------------------
       	  //モーダルを開くボタンを取得
       		var openModalBtn = document.getElementById("openModalBtn");

       		// モーダルを開く関数
       		openModalBtn.onclick = function() {
       		    openModal('modal1');
       		 	openChat();
       		}

       		// モーダルを開く関数
       		function openModal(modalId) {
       		    var modal = document.getElementById(modalId);
       		    modal.style.display = "block";
       		}

       		// モーダルを閉じる関数
       		function closeModal(modalId) {
       		    var modal = document.getElementById(modalId);
       		    modal.style.display = "none";
       		}

       		// モーダルの外側がクリックされたときに閉じる処理
       		window.onclick = function(event) {
       		    var modal1 = document.getElementById('modal1');
       		    var modal2 = document.getElementById('modal2');
       		    if (event.target == modal1) {
       		        closeModal('modal1');
       		    }
       		}

    var socket;
    var userId = document.getElementById("userId").value;
    var user_id_speaker = userId; // 送信者のユーザーIDを文字列にする
    var user_id_listener = 0; // 受信者のユーザーIDを文字列にする

  	//ChatopenServletから、チャットのための情報を取得する関数
    function openChat(){
        let status = "ランダム";
        let otherUserId = document.getElementById("contentsId").value;

        let postData = {data1:status, data2:otherUserId}

        $.ajaxSetup({scriptCharset:'utf-8'});
            $.ajax({
                //どのサーブレットに送るか
                //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
                url: '/A2/ApiChatOpenServlet',
                //どのメソッドを使用するか
                type:"POST",
                //受け取るデータのタイプ
                dataType:"json",
                //何をサーブレットに飛ばすか（変数を記述）
                data: postData,
                //この下の２行はとりあえず書いてる（書かなくても大丈夫？）
                processDate:false,
                timeStamp: new Date().getTime()
               //非同期通信が成功したときの処理
            }).done(function(data) {
                //成功した場合、チャットの接続を開始する
                //相手のユーザ名とアイコンを取得する
                let userName = data.userName;
                let userIcon = data.icon;

                //ユーザ名とアイコンを表示する
                document.getElementById("chat-name").innerText = userName + "さん";
                const target = document.querySelector("#chat-icon");
                const url = "img/" + userIcon;
                target.src = url;

                //自分と相手のユーザ名を設定する
                var user_id_speaker = userId; // 送信者のユーザーIDを文字列にする
                user_id_listener = data.userId; // 受信者のユーザーIDを文字列にする

                //接続を開始する
                connect();
              })
               //非同期通信が失敗したときの処理
              .fail(function() {
                //失敗した場合
                alert("error");
            });

    }


  	//接続を開始する関数
    function connect() {
        // WebSocketを初期化するで
        socket = new WebSocket("ws://" + window.location.host + "/A2/chat");

        // 接続が開いたときの処理やで
        socket.onopen = function() {
            console.log("WebSocket connection opened");
            document.getElementById("messages").innerHTML += "<div class='system-message'>チャットサーバーに接続しました。</div>";
            // ユーザーIDをサーバーに送信するで
            var initMessage = JSON.stringify({ type: 'init', user_id_speaker: user_id_speaker, user_id_listener: user_id_listener });
            socket.send(initMessage);
        };

        // メッセージを受信したときの処理やで
        socket.onmessage = function(event) {
            console.log("Received message: ", event.data);
            var data = event.data.split(" ");
            var createdAt = data.slice(0, 2).join(" ");
            var speaker = data[2];
            var listener = data[3];
            var message = data.slice(4).join(" ");
            var messageClass = (speaker === user_id_speaker) ? "sent-message" : "received-message";

            //messageの中身が画像ファイルだった場合、imgタグで表示する
            var messageElement;

            if(/.jpg$/.test(message) || /.jpeg$/.test(message) || /.png$/.test(message) || /.gif$/.test(message)){
            	messageElement = "<div class='" + messageClass + "'><div class='message-time'>" + createdAt + "</div><img class='message-content' src='img/" + message + "'></div>";
            } else {
                messageElement = "<div class='" + messageClass + "'><div class='message-time'>" + createdAt + "</div><div class='message-content'>" + message + "</div></div>";
            }

            document.getElementById("messages").innerHTML += messageElement;
            document.getElementById("messages").scrollTop = document.getElementById("messages").scrollHeight;

            //表示したメッセージに既読をつける
            let postData = {"message":message}

            $.ajaxSetup({scriptCharset:'utf-8'});
            $.ajax({
                //どのサーブレットに送るか
                url: '/A2/ApiCheckServlet',
                //どのメソッドを使用するか
                type:"POST",
                //受け取るデータのタイプ
                dataType:"json",
                //何をサーブレットに飛ばすか（変数を記述）
                data: postData,
                //この下の２行はとりあえず書いてる（書かなくても大丈夫？）
                processDate:false,
                timeStamp: new Date().getTime()
               //非同期通信が成功したときの処理
            }).done(function(data) {
              })
               //非同期通信が失敗したときの処理
              .fail(function() {
              });
        };

        // 接続が閉じたときの処理やで
        socket.onclose = function() {
            console.log("WebSocket connection closed");
            document.getElementById("messages").innerHTML += "<div class='system-message'>チャットサーバーから切断されました。</div>";
        };

        // エラーが発生したときの処理やで
        socket.onerror = function(event) {
            console.error("WebSocket error: ", event);
            document.getElementById("messages").innerHTML += "<div class='system-message'>エラー: " + event.data + "</div>";
        };
    }

    // メッセージを送信する関数やで
    function sendMessage() {
    	var message;
        var text = document.getElementById("message").value;
        var img = document.getElementById("file-button");

      //画像が選択されていた場合、messageには画像のファイルパスが入る
        if(img.value){
        	//非同期で画像ファイルアップロードを行う
	        	//画像ファイルを取得し、FormDataに入れる
	        	var fd = new FormData();
	        	fd.append("img", img.files[0]);

	        	$.ajaxSetup({scriptCharset:'utf-8'});
	            $.ajax({
	                //どのサーブレットに送るか
	                url: '/socketSample/ApiFileUploadServlet',
	                //どのメソッドを使用するか
	                type:"POST",
	                //受け取るデータのタイプ
	                dataType:"json",
	                //何をサーブレットに飛ばすか（変数を記述）
	                data: fd,
	                //この下の２行はとりあえず書いてる（書かなくても大丈夫？）
	                processDate:false,
	                timeStamp: new Date().getTime()
	               //非同期通信が成功したときの処理
	            }).done(function(data) {
	              })
	               //非同期通信が失敗したときの処理
	              .fail(function() {
	              });

        	//ファイル名の書式を整え、messageに入れる
        	var name = img.value.replace("C:\\fakepath\\", "");
		    message = name;

        } else {
        	//画像が選択されていなかった場合はテキストボックスの中身が入る
        	message = text;
        }

        var now = new Date();
        var formattedTime = now.getFullYear() + "-" +
                            ('0' + (now.getMonth() + 1)).slice(-2) + "-" +
                            ('0' + now.getDate()).slice(-2) + " " +
                            ('0' + now.getHours()).slice(-2) + ":" +
                            ('0' + now.getMinutes()).slice(-2) + ":" +
                            ('0' + now.getSeconds()).slice(-2);
        // メッセージを送信するで
        var messageToSend = formattedTime + " " + user_id_speaker + " " + user_id_listener + " " + message;
        socket.send(messageToSend);
        document.getElementById("message").value = "";
    }



	//画像アップロードボタンが押されたときに行われる処理
	document.getElementById("button0").addEventListener("click", () => {
		var point = document.getElementById('point');
		if (point.src.includes('point_plus_chat.png')){
			document.getElementById("file-button").click();
		} else {
			deleteItem();
		}
	});

	 // 削除ボタンをクリックしたときに呼び出される関数
	 function deleteItem() {
	    // ファイル選択のinput要素もリセットする場合は次の行を追加
	    document.getElementById('file-button').value = null;
	    // ページの再読み込みを防ぐ
	    event.preventDefault();
	  //ファイルを削除したらアップロードボタンに入れ替わる
	    var point = document.getElementById('point');
	    toggleButton(point);
	}

	// ファイル選択時に呼び出される関数
	function previewImage(event) {
	    // 選択されたファイルを取得
	    var selectedFile = event.target.files[0];
	    // ファイルが選択されている場合
	    if (selectedFile) {
	        // FileReaderオブジェクトを作成
	        var reader = new FileReader();
	        // ファイルの読み込みが完了した時の処理を定義
	        reader.onload = function(event) {
	        };
	        // ファイルの読み込みを実行
	        reader.readAsDataURL(selectedFile);
	    }
	    //ファイルを読み込んだら、削除ボタンに入れ替わる
	    var point = document.getElementById('point');
	    toggleButton(point);
	}

	 //画像アップロードボタンを削除ボタンに入れ替える
	 function toggleButton(element) {
                if (element.src.includes('point_plus_chat.png')) {
                    element.src = 'img/point_delete.png';
                } else {
                    element.src = 'img/point_plus_chat.png';
                }
     }

</script>

</html>