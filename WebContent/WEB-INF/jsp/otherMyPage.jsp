<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
            <title>マイページ|レコレコ</title>
            <link rel="stylesheet" href="css/OtherMyPage.css">
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
    <body id="top">
        <!-- ユーザ情報 -->
        <div class="profile">
            <img src="img/icon_higuchi.png" alt="アイコン" class="icon">
            <div class="userInfo">
                <h2 class="userName">${otherUser.userName} さん</h2>
                <input type="hidden" id="userIdFavorite" value="${otherUser.userId}">
                <p class="achievements">
                    総レビュー件数　${otherUser.reviewCount}件<br>
                </p>
                <button type="button" name="favorite_add" class="bt" id="favorite_button" value="1" onclick="goAjax()">
                    <img src="img/point_favorite.png" alt="お気に入りユーザに追加の画像">
                    <span class="bt-text">お気に入りユーザに追加</span>
                </button>
                <button type="button" name="direct-chat" class="bt" id="openModalBtn">
                    <img src="img/point_chat.png" alt="チャットの画像">
                    <span class="bt-text">チャットをする</span>
                </button>
            </div>
            <p class="introduction">
                ${otherUser.introduction}
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
                                <img src="img/button_good1.png" class="heart" data-post-id="${e.reviewId}" alt="ハート" onclick="toggleHeart(this)">
                                <h5 class="goodCount">${e.goodCount}</h5>
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
                                <button type="button" onclick=good>
	                                <img src="img/button_good1.png" class="heart" id="heart" alt="ハート" value=${e.reviewId} onclick="goGood(this)">
	                                <input type="hidden" id="good" value=1>
	                                <h5 id="goodCount">${e.goodCount}</h5>
	                           </button>
                            </li>
                        </c:forEach>
                    </ul>
                <!--/area--></div>
            </div>
          <!--wrapper--></div>

          <!-- モーダル -->
			<div id="modal1" class="modal">
			  <div class="modal-content">
			    <span class="close" onclick="closeModal('modal1')">&times;</span>
			        <div class="user-info">
			        		<form action="/A2/OtherMyPageServlet" method="get">
							  <button>
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


           //お気に入りユーザ登録関連

           function goAjax(){

            //値を取得してくる
            let userIdFavorite = document.getElementById('userIdFavorite').value;
            let life = document.getElementById('favorite_button').value;


            //{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
            let postData = {data1:userIdFavorite,data2:life}

            //非同期通信始めるよ
            $.ajaxSetup({scriptCharset:'utf-8'});
            $.ajax({
                //どのサーブレットに送るか
                //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
                url: '/A2/ApiOtherMyPageServlet',
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
                //成功した場合は、ボタンが反転する（同時にお気に入り解除ボタンになる）
                if(data==="true"){
                	/* ボタンが反転する処理 */
                    favorite_user();
                } else {
                    //失敗した場合はなにもしない
                }
              })
               //非同期通信が失敗したときの処理
              .fail(function() {
                //失敗した場合はなにもしない
              });
        }

		//ボタンを反転させるための関数
        function favorite_user() {
            var favoriteButton = document.getElementById('favorite_button');
            if (favoriteButton.innerText.includes('お気に入りユーザに追加')) {
            	favoriteButton.innerHTML = '<img src="img/point_delete.png" alt="削除の画像"> お気に入りユーザを解除';
            	favoriteButton.style.backgroundColor = '#ccc'; // 背景色をグレーに変更
            	favoriteButton.value = 0;
            } else {
            	favoriteButton.innerHTML = '<img src="img/point_favorite.png" alt="追加の画像"> お気に入りユーザに追加';
                favoriteButton.style.backgroundColor = ''; // デフォルトに戻す
                favoriteButton.value = 1;
            }
        }

	//いいね関連
	document.addEventListener("DOMContentLoaded", function() {
	    const goodButtons = document.querySelectorAll(".heart");

		    goodButtons.forEach(function(button) {
		        button.addEventListener("click", function() {
		            const goodId = this.getAttribute("data-post-id");
		            const GoodCount = this.nextElementSibling;






		        });
		    });
		});
		function goGood(element){

		//値を取得してくる
		let heart = document.getElementById('heart').value;
		let good = document.getElementById('good').value;
		let reviewId = document.getElementById('reviewId').value;
		let goodCount = document.getElementById('counter').value;

		//文字列を数値データに変換する
		goodCount = Number(goodCount);

		//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
		let postData = {data1:good,data2:reviewId}

		//非同期通信始めるよ
		$.ajaxSetup({scriptCharset:'utf-8'});
		$.ajax({
			//どのサーブレットに送るか
			//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
			url: '/A2/ApiGoodServlet',
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
			//成功した場合は、いいねのカウントを+1して、ハートが赤く変わる（同時にいいね削除ボタンになる）
			if(data==="true"){
				toggleHeart(heart);
			} else {
				//失敗した場合はなにもしない
			}
		  })
		   //非同期通信が失敗したときの処理
		  .fail(function() {
			//失敗した場合はなにもしない
		  });
	}

      //ハートが押された時の処理
        // ハートの画像をトグルする関数
        function toggleHeart(element) {
                if (element.src.includes('button_good1.png')) {
                    element.src = 'img/button_good2.png';
            		let good = document.getElementById('good').value = 0;
                    // ハートをプラス1する
                    incrementHeart(element.nextElementSibling);
                } else {
                    element.src = 'img/button_good1.png';
            		let good = document.getElementById('good').value = 1;
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


           //モーダル関連
       	  //モーダルを開くボタンを取得
       		var openModalBtn = document.getElementById("openModalBtn");

       		// モーダルを開く関数
       		openModalBtn.onclick = function() {
       		    openModal('modal1');
       		}

       		// モーダルを開く関数
       		function openModal(modalId) {
       		    var modal = document.getElementById(modalId);
       		    modal.style.display = "block";
       		 	openChat();
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


         //チャット関連のJavascript
           var socket;
           var userId = document.getElementById("userId").value;
           var user_id_speaker = userId; // 送信者のユーザーIDを文字列にする
           var user_id_listener; // 受信者のユーザーIDを文字列にする

         	//ChatopenServletから、チャットのための情報を取得する関数
           function openChat(){
               let status = "指定";
               let otherUserId = document.getElementById("userIdFavorite").value;

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
                       let userName = data.otherUser.userName;
                       let userIcon = data.otherUser.icon;

                       //ユーザ名とアイコンを表示する
                       document.getElementById("chat-name").innerText = userName + "さん";
                       const target = document.querySelector("#chat-icon");
                       const url = "img/" + userIcon;
                       target.src = url;

                       //自分と相手のユーザ名を設定する
                       var user_id_speaker = userId; // 送信者のユーザーIDを文字列にする
                       var user_id_listener = data.otherUser.userId; // 受信者のユーザーIDを文字列にする

                       //接続を開始する
                       connect();
                     })
                      //非同期通信が失敗したときの処理
                     .fail(function() {
                       //失敗した場合はなにもしない
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
    </body>
	<footer>
		<a href=#top><span class="gotop"></span></a>
		<p class="copyright">&copy; WAC</p>
	</footer>
</html>