<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("id") != null ){
    sql = "SELECT * FROM `members` WHERE `id`='" +session.getAttribute("id")+"';"; 
    ResultSet rs =con.createStatement().executeQuery(sql);
    String id="", pwd="",email="";
    //讀出id, pwd當成使用者要更改時的內定值

    while(rs.next()){
        id=rs.getString("id");
        pwd=rs.getString("pwd");
        email=rs.getString("email");
    }
    con.close();//結束資料庫連結
}
%>
