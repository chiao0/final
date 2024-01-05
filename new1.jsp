<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<%	
Connection conn = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/buycar?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    String user = "root";
    String password = "1234";
    
    conn = DriverManager.getConnection(url, user, password);

    if (conn.isClosed()) {
        out.println("連線建立失敗！");
    } else {
        String number = request.getParameter("number");
        int productID = 1; // Assuming you have a product ID
        double total = 0.0; // Initialize total to 0

        // Fetch product price
        String productQuery = "SELECT `price` FROM `products` WHERE id = ?";
        try (PreparedStatement productStatement = conn.prepareStatement(productQuery)) {
            productStatement.setInt(1, productID);
            try (ResultSet productResultSet = productStatement.executeQuery()) {
                if (productResultSet.next()) {
                    double productPrice = productResultSet.getDouble("price");
                    total = Double.parseDouble(number) * productPrice;
                }
            }
        }

        // Insert into buyer table
        String buyerInsertQuery = "INSERT INTO `buyer` (`id`, `quantity`, `subtotal`) VALUES (?, ?, ?)";
        try (PreparedStatement buyerStatement = conn.prepareStatement(buyerInsertQuery)) {
            buyerStatement.setInt(1, productID); 
            buyerStatement.setInt(2, Integer.parseInt(number));
            buyerStatement.setDouble(3, total);

            buyerStatement.executeUpdate();
            
            out.print("已加入購物車！");
        }
    }
} catch (SQLException se) {
    se.printStackTrace();
    out.print("購物車加入失敗！");
} catch (Exception e) {
    e.printStackTrace();
    out.print("購物車加入失敗！");
} finally {
    try {
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>	

<%
// Redirect to 'goods.html' after a delay
response.setHeader("Refresh", "1; URL=goods.html");
%>

</body>
</html>
