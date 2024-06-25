<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>コンテンツ詳細|レコレコ</title>
    <link rel="stylesheet" href="css/contentsDetail.css">
    <link rel="stylesheet" href="css/common.css">
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
                    <li><a href=""><img src="img/icon_default.png" class="icon-img" name="icon" alt="アイコン"><span
                                class="user-name">recoreco</span>
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
    <!--コンテンツ情報--------------------------------------->
    <div class="content-info">
    <c:forEach var="e" items="${contents}">
        <img src="img/${e.image}" name="content-img" alt="写真">
        <div class="column">
            <h2 name="content-title">${e.title}</h2><input type="hidden" id="contentsId" value="${contentsId}">
            <h3>${e.genre}</h3>
            <h3>${e.year}</h3>
            <h3>${e.creator}</h3>
        </div>

        <nav class="bt">
            <button type="button" name="submit">
                <img src="img/point_chat.png" alt="チャットの画像">
                ランダムチャットを開始
            </button>
            <button type="button" name="submit" id="collectionBtn" value="1" onclick="goAjaxCollection()">
                <img src="img/point_plus.png" alt="追加の画像">
                コレクションに追加
            </button>
            <button type="button" name="submit" id="wishlistBtn" value="1" onclick="goAjaxWishlist()">
                <img src="img/point_plus.png" alt="追加の画像">
                ウィッシュリストに追加
            </button>
        </nav>
        </c:forEach>
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
                    <c:forEach var="e" items="${myReview}">
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
                            <h3 class="review-title" id="title" value="${title}">${e.title}</h3>
                            <p class="review-text">${e.review}</p>
                            <div class="good">
                                <img src="img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                <h4>${e.goodCount}</h4>
                            </div>
                        </li>
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
                            <h3 class="review-title" id="title" value="${title}">${e.title}</h3>
                            <p class="review-text">${e.review}</p>
                            <div class="good">
                                <img src="img/button_good1.png" class="heart" alt="ハート" onclick="toggleHeart(this)">
                                <h4>${e.goodCount}</h4>
                            </div>
                        </li>
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
                            <h3 class="review-title" id="title" value="${title}">${e.title}</h3>
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
                    <c:forEach var="e" items="${otherReview}">
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
                            <h3 class="review-title" id="title" value="${title}">${e.title}</h3>
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

</script>

</html>