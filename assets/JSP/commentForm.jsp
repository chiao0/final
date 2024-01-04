<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Comment Form</title>
</head>
<body>
    <!-- 評論表單 -->
    <form action="commentController.jsp" method="post"> <!-- 修改 action 屬性為 commentController.jsp -->
        <label for="user">使用者名稱:</label>
        <input type="text" id="user" name="user" required><br>

        <label for="content">評論內容:</label>
        <textarea id="content" name="comment" placeholder="說點什麼..." maxlength="1000" required></textarea><br>

        <button type="submit">送出評論</button>
    </form>
</body>
</html>
