<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if (session.getAttribute("id") != null) {
    if (request.getParameter("id") != null) {
        String newId = request.getParameter("id");
        String newPwd = request.getParameter("pwd");
        sql = "UPDATE `members` SET `id`='" + newId + "', `pwd`='" + newPwd + "' WHERE `id`='" + session.getAttribute("id") + "'";
        con.createStatement().execute(sql);
        con.close(); // 結束資料庫連結
%>
        <script>
            alert('更新成功！');
            setTimeout(function() {
                window.location.href = 'information.html';
            }, 100);
        </script>
<%
    } else {
        con.close(); // 結束資料庫連結
%>
        <script>
            alert('更新失敗！');
            setTimeout(function() {
                window.location.href = 'information.html';
            }, 100);
        </script>
<%
    }
} else {
    con.close(); // 結束資料庫連結
%>
    <h1><font color="red">您尚未登入，請登入！</font></h1>
    <form action="check.jsp" method="POST">
        帳號：<input type="text" name="id" /><br />
        密碼：<input type="password" name="pwd" /><br />
        <input type="submit" name="b1" value="登入" />
    </form>
<%
}
%>
