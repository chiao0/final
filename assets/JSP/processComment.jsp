<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%
    // 接收參數
    String username = request.getParameter("username");
    String content = request.getParameter("content");
    out.println("Received parameters - username: " + username + ", content: " + content);

    // 資料驗證（這裡只是一個簡單的例子，實際應根據需求進行更嚴格的驗證）
    if (username == null || content == null || username.trim().isEmpty() || content.trim().isEmpty()) {
        out.println("Invalid input. Please provide valid data.");
    } else {
        try {
            // 連接資料庫
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/comment?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "1234");

            // 選擇資料庫
            String sql = "USE comment";
            con.createStatement().execute(sql);

            // 插入評論數據
            sql = "INSERT INTO comment (username, content) VALUES (?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, content);
            preparedStatement.executeUpdate();

            // 關閉資料庫連線
            con.close();

            // 重定向到 goods.html，并附带参数来标识评论已成功提交
            response.sendRedirect("goods.html?commentSubmitted=true");
        } catch (SQLException | ClassNotFoundException e) {
            out.println("SQL錯誤：" + e.toString());
        }
    }
%>
</body>
</html>



