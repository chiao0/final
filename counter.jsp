<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>

<head>
    <title>網站總瀏覽數統計</title>
    <meta charset="UTF-8">
</head>

<body>

<%
Connection con = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost/counter?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";

    con = DriverManager.getConnection(url, "root", "1234");
    con.setAutoCommit(false);

    String selectSQL = "SELECT counter_value FROM counter";
    try (PreparedStatement selectStmt = con.prepareStatement(selectSQL);
         ResultSet rs = selectStmt.executeQuery()) {

        if (rs.next()) {
            int c = rs.getInt("counter_value");

            if (session.isNew()) {
                c++;
                out.print(c);

                String updateSQL = "UPDATE counter SET counter_value = ?";
                try (PreparedStatement updateStmt = con.prepareStatement(updateSQL)) {
                    updateStmt.setInt(1, c);
                    updateStmt.executeUpdate();
                }

                con.commit();
            } else {
                out.print(c);
            }

            session.invalidate();
        }
    }

    con.setAutoCommit(true);
} catch (SQLException | ClassNotFoundException e) {
    out.println("警告：MySQL 錯誤！" + e.toString());
} finally {
    try {
        if (con != null && !con.isClosed()) {
            con.close();
        }
    } catch (SQLException e) {
        out.println("關閉連接時出現錯誤：" + e.toString());
    }
}
%>

</body>

</html>
