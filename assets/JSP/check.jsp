<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("id") != null && !request.getParameter("id").equals("") 
    && request.getParameter("pwd") != null && !request.getParameter("pwd").equals("")){

    sql = "SELECT * FROM `members` WHERE `id`='" + request.getParameter("id") + 
          "'  AND `pwd`='" + request.getParameter("pwd") + "'"; 
    
    ResultSet rs = con.createStatement().executeQuery(sql);
    
    if(rs.next()){            
        session.setAttribute("id", request.getParameter("id"));
        con.close(); // 結束資料庫連結

        // 登入成功的 JavaScript 提示
%>
        <script>
            alert('登入成功！');
            setTimeout(function() {
                window.location.href = 'information.html';
            }, 100);
        </script>
<%
    } else {
        con.close(); // 結束資料庫連結

        // 登入失敗的 JavaScript 提示
%>
        <script>
            alert('帳號或密碼不符！請重新登入');
            setTimeout(function() {
                window.location.href = 't.html';
            }, 100);
        </script>
<%
    }
} else {
    response.sendRedirect("t.html");
}
%>
