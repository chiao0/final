<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Security Blanket</title>
    <link rel="stylesheet" href="./goods.css">
    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</head>
<body>
    <header>
        <a href="#">
            <img src="./assets/image/search.png" width="30px" height="30px"/>
        </a>
        <a href="buy.car.html">
            <img src="./assets/image/shopping.png" width="30px" height="30px"/>
        </a>
        <a href="member.html">
            <img src="./assets/image/member.png" width="30px" height="30px"/>
        </a>
    </header>
    
    <nav>
        <a href="index.html">首頁</a>
        <a href="aboutus.html">關於我們</a>
        <a href="desk.html">商品總覽</a>
    </nav>

    <!-- 商品圖片 -->
    <div class="slideshow-container">
        <!-- 商品圖片輪播部分，省略不重要的內容 -->
    </div>

    <!-- 商品基本資訊 -->
    <div class="card">
        <h1>貓抓皮雙人沙發</h1><br>
        <div class="price">NT$：1000</div><br>
        <div class="inventory">商品庫存：10</div>
        
        <div class="item1">
            <!-- 調整數量的按鈕 -->
            <input type="button" value="-" class="item_button" onclick="minus(0)">
            <input type="text" value="1" class="item_num">
            <input type="button" value="+"class="item_button" onclick="add(0)">
        </div>
        
        <!-- 加入購物車按鈕 -->
        <button value="加入購物車" class="addbutton">加入購物車</button>
    </div><br>

    <!-- 商品介紹 -->
    <div class="introduce">
        <h2>商品介紹</h2>
        <div class="features">
            <div>
                <ul>
                    <li>養寵物專用推薦</li>
                    <li>防水防塵</li>
                    <li>清潔簡易</li>
                    <li>特殊彈簧</li>
                </ul>
            </div>
            <div>尺寸:70*180*100公分</div>
        </div>
    </div>

    <hr align="center" width="1300px">

  <!-- 顧客輸入評論區 -->
  <p class="commenttxt">評論區</p><br>
  <div class="comment">
      <form action="comment.jsp" method="post">  
          <input id="user" type="text" name="user" placeholder="請輸入使用者名稱" class="username"><br>
          <!-- 評論內容輸入區域與傳送按鈕 -->
          <p>評論內容：</p><br>
          <textarea id="content" name="comment" placeholder="說點什麼..." maxlength="1000" class="content"></textarea><br>
          <button type="submit" class="sendbutton">送出</button>
      </form>
  </div>

  <!-- 評論展示區 -->
  <div class="commentarea">
      <!-- 包含 comment.jsp 的內容 -->
      <%@ include file="comment.jsp" %>
  </div>

    <script>
        // 調整數量的按鈕
        function minus(num) {
            var number = Number(document.getElementsByClassName("item_num")[num].value);
            if (number > 1) {
                number -= 1;
                document.getElementsByClassName("item_num")[num].value = number;
            } else {
                window.alert("商品數量不得少於1");
            }
        }

        function add(num) {
            var number = Number(document.getElementsByClassName("item_num")[num].value);
            if (number < 100) {
                number += 1;
                document.getElementsByClassName("item_num")[num].value = number;
            } else {
                window.alert("商品數量不得超過100");
            }
        }
    </script>

    <footer>
        瀏覽人數：1000人
        <h5>Copyrgiht @ 2023 All rights reserved</h5>
    </footer>
</body>
</html>
