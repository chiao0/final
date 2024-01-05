<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/buycar?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    String user = "root";
    String password = "1234";

    try (Connection conn = DriverManager.getConnection(url, user, password)) {
        if (conn.isClosed()) {
            out.println("連線建立失敗！");
        } else {
            // Obtain form parameters
            String paymentMethod = request.getParameter("paymentMethod");
            String creditCardNumber = request.getParameter("creditCardNumber");
            String shippingAddress = request.getParameter("shippingAddress");

            String buyerQuery = "SELECT `id`, `quantity`, `subtotal` FROM `buyer`";
            try (ResultSet buyerResultSet = conn.createStatement().executeQuery(buyerQuery)) {
                while (buyerResultSet.next()) {
                    int buyerId = buyerResultSet.getInt("id");
                    int buyerQuantity = buyerResultSet.getInt("quantity");
                    double buyerSubtotal = buyerResultSet.getDouble("subtotal");

                    // Subtract the purchased quantity from the available quantity in 'products' table
                    String updateProductQuery = "UPDATE `products` SET `quantity` = `quantity` - ? WHERE `id` = ?";
                    try (PreparedStatement updateProductStatement = conn.prepareStatement(updateProductQuery)) {
                        updateProductStatement.setInt(1, buyerQuantity);
                        updateProductStatement.setInt(2, buyerId);
                        updateProductStatement.executeUpdate();
                    }

                    // Insert into 'list' table with accumulated quantities and total
                    String listInsertQuery = "INSERT INTO `list` (`paymentMethod`, `creditCardNumber`, `shippingAddress`, `product_Id`, `product_quantity`, `subtotal`) VALUES (?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement listStatement = conn.prepareStatement(listInsertQuery)) {
                        listStatement.setString(1, paymentMethod);
                        listStatement.setString(2, creditCardNumber);
                        listStatement.setString(3, shippingAddress);
                        listStatement.setInt(4, buyerId);
                        listStatement.setInt(5, buyerQuantity);
                        listStatement.setDouble(6, buyerSubtotal);
                        listStatement.executeUpdate();
                    }
                }

                // Delete from 'buyer' table (optional, depending on your requirements)
                // Note: This deletes all entries from the 'buyer' table. Adjust as needed.
                String buyerDeleteQuery = "DELETE FROM `buyer`";
                try (PreparedStatement buyerDeleteStatement = conn.prepareStatement(buyerDeleteQuery)) {
                    buyerDeleteStatement.executeUpdate();
                }
            } catch (SQLException buyerException) {
                buyerException.printStackTrace();
                out.println("Buyer SQL error: " + buyerException.getMessage());
            }
        }
    }
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    out.println("Database connection error: " + e.getMessage());
} finally {
    out.print("已成功下單！");
}
%>

<script>
    setTimeout(function () {
        window.location.href = 'goods.html';
    }, 1000);
</script>

</body>
</html>
