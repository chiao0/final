<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品搜索结果</title>
    <link rel="stylesheet" href="./assets/index.css">
</head>
<body>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost/product?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";

    try (Connection con = DriverManager.getConnection(url, "root", "1234")) {
        con.setAutoCommit(false);

        // 获取搜索关键字
        String searchword = request.getParameter("search");

        // 执行SQL查询以获取搜索结果
        String sql = "SELECT * FROM product WHERE name LIKE ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, "%" + searchword + "%");
            try (ResultSet rsresultsearch = pstmt.executeQuery()) {
                // 显示搜索结果
                out.println("<html><body>");
                while (rsresultsearch.next()) {
                    out.println("产品ID: " + rsresultsearch.getString("productid") + "<br>");
                    out.println("名称: " + rsresultsearch.getString("name") + "<br>");
                    // 其他字段类似方式显示
                    out.println("<hr>");
                }
                out.println("</body></html>");
            }
        }

        con.commit();
    }
} catch (SQLException | ClassNotFoundException e) {
    // 记录异常详细信息以便调试
    e.printStackTrace();
    out.println("警告：MySQL 错误！" + e.toString());
}
%>
</body>
</html>
