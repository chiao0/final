<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>商品總頁</title>
    <link rel="stylesheet" href="all.goods.css">

       <!--計數器-->
       <script>
        window.onload = function() {
            // 在頁面載入完成後，執行此JavaScript 代碼
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // 將伺服器回傳的數字插入到頁面中
                    document.getElementById("counter").innerHTML = xhr.responseText;
                }
            };
            xhr.open("GET", "counter.jsp", true);
            xhr.send();
        };
    </script>
    
</head>
  <body>
    <header>
      <a href="#">
        <img src="./assets/image/search.png" width="30px" height="30px"/></a>
      <a href="buy.car.html">
        <img src="./assets/image/shopping.png" width="30px" height="30px"/></a>
        <a href="t.html">
        <img src="./assets/image/member.png" width="30px" height="30px"/></a>
    </header>

    <nav>
      <a href="index.html">首頁</a>
      <a href="aboutus.html">關於我們</a>
      <a href="desk.html">商品總覽</a>
	  
    </nav>

    <div class="ad">
      
      <img src="./assets/image/one.png" alt="Ad Image">
    </div>

    <nav>
      <a href="desk.jsp">書桌</a>
      <a href="chair.jsp">椅子</a>
      <a href="cabinet.jsp">櫃子</a>
      <a href="sofa.jsp">沙發</a>
    </nav>

    <main>
      <article>
        
        <div class="container">
          <hr><h2 class="title">書桌</h2>
          <h4 class="tagline">Desk</h4><hr>    
        </article>
		
		 <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    String url = "jdbc:mysql://localhost:3306/sofabed?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
                    String user = "root";
                    String password = "1234";

                    Connection con = DriverManager.getConnection(url, user, password);

                    if (con.isClosed()) {
                        out.println("連線建立失敗！");
                    } else {
                        con.createStatement().execute("USE `sofabed`");

                        String sql = "SELECT `id`, `imgstyle`, `src`, `productname` FROM `new product` WHERE `id` BETWEEN 6 AND 10";
                        ResultSet rs = con.createStatement().executeQuery(sql);

                        while (rs.next()) {
                            String id = rs.getString("id");
                            String imgStyle = rs.getString("imgstyle");
                            String src = rs.getString("src");
                            String productName = rs.getString("productname");

                            // Print product details
                            out.println("<section class='card'>");
                            out.println("<a href='goods.html'>");
                            out.println("<h2>" + productName + "</h2>");
                            out.println("<img src='" + src + "' alt='" + productName + "' style='border-radius: 20%; width: 500px; height: auto;' />");
                            out.println("<p>點擊獲取詳細信息</p>");
                            out.println("</a>");
                            out.println("</section>");

                            
                        }

                        rs.close();
                        con.createStatement().close();
                        con.close();
                    }
                } catch (SQLException sExec) {
                    out.println("SQL錯誤" + sExec.toString());
                } catch (ClassNotFoundException err) {
                    out.println("class錯誤" + err.toString());
                }
            %>
			
   </main>
    <div class="clearfix"></div>

    

    <footer>
      瀏覽人數：<span id="counter"></span>
    <h5>Copyrgiht @ 2023 All rights reserved</h5>
    </footer>
	
	
  </body>
</html>