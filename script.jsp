<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    try {
        // 步驟1：載入資料庫驅動程式 
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql; // 在這裡定義 sql 變數

        // 步驟2：建立連線
        String url = "jdbc:mysql://localhost:3306/sofabed1?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        String user = "root";
        String password = "1234";
        Connection con = DriverManager.getConnection(url, user, password);

        if (con.isClosed())
            out.println("連線建立失敗");
        else {
            // 步驟3：選擇資料庫   
            sql = "USE `sofabed1`";
            con.createStatement().execute(sql);

            // 判斷是否有商品 ID 被點擊
            String clickedProductId = request.getParameter("productId");

            // 如果有商品 ID 被點擊，則查詢該商品的詳細信息
            if (clickedProductId != null && !clickedProductId.isEmpty()) {
                sql = "SELECT * FROM `product_introduce` WHERE `id` = ?";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(clickedProductId));
                ResultSet rs = pstmt.executeQuery();

                // 將商品詳細信息動態生成到主頁
                while (rs.next()) {
                    out.println("<h2>" + rs.getString("productname") + "</h2>");
                    out.println("<img src='" + rs.getString("src1") + "' alt='Product Image'>");
					out.println("<img src='" + rs.getString("src2") + "' alt='Product Image'>");
					out.println("<img src='" + rs.getString("src3") + "' alt='Product Image'>");
                    out.println("<p>" + rs.getString("product_note") + "</p>");
                    out.println("<p>庫存: " + rs.getString("quantity") + "</p>");
                    out.println("<p>價格: $" + rs.getString("price") + "</p>");
                }
            } else {
                // 如果沒有商品 ID 被點擊，則查詢商品列表
                sql = "SELECT `id`, `productname` FROM `product_introduce`";
                PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = pstmt.executeQuery();

                // 動態生成商品列表的 HTML
                while (rs.next()) {
                    String productId = rs.getString("id");
                    String productName = rs.getString("productname");

                    // 生成商品列表的 HTML
                    out.println("<li class='product' data-id='" + productId + "'>");
                    out.println("    商品名稱: " + productName);
                    out.println("</li>");
                }
            }

            // 步驟5：關閉連線
            con.close();
        }
    } catch (SQLException | ClassNotFoundException e) {
        out.println("錯誤：" + e.getMessage());
    }
%>

