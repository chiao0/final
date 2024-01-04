<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="config.jsp" %>

<%
try {
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String repeatpwd = request.getParameter("repeatpwd");
    String email = request.getParameter("email");

    if (!pwd.equals(repeatpwd)) {
    %>
        <script>
            alert("註冊失敗，密碼不一致！");
            setTimeout(function(){
                window.location.href = 't.html';
            }, 100); 
        </script>
    <%
        return; 
    }

    if (id == null || id.trim().isEmpty() || pwd == null || pwd.trim().isEmpty() || repeatpwd == null || repeatpwd.trim().isEmpty() || email == null || email.trim().isEmpty()) {
    %>
        <script>
            alert("註冊失敗，請填寫完整！");
            setTimeout(function(){
                window.location.href = 't.html';
            }, 100); 
        </script>
    <%
        return;
    }

    String jdbcUrl = "jdbc:mysql://localhost/members?serverTimezone=UTC";
    String dbUser = "root";
    String dbPassword = "1234";


    try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
         PreparedStatement checkEmailStmt = connection.prepareStatement("SELECT id FROM members WHERE email = ?")) {

        checkEmailStmt.setString(1, email);
        ResultSet resultSet = checkEmailStmt.executeQuery();

        if (resultSet.next()) {
    %>
            <script>
                alert("註冊失敗，此Email地址已經被註冊！");
                setTimeout(function(){
                    window.location.href = 't.html';
                }, 100); 
            </script>
    <%
            return;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("SQL Exception during email check: " + e.getMessage());
        return;
    }


    try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
         PreparedStatement pstmt = connection.prepareStatement("INSERT INTO members (id, pwd, email) VALUES (?, ?, ?)")) {

        pstmt.setString(1, id);
        pstmt.setString(2, pwd);
        pstmt.setString(3, email);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
    %>
            <script>
                alert("註冊成功！");
                setTimeout(function(){
                    window.location.href = 't.html';
                }, 100);
            </script>
    <%
        } else {
    %>
            <script>
                alert("註冊失敗，請重新註冊！");
                setTimeout(function(){
                    window.location.href = 't.html';
                }, 100); 
            </script>
    <%
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("SQL Exception: " + e.getMessage());
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Exception: " + e.getMessage());
    }
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("t.html");
}
%>
