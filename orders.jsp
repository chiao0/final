<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mysql://localhost:3306/buycar?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        String user = "root";
        String password = "1234";
        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(url, user, password);

        // Create a statement
        stmt = conn.createStatement();

        // Execute the query to select all rows from your table (replace "your_table" with your actual table name)
        String query = "SELECT * FROM `list`";
        rs = stmt.executeQuery(query);

        // Get metadata about the result set (columns information)
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        // Iterate through the result set and print data
        while (rs.next()) {
            // Iterate through columns and print data
            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnName(i);
                String columnValue = rs.getString(i);
                // Print the data
                out.println(columnName + ": " + columnValue + "<br>");
            }
            out.println("<hr>");  // Add a horizontal line to separate rows
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the reverse order of their creation
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<button onclick="window.location.href='del.jsp'">全部訂單刪除</button>
</body>
</html>
