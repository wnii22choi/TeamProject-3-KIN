<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import ="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert user information</title>
</head>
<body>

<%
	String id = request.getParameter("id");
    String password = request.getParameter("password");
    Connection conn=null;
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://DB 서버 주소:3306/test";
    String ix = "DB 계정 ID";
    String pw = "DB 계정 PASSWORD";
    conn = DriverManager.getConnection(url,ix,pw);

    PreparedStatement pstmt = conn .prepareStatement("INSERT INTO user (id, passwd) values(?,?)");
    pstmt.setString(1, id);
    pstmt.setString(2, password);
    pstmt.executeUpdate();
    out.println("Insert Complete!!");
    conn.close();
 %>
 </body>
 </html>