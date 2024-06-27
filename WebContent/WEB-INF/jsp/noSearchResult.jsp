<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meat charset="UTF-8">
            <title>検索結果|レコレコ</title>
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
    <div class="title">
        <h2>検索結果一覧</h2>
    </div>

    <div class="scrollable-table">
        <table class = "no-result-table">
            <p class="noSearch">
                <strong>一致するコンテンツがありません。
                        <a href="#" id="openModalBtnC">コンテンツの新規登録はこちら</a>
                </strong>
            </p>
        </table>
    </div>

    <!--モーダル-->
    <div id="content-regist-modal1" class="content-regist-modal">
        <div class="modal-content">
            <!--閉じるボタン-->
            <span class="close" onclick="closeModal('content-regist-modal1')">&times;</span>
            <p class="modal-title">コンテンツ新規登録</p>
            <table>
                <tr>
                    <td>
                        <input type="text" id="content-title" name="content-title" maxlength="50" placeholder="コンテンツタイトル（50文字以内）">
                    </td>
                </tr>
                <tr>
                <tr>
                    <td>
                        <input type="text" id="content-title-ruby" name="content-title-ruby" maxlength="50" placeholder="フリガナ">
                    </td>
                </tr>
                    <td>
                        <div class="review-img">
                            <img src="img/default_book.jpg"  id="preview" alt="アイコン" width="180px" height="200px">
                            <input type="file" name="upload" accept="image/*" onchange="previewImage(event)" id="image"><br>
                        </div>
                        <button class="delete-button" onclick="deleteItem()">
                            <img src="img/point_delete.png" class="delete-icon" alt="ゴミ箱"><span class="delete-text">削除</span>
                        </button>
                    </td>
                </tr>
                <div class="detail-select">
                    <tr>
                    <td>
                            <p class="detail-items">ジャンル</p>
                    </td>
                    <td>
                            <select name="detail-genre-select" id="detail-genre-select">
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
                    </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="detail-items">公開年</p>
                        </td>
                        <td>
                            <select name="detail-year-select" id="detail-year-select">
                                <option value="2024">2024</option>
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                                <option value="2018">2018</option>
                                <option value="2017">2017</option>
                                <option value="2016">2016</option>
                                <option value="2015">2015</option>
                                <option value="2014">2014</option>
                                <option value="2013">2013</option>
                                <option value="2012">2012</option>
                                <option value="2011">2011</option>
                                <option value="2010">2010</option>
                                <option value="2009">2009</option>
                                <option value="2008">2008</option>
                                <option value="2007">2007</option>
                                <option value="2006">2006</option>
                                <option value="2005">2005</option>
                                <option value="2004">2004</option>
                                <option value="2003">2003</option>
                                <option value="2002">2002</option>
                                <option value="2001">2001</option>
                                <option value="2000">2000</option>
                                <option value="1999">1999</option>
                                <option value="1998">1998</option>
                                <option value="1997">1997</option>
                                <option value="1996">1996</option>
                                <option value="1995">1995</option>
                                <option value="1994">1994</option>
                                <option value="1993">1993</option>
                                <option value="1992">1992</option>
                                <option value="1991">1991</option>
                                <option value="1990">1990</option>
                                <option value="1989">1989</option>
                                <option value="1988">1988</option>
                                <option value="1987">1987</option>
                                <option value="1986">1986</option>
                                <option value="1985">1985</option>
                                <option value="1984">1984</option>
                                <option value="1983">1983</option>
                                <option value="1982">1982</option>
                                <option value="1981">1981</option>
                                <option value="1980">1980</option>
                                <option value="1979">1979</option>
                                <option value="1978">1978</option>
                                <option value="1977">1977</option>
                                <option value="1976">1976</option>
                                <option value="1975">1975</option>
                                <option value="1974">1974</option>
                                <option value="1973">1973</option>
                                <option value="1972">1972</option>
                                <option value="1971">1971</option>
                                <option value="1970">1970</option>
                                <option value="1969">1969</option>
                                <option value="1968">1968</option>
                                <option value="1967">1967</option>
                                <option value="1966">1966</option>
                                <option value="1965">1965</option>
                                <option value="1964">1964</option>
                                <option value="1963">1963</option>
                                <option value="1962">1962</option>
                                <option value="1961">1961</option>
                                <option value="1960">1960</option>
                                <option value="1959">1959</option>
                                <option value="1958">1958</option>
                                <option value="1957">1957</option>
                                <option value="1956">1956</option>
                                <option value="1955">1955</option>
                                <option value="1954">1954</option>
                                <option value="1953">1953</option>
                                <option value="1952">1952</option>
                                <option value="1951">1951</option>
                                <option value="1950">1950</option>
                                <option value="before">それ以前</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="detail-items">製作者</p>
                        </td>
                        <td>
                            <input type="text" id="detail-creator-input" name="detail-creator-input" maxlength="50" placeholder="著者、制作会社など">
                        </td>
                    </tr>
                </div>
                    <tr>
                        <td>
                        <button class="btn" onclick="registerAjax()">登録</button>
                        </td>
                    </tr>
            </table>
        </div>
    </div>

    <!-- 成功画面のモーダル -->
    <div id="content-regist-modal2" class="content-regist-modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('content-regist-modal2')">&times;</span>
            <p class="true-text">コンテンツを登録しました。</p>
        </div>
    </div>
</body>

<footer class="footer">
	<a href=#top><span class="gotop"></span></a>
	<p class="copyright">&copy; WAC</p>
</footer>

<script>
    // モーダルを開くボタンを取得
    var openModalBtnC = document.getElementById("openModalBtnC");

    // モーダルを開く関数
    openModalBtnC.onclick = function() {
        openModal('content-regist-modal1');
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
        closeModal('content-regist-modal1');
        openModal('content-regist-modal2');
    }

    // モーダルの外側がクリックされたときに閉じる処理
    window.onclick = function(event) {
        var modal1 = document.getElementById('content-regist-modal1');
        var modal2 = document.getElementById('content-regist-modal2');
        if (event.target == modal1) {
            closeModal('content-regist-modal1');
        }
        if (event.target == modal2) {
            closeModal('content-regist-modal2');
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
    var contentTitle = document.getElementById('content-title');
    limitTextInput(contentTitle, 50);

    // レビュータイトルのフリガナの文字数制限を設定
    var contentTitleRuby = document.getElementById('content-title-ruby');
    limitTextInput(contentTitleRuby, 50);

    // レビュー本文の文字数制限を設定
    var detailCreatorInput = document.getElementById('detail-creator-input');
    limitTextInput(detailCreatorInput, 50);

    //登録Ajax
    function registerAjax() {

        //値を取得してくる
        let title = document.getElementById('content-title').value;
        let ruby = document.getElementById('content-title-ruby').value;
        let image = document.getElementById('image');
        let genre = document.getElementById('detail-genre-select').value;
        let year = document.getElementById('detail-year-select').value;
        let creater = document.getElementById('detail-creator-input').value;

        let imageName = image.value.replace("C:\\fakepath\\", "");


        //画像が選択されていた場合、別のAjaxで送る
          /* if(image.value){ */
          	//非同期で画像ファイルアップロードを行う
  	        	//画像ファイルを取得し、FormDataに入れる
  	        	/* var fd = new FormData();
  	        	fd.append("img", image.files[0]);

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
    		} */

        //{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
        let postData = { data1: title, data2: ruby, data3: imageName, data4: genre, data5: year, data6: creater}

        //非同期通信始めるよ
        $.ajaxSetup({ scriptCharset: 'utf-8' });
        $.ajax({
            //どのサーブレットに送るか
            //ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
            url: '/A2/ApiContentsRegistServlet',
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
        	var textForm = document.getElementById("content-title");
      		  textForm.value = '';
      		var textForm = document.getElementById("content-title-ruby");
      		  textForm.value = '';
      		var textForm = document.getElementById("image");
    		  textForm.value = '';
    		var textForm = document.getElementById("detail-genre-select");
      		  textForm.value = '';
      		var textForm = document.getElementById("detail-year-select");
    		  textForm.value = '';
    		var textForm = document.getElementById("detail-creator-input");
      		  textForm.value = '';

      		openSecondModal();
      	//非同期通信が失敗したときの処理
        }).fail(function () {
                //失敗した場合はなにもしない
            });
        }
</script>
</html>