<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <title>ホーム|レコレコ</title>
            <link rel="stylesheet" href="/A2/css/common.css">
            <link rel="stylesheet" href="/A2/css/home.css">
            <link rel="stylesheet" href="/A2/css/postmodal.css">
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
        <body>
        <main>
            <div class="ranking">
                <h2><a href=""><img src="/A2/img/button_good2.png"  class="ok" alt="ハート"></a>いいねランキング</h2>
                <div class="table-wrapper">
                    <table class="table">
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking1.png" class="good" alt="good">
                                    <form  action="/A2/OtherMyPageServlet" method="get">
	                                    <button>
	                                    	<img src=img/${r1.icon}  class="icon" alt="アイコン">
	                                    	<input type="hidden" name="id" value="${r1.userId}">
	                                    </button>
                                    </form>
                            <p>${r1.userName} さん</p>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking2.png" class="good" alt="good">
                                    <form  action="/A2/OtherMyPageServlet" method="get">
	                                    <button>
	                                    	<img src=img/${r2.icon}  class="icon" alt="アイコン">
	                                    	<input type="hidden" name="id" value="${r2.userId}">
	                                    </button>
                                    </form>
                                    <p>${r2.userName} さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking3.png" class="good" alt="good">
                                    <form  action="/A2/OtherMyPageServlet" method="get">
	                                    <button>
	                                    	<img src=img/${r3.icon}  class="icon" alt="アイコン">
	                                    	<input type="hidden" name="id" value="${r3.userId}">
	                                    </button>
                                    </form>
                                    <p>${r3.userName} さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking4.png" class="good" alt="good">
                                    <form  action="/A2/OtherMyPageServlet" method="get">
	                                    <button>
	                                    	<img src=img/${r4.icon}  class="icon" alt="アイコン">
	                                    	<input type="hidden" name="id" value="${r4.userId}">
	                                    </button>
                                    </form>
                                    <p>${r4.userName} さん</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="goodranking">
                                    <img src="/A2/img/ranking5.png" class="good" alt="good">
                                    <form  action="/A2/OtherMyPageServlet" method="get">
	                                    <button>
	                                    	<img src=img/${r5.icon}  class="icon" alt="アイコン">
	                                    	<input type="hidden" name="id" value="${r5.userId}">
	                                    </button>
                                    </form>
                                    <p>${r5.userName} さん</p>
                                </div>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
            <div class="ranking">
                <h2><a href=""><img src="/A2/img/point_timeline.png"  class="ok"  alt="時計"></a>タイムライン</h2>
                <div class="table-wrapper">
                	<div class="table">
	                    <table>
			                    <c:forEach var="e" items="${timeline}" >
			                        <tr>
			                        		<div class="review">
			                                    <div class="timeline">
			                                        <img src=img/${e.image} class="timeline1" alt="timeline">
			                                        <form  action="/A2/OtherMyPageServlet" method="get">
					                                    <button>
					                                    	<img src=img/${e.icon}  class="icon1" alt="アイコン">
					                                    	<input type="hidden" name="id" value="${e.userIdWriter}">
					                                    </button>
				                                    </form>
			                                        <p>${e.userName } さん</p>
			                                        <p>${e.createdAt } 投稿</p>
			                                    </div>
			                                    <h3>${e.title }</h3>
			                                    <h4 class="truncate">${e.review }</h4>
			                                    <img src="/A2/img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
			                                    <h5>${e.goodCount }</h5>
			                                </div>
			                        </tr>
								</c:forEach>
	                    </table>
	                </div>
                </div>
            </div>
        </main>

        <!-- モーダル -->
	    <!-- 最初のモーダル -->
	    <div id="modal1" class="modal">
	        <div class="modal-content">
	            <span class="close" onclick="closeModal('modal1')">&times;</span>
	            <p class="ppost">ポスト</p>
	            <div class="modalmain">
	            <br>
	            <input type="button"name="submit"  value="投函"onclick="openSecondModal()"></button><br>
	            <input type="button" name="submit" id="accept" value="受け取り"></button><br>
	            <input type="button" name="submit3" value="一覧"onclick="openSecondModal2()"></button>
	            </div>
	        </div>
	    </div>

	    <!-- 投函モーダル -->
	    <div id="modal2" class="modal">
	        <div class="modal-content">
	            <span class="close" onclick="closeModal('modal2')">&times;</span>
	            <p class="ppost">ポスト投函</p>
	            <div class="box1">
	                <input type="text" name="title" placeholder="タイトル(50字以内)" value="${title}" id="title"><br>
	                <textarea class="textbox" placeholder="この作品のおすすめポイントを書いてみましょう！(200文字以内)" value="${recommend}" id="recommend"></textarea><br>
	            </div>
	            <input type="button"name="submit5" value="戻る"onclick="openSecondModal3()"></button>
	            <input type="button"name="submit1" value="投函"onclick="goAjax()"></button>
	        </div>
	    </div>
	    <!-- 受け取りモーダル -->
	    <div id="modal3" class="modal">
	        <div class="modal-content">
	            <span class="close" onclick="closeModal('modal3')">&times;</span>
	            <p class="ppost">ポスト受け取り</p>
	            <div class="box1">
	                <h2 class="receive-title" name="title" id="r-title"></h2><br>
	                <p class="receive-recommend" id="r-recommend"></p><br>
	            </div>
	            <input type="button"name="submit5" value="戻る"onclick="openSecondModal4()">
	            <button class="interestBtn1" id="receive-interestBtn" onclick="interestAjax(this)">気になる！</button>
	            <input type=hidden id="receive-interest">
	        </div>
	    </div>

	    <!-- 一覧モーダル -->
	    <div id="modal4" class="modal">
	        <div class="modal1-content">
	            <span class="close" onclick="closeModal('modal4')">&times;</span>
	            <p class="ppost">一覧ページ</p>
	            <div class="box2">
	            <p id="tabcontrol">
	                <a href="#tabpage1">
	                    投函した作品
	                </a>
	                <a href="#tabpage2">
	                    受け取った作品
	                </a>
	            </p>
	            <div id="tabbody">
	                <div id="tabpage1" class="area selected">
	                	<div id="post-container"></div>
	                </div>

	                <div id="tabpage2" class="area ">
	                    <div id="receive-container"></div>
	                </div>


	                </div>
	            </div>
	            <input type="button"name="submit5" value="戻る"onclick="openSecondModal5()"></button>
	        </div>
	    </div>

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
        <!-- tabjs -->
        <script type="text/javascript">
            // ---------------------------
            // ▼A：対象要素を得る
            // ---------------------------
            var tabs = document.getElementById('tabcontrol').getElementsByTagName('a');
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
        </script>

        <script>
        //投函Ajax
        function goAjax() {

        //値を取得してくる
        let status = 0;
        let title = document.getElementById('title').value;
        let recommend = document.getElementById('recommend').value;



        //{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
        let postData = { data1: status, data2: title, data3: recommend }

        //非同期通信始めるよ
        $.ajaxSetup({ scriptCharset: 'utf-8' });
        $.ajax({
            //どのサーブレットに送るか
            //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
            url: '/A2/ApiPostServlet',
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
        	var textForm = document.getElementById("title");
      		  textForm.value = '';
      		var textForm = document.getElementById("recommend");
      		  textForm.value = '';
        })
            //非同期通信が失敗したときの処理
            .fail(function () {
                //失敗した場合はなにもしない
            });
        }

        //受け取りAjax

        let acceptBtn = document.getElementById('accept');

        acceptBtn.addEventListener('click', function() {
        	closeModal('modal1');
            openModal('modal3');
            acceptanceAjax();
            });



        function acceptanceAjax() {


	        //値を取得してくる
	        let status = 1;
	        //{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
	        let postData = { data1: status }


	        //非同期通信始めるよ
	        $.ajaxSetup({ scriptCharset: 'utf-8' });
	        $.ajax({

	            //どのサーブレットに送るか
	            //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
	            url: '/A2/ApiPostServlet',
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
	        	var title = data["title"];
	        	var recommend = data["recommend"];
	        	var postId = data["postId"];
	        		document.getElementById('r-title').innerHTML = title;
	        		document.getElementById('r-recommend').innerHTML = recommend;
	        		document.getElementById('receive-interest').value = postId;
	        })
	            //非同期通信が失敗したときの処理
	            .fail(function () {
	                //失敗した場合

	            });
	        }

        //一覧Ajax
        function listAjax() {

        //値を取得してくる
        let status =2;
        //{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
        let postData = { data1: status }

        //非同期通信始めるよ
        $.ajaxSetup({ scriptCharset: 'utf-8' });
        $.ajax({
            //どのサーブレットに送るか
            //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
            url: '/A2/ApiPostServlet',
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
            //成功した場合は、リストを表示する
        	var postList = data["postList"];
        	var receiveList = data["receiveList"];
        	postList.forEach(function(value){
	        		if(value.interest==='1'){
	        			document.getElementById('post-container').innerHTML += '<div class="contents" id="p-contents"><h2 class="title">'+ value.title +'</h2><p class="maintext">'+ value.recommend + '</p><button type="button" name="interestBtn2" id="interestBtn" style="background-color: #35AFDB;" onclick="interestAjax(this)">気になった！</button><input type=hidden value="' + value.postId + '"></div>';
	        		} else{
	        			document.getElementById('post-container').innerHTML += '<div class="contents" id="p-contents"><h2 class="title">'+ value.title + '</h2><p class="maintext">' + value.recommend + '</p></div>';
	        		}

        	});
        	receiveList.forEach(function(value){
        		if(value.myInterest==='1'){
        			document.getElementById('receive-container').innerHTML += '<div class="contents" id="r-contents"><h2 class="title">'+value.title+'</h2><p class="maintext">'+value.recommend +'</p><button type="button" name="interestBtn2" id="interestBtn" style="background-color: #35AFDB;" onclick="interestAjax(this)">気になった！</button><input type=hidden value="' + value.postId + '"></div>';
        		} else{
        			document.getElementById('receive-container').innerHTML += '<div class="contents" id="r-contents"><h2 class="title">'+value.title+'</h2><p class="maintext">' + value.recommend + '</p><button type="button" name="interestBtn2" id="interestBtn" style="background-color: #ccc;" onclick="interestAjax(this)">気になる！</button><input type=hidden value="' + value.postId + '"></div>';
        		}
        	});
        })
            //非同期通信が失敗したときの処理
            .fail(function () {
                //失敗した場合はなにもしない
            });
        }


        //気になるAjax
        function interestAjax(element) {

        //値を取得してくる
        let interest = 0;
        if(element.innerText.includes('気になる！')){
        	interest = 1;
        }
        let postId = element.nextElementSibling.value;
        //{変数名：中に入れるもの}みたいに書いて、複数の値をinterestData変数に格納
        let interestData = { data1: interest, data2: postId }

        //非同期通信始めるよ
        $.ajaxSetup({ scriptCharset: 'utf-8' });
        $.ajax({
            //どのサーブレットに送るか
            //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
            url: '/A2/ApiInterestServlet',
            //どのメソッドを使用するか
            type: "POST",
            //受け取るデータのタイプ
            dataType: "json",
            //何をサーブレットに飛ばすか（変数を記述）
            data: interestData,
            //この下の２行はとりあえず書いてる（書かなくても大丈夫？）
            processDate: false,
            timeStamp: new Date().getTime()
            //非同期通信が成功したときの処理
        }).done(function (data) {
            //成功した場合は、確認ダイアログを表示する
            togglebutton(element);
        })
            //非同期通信が失敗したときの処理
            .fail(function () {
                //失敗した場合はなにもしない
            });
        }

        //反転
        function togglebutton(element) {
                if (element.innerText.includes('気になる！')) {
                	element.innerHTML = '気になった！';
                	element.style.backgroundColor = '#35AFDB'; // 背景色を変更
                } else {
                	element.innerHTML = '気になる！';
                	element.style.backgroundColor = '#ccc'; // デフォルトに戻す
                }
            }

        </script>
                <!-- modaljs -->
        <script>
            // モーダルを開くボタンを取得
            var openModalBtn = document.getElementById("openModalBtn");

            // モーダルを開く関数
            openModalBtn.onclick = function() {
                openModal('modal1');
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

            // 投函モーダルを開く関数
            function openSecondModal() {
                closeModal('modal1');
                openModal('modal2');
            }
            // 受け取りモーダルを開く関数
            function openSecondModal1() {
            	closeModal('modal1');
                openModal('modal3');
                acceptanceAjax();
            }
            // 一覧モーダルを開く関数
            function openSecondModal2() {
                closeModal('modal1');
                openModal('modal4');
                listAjax();
            }
            // 戻るボタン
            function openSecondModal3() {
                closeModal('modal2');
                openModal('modal1');
            }

            function openSecondModal4() {
                closeModal('modal3');
                openModal('modal1');
            }

            function openSecondModal5() {
                closeModal('modal4');
                openModal('modal1');
            }

            // モーダルの外側がクリックされたときに閉じる処理
            window.onclick = function(event) {
                var modal1 = document.getElementById('modal1');
                var modal2 = document.getElementById('modal2');
                if (event.target == modal1) {
                    closeModal('modal1');
                }
                if (event.target == modal2) {
                    closeModal('modal2');
                }
                if (event.target == modal3) {
                    closeModal('modal3');
                }
                if (event.target == modal4) {
                    closeModal('modal4');
                }
            }
        </script>
    </body>
</html>