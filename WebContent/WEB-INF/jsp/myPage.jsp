<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
            <title>マイページ|レコレコ</title>
            <link rel="stylesheet" href="css/myPage.css">
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
                                <option value="すべて">すべて</option>
                                <option value="映画">映画</option>
                                <option value="ドラマ">ドラマ</option>
                                <option value="アニメ">アニメ</option>
                                <option value="その他（映像）">その他（映像）</option>
                                <option value="小説">小説</option>
                                <option value="マンガ">マンガ</option>
                                <option value="その他（書籍）">その他（書籍）</option>
                                <option value="ゲーム">ゲーム</option>
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
                			<input type="hidden" id="loginUserId" value="${loginUser.userId}">
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
            <img src="img/${loginUser.icon}" alt="アイコン" class="icon">
            <div class="userInfo">
                <h2 class="userName">${loginUser.userName}</h2>
                <p class="achievements">
                    総レビュー件数　${loginUser.reviewCount}件<br><!--実際に動かすときに書く値のメモ-->
                    総いいね件数　${loginUser.allGoodCount}件<!--実際に動かすときに書く値のメモ-->
                </p>
            </div>
            <p class="introduction">
                ${loginUser.introduction}
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
                    <ul class="myContentsList">
                        <c:forEach var="e" items="${collection}">
	                            <li>
	                                <form name="form${e.contentsId}" action="/A2/ContentsDetailServlet" method="get" class="contents-form">
	                                    <button class="contents">
	                                        <input type="hidden" name="id" value="${e.contentsId}">
	                                        <img src="img/${e.image}" alt="コンテンツ画像" class="contentsImage"><br>
	                                        ${e.title}<br>
	                                        ${e.genre}
	                                    </button>
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
                                    <button class="update-button" id="openModalBtnE">
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
                    <ul class="myContentsList">
                        <c:forEach var="e" items="${wishList}">
	                            <li>
	                                <form  action="/A2/ContentsDetailServlet" method="get" class="contents-form">
	                                    <button type="submit" class="contents">
	                                        <input type="hidden" name="id" value="${e.contentsId}">
	                                        <img src="img/${e.image}" alt="コンテンツ画像" class="contentsImage"><br>
	                                        ${e.title}<br>
	                                        ${e.genre}
	                                    </button>
	                                </form>
	                            </li>
                        </c:forEach>
                    </ul>
                <!--/area--></div>
                <div id="favoriteList" class="area">
                    <ul>
                    	<div class="container">
                        	<c:forEach var="e" items="${favoriteUserList}" >
                                        <div class="good_user">
                                            <form name="form${e.userIdFavorite}" action="/A2/OtherMyPageServlet" method="get">
                                                <button>
                                                    <input type="hidden" name="id" value="${e.userIdFavorite}">
                                                    <div class="user">
                                                    <img src="img/${e.iconFavorite}" class="othericon">
                                                    <h3> ${e.userNameFavorite} さん</h3>
                                                	</div>
                                                </button>
                                            </form>
                                        </div>
                        	</c:forEach>
                        </div>
                    </ul>
                <!--/area--></div>
                <div id="chatList" class="area">
                    <ul>
                        <c:forEach var="e" items="${chatList}" >
                        	<button type="button" value="${e.userIdSpeaker}" onclick="openChatModal(this)">
	                            <li>
	                                <div class="chat-history">
	                                    <div class="chat">
		                                    <img src="img/${e.userIcon}" class="chat-history-icon">
		                                    <h3> ${e.userName} さん</h3>
		                                    <p class="talk">${e.talk}</p>
		                                    <span class="check-count">${e.check}</span>
	                                 	</div>
	                                  </div>
	                            </li>
	                         </button>
	                         <input type="hidden" value="${e.userIdSpeaker}">
                        </c:forEach>
                    </ul>
                <!--/area--></div>
            </div>
        <!--wrapper--></div>

    <!-- レビュー編集画面のモーダル -->
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
                        <textarea id="review-detail" maxlength="500" rows="5" placeholder="レビュー本文（500文字以内）" required>オモロイ！オモロイ！</textarea>
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

    <!-- チャットモーダル -->
    <!-- モーダル -->
			<div id="modal1" class="modal">
			  <div class="modal-content">
			    <span class="close" onclick="closeModal('modal1')">&times;</span>
			        <div class="user-info">
			        		<form action="/A2/OtherMyPageServlet" method="get">
							  <button class="chat-icon-button" id="chat-icon-button">
							     <input type="hidden" name="id" id="chat-id">
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

        // モーダルを開くボタンを取得
        var openModalBtn = document.getElementById("openModalBtnE");

        // モーダルを開く関数
        openModalBtn.onclick = function() {
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


      //チャットモーダル関連
     	  //モーダルを開くボタンを取得
     		/* var openModalBtn = document.getElementById("openModalBtn"); */

     		// モーダルを開く関数
       		function openChatModal(element){
    			// クリックされたボタンのidを取得
    			const id = element.value;

    			openModal('modal1');
       		 	openChat(id);

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
        function deleteItem() {
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
                }else{

                }
            });
        }

        // レビュータイトルの文字数制限を設定
        var reviewTitle = document.getElementById('review-title');
        limitTextInput(reviewTitle, 50);

        // レビュー本文の文字数制限を設定
        var reviewDetail = document.getElementById('review-detail');
        limitTextInput(reviewDetail, 500);


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

          //チャット関連のJavascript
            var socket;
            var userId = document.getElementById("loginUserId").value;
            var user_id_speaker = userId; // 送信者のユーザーIDを文字列にする
            var user_id_listener = 0; // 受信者のユーザーIDを文字列にする

          	//ChatopenServletから、チャットのための情報を取得する関数
            function openChat(id){
                let status = "指定";
                let otherUserId  = id;
                console.log(otherUserId);

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
                        document.getElementById("chat-id").value = data.userId;

                        //自分と相手のユーザ名を設定する
                        var userId = document.getElementById("loginUserId").value;
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
        	                url: '/A2/ApiFileUploadServlet',
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

    </script>
    </body>
	<footer>
		<a href=#top><span class="gotop"></span></a>
		<p class="copyright">&copy; WAC</p>
	</footer>
</html>