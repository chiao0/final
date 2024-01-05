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
            String buyerDeleteQuery = "DELETE FROM `list`";
            try (PreparedStatement buyerDeleteStatement = conn.prepareStatement(buyerDeleteQuery)) {
                buyerDeleteStatement.executeUpdate();
            }
            out.println("已刪除全部訂單！");
        }
    }
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
    e.printStackTrace();
}
%>
<script>
    setTimeout(function () {
        window.location.href = 'backstage.html';
    }, 1000);
</script>

</body>
</html>
