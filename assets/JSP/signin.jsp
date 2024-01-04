<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("id") != null ){
    sql = "SELECT * FROM `members` WHERE `id`='" +session.getAttribute("id")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String id="", pwd="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    id=rs.getString("id");
		pwd=rs.getString("pwd");
	}
    con.close();//結束資料庫連結
%>
哈囉，<%=id%>，<a href='logout.jsp'>登出</a><br />
請修改會員資料：<br />
<form action="update.jsp" method="POST">
您的姓名：<input type="text" name="id" value="<%=id%>" />
您的密碼：<input type="password" name="pwd" value="<%=pwd%>" />
<input type="submit" name="b1" value="更新資料" />
</form>
<%
}
else{
	con.close();//結束資料庫連結
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
