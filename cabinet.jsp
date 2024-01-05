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
    <link rel="stylesheet" href="./assets/css/all.goods.css">

   
<!-- CSS styles to center images and text -->
<style>
  .card {
      text-align: center;
      margin-top: 0px;
      margin-left: 150px;

  }

  .card img {
      display: block;
      border-radius: 20%;
      max-width: 400px;
      height: auto;
      margin: 0 auto;
      
  }
</style>
  
</head>
<body>
    <header>
        <nav>
            <ul class="drop-down-menu">
                <li><a href="index.html">首頁</a></li>
                <li><a href="aboutus.html">關於我們</a></li>
                <li>
                    <a href="desk.html">商品</a>
                    <ul>
                        <li><a href="desk.jsp">書桌</a></li>
                        <li><a href="chair.jsp">椅子</a></li>
                        <li><a href="cabinet.jsp">櫃子</a></li>
                        <li><a href="sofa.jsp">沙發</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div class="icon">
            <a href="buy.car.html">
                <img src="./assets/image/shopping.png" width="30px" height="30px"/>
            </a>
            <a href="t.html">
                <img src="./assets/image/member.png" width="30px" height="30px"/>
            </a>
        </div>

        <form action="search.jsp" method="get">
            <input id="search" type="text" name="search" placeholder="搜尋..." class="search">
            <input type="submit" value="搜索">
        </form>
    </header>


    <main>
      <article>
        
        <div class="container">
          <hr><h2 class="title">櫃子</h2>
          <h4 class="tagline">Cabint</h4><hr>    
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

                        String sql = "SELECT `id`, `imgstyle`, `src`, `productname` FROM `new product` WHERE `id` BETWEEN 16 AND 20";
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
     
    <h5>Copyrgiht @ 2023 All rights reserved</h5>
    </footer>
  </body>
</html>