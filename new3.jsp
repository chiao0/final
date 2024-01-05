<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/buycar?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    String user = "root";
    String password = "1234";

    Connection con = DriverManager.getConnection(url, user, password);

    double altogether = 0.0;

    try {
        if (con.isClosed()) {
            out.println("連線建立失敗！");
        } else {
            con.createStatement().execute("USE `buycar`");

            String sql1 = "SELECT `id`, `quantity`, `subtotal` FROM `buyer`";
            ResultSet tmp1 = con.createStatement().executeQuery(sql1);

            int counter = 1;

            while (tmp1.next()) {
                int buyerId = tmp1.getInt("id");
                int buyerQuantity = tmp1.getInt("quantity");
                double buyerSubtotal = tmp1.getDouble("subtotal");

                String sql2 = "SELECT `id`, `name`, `price` FROM `products` WHERE id = ?";
                try (PreparedStatement pstmt = con.prepareStatement(sql2)) {
                    pstmt.setInt(1, buyerId);
                    ResultSet tmp2 = pstmt.executeQuery();

                    while (tmp2.next()) {
                        int productId = tmp2.getInt("id");
                        String productName = tmp2.getString("name");
                        double productPrice = tmp2.getDouble("price");
                        altogether += buyerQuantity * productPrice; // Fix this line

                        // Inside your while loop
                        String productIdentifier = "product_" + counter;

                        out.println("<tr><td><a href='new4.jsp' onclick='deleteProduct(\"" + productIdentifier + "\", \"" + productName + "\", " + buyerQuantity + ", " + buyerSubtotal + ")'><button class='delete-btn'>X</button></a>"
                            + productName + 
                            "</td><td class='price'>$" + productPrice + "</td><td class='quantity' id='" + productIdentifier + "_quantity'>"
                            + "<a href='#'><button class='quantity-btn' onclick='updateQuantity(\"" + productIdentifier + "\", 1)'>+</button></a>"
                            + "<span class='quantity-value' id='" + productIdentifier + "_quantity_value'>" + buyerQuantity + "</span>"
                            + "<a href='#'><button class='quantity-btn' onclick='updateQuantity(\"" + productIdentifier + "\", -1)'>-</button></a></td>"
                            + "<td class='subtotal' id='" + productIdentifier + "_subtotal'>$" + buyerSubtotal + "</td></tr>");

                        counter++; // Increment counter for the next product
                    }
                }
            }
            con.close();
        }
    } catch (SQLException sExec) {
        out.println("SQL錯誤" + sExec.toString());
    }
    out.println("<p>Total: " + altogether + "</p>");
%>

<script>
    function deleteProduct(productIdentifier, productName, buyerQuantity, subtotal) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // Optionally handle the response from the server
                location.reload(); // Reload the page or update the UI accordingly
            }
        };

        // Pass product information as parameters to the server
        var url = "deleteProduct.jsp?productIdentifier=" + encodeURIComponent(productIdentifier) +
            "&productName=" + encodeURIComponent(productName) +
            "&buyerQuantity=" + encodeURIComponent(buyerQuantity) +
            "&subtotal=" + encodeURIComponent(subtotal);

        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }
</script>

<script src="buy.car.js"></script> 

</body>
</html>
