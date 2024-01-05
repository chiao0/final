<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="backrestconfig.jsp" %>
<%
if(request.getParameter("id") != null && !request.getParameter("id").equals("") 
    && request.getParameter("pwd") != null && !request.getParameter("pwd").equals("")){

    sql = "SELECT * FROM `backrest` WHERE `id`='" + request.getParameter("id") + 
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
                window.location.href = 'backstage.html';
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
                window.location.href = 'backrest.html';
            }, 100);
        </script>
<%
    }
} else {
    response.sendRedirect("backrest.html");
}
%>
