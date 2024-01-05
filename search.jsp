<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>商品搜尋結果</title>
     <link rel="stylesheet" href="/assets/css/index.css">
</head>
<body>

<%
try {
     Class.forName("com.mysql.cj.jdbc.Driver");
     String url = "jdbc:mysql://localhost/product?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";

     try (Connection con = DriverManager.getConnection(url, "root", "1234")) {
         con.setAutoCommit(false);

         // 取得搜尋關鍵字
         String searchword = request.getParameter("search");

         // 執行SQL查詢以取得搜尋結果
         String sql = "SELECT * FROM product WHERE name LIKE ?";
         try (PreparedStatement pstmt = con.prepareStatement(sql)) {
             pstmt.setString(1, "%" + searchword + "%");
             try (ResultSet rsresultsearch = pstmt.executeQuery()) {
                 // 顯示搜尋結果
                 out.println("<html><body>");
                 while (rsresultsearch.next()) {
                     out.println("產品ID: " + rsresultsearch.getString("productid") + "<br>");
                     out.println("名稱: " + rsresultsearch.getString("name") + "<br>");
                     // 其他欄位類似方式顯示
                     out.println("<hr>");
                 }
                 out.println("</body></html>");
             }
         }

         con.commit();
     }
} catch (SQLException | ClassNotFoundException e) {
     // 記錄異常詳細資訊以便調試
     e.printStackTrace();
     out.println("警告：MySQL 錯誤！" + e.toString());
}
%>
</body>
</html>