<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%
    try {
        // 连接数据库，检索评论数据
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/comment?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        Connection con = DriverManager.getConnection(url, "root", "1234");

        String selectSql = "SELECT * FROM comment";
        Statement selectStatement = con.createStatement();
        ResultSet resultSet = selectStatement.executeQuery(selectSql);

        // 生成评论的 HTML 代码
        StringBuilder commentsHtml = new StringBuilder();
        while (resultSet.next()) {
            commentsHtml.append("<p>Username: ").append(resultSet.getString("username")).append("<br>");
            commentsHtml.append("Content: ").append(resultSet.getString("content")).append("</p>");
        }

        con.close();
        out.println(commentsHtml.toString());
    } catch (SQLException | ClassNotFoundException e) {
        out.println("SQL错误：" + e.toString());
    }
%>
</body>
</html>








