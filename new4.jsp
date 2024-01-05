<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Retrieving parameters with defensive coding
    String productIdentifier = request.getParameter("productIdentifier") != null ? request.getParameter("productIdentifier") : "";
    String productName = request.getParameter("productName") != null ? request.getParameter("productName") : "";
    String buyerQuantityParam = request.getParameter("buyerQuantity");
    int quantity = (buyerQuantityParam != null && !buyerQuantityParam.isEmpty()) ? Integer.parseInt(buyerQuantityParam) : 0;

    out.println("Product Identifier: " + productIdentifier);
    out.println("Product Name: " + productName);
    out.println("Quantity: " + quantity);

    String url = "jdbc:mysql://localhost:3306/buycar?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    String user = "root";
    String password = "1234";

    int rowsAffected = 0;

    try {
        try (Connection con = DriverManager.getConnection(url, user, password)) {
            con.createStatement().execute("USE `buycar`");

            String sql = "DELETE FROM `buyer` WHERE id = ? AND quantity = ?";
            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setString(1, productIdentifier);
                pstmt.setInt(2, quantity);

                rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
%>
                    <script>
                        alert("刪除成功！ Rows Affected: <%= rowsAffected %>");
                        setTimeout(function(){
                            window.location.href = 'buy.car.html';
                        }, 100);
                    </script>
<%
                } else {
                    // 商品不存在或刪除失敗，可以根據實際需求處理
%>
                    <script>
                        alert("刪除失敗，請重新再試一次。");
                        setTimeout(function(){
                            window.location.href = 'buy.car.html';
                        }, 100);
                    </script>
<%
                }
            } catch (SQLException e) {
                out.println("SQL Error: " + e.getMessage());
                e.printStackTrace();
            }
        }
    } catch (SQLException e) {
        out.println("Database Connection Error: " + e.getMessage());
        e.printStackTrace();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
        response.sendRedirect("buy.car.html");
    }
%>
