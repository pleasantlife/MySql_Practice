<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page language="java" import="java.sql.*" %>

<%
  String title = request.getParameter("title");
  String author = request.getParameter("author");
  String content = request.getParameter("content");

  // Database 연결
  Class.forName("com.mysql.jdbc.Driver"); //동적로딩 기술.
  String url = "jdbc:mysql://127.0.0.1:3306/bbs";
  //커넥션이 열림
                                              //db주소, userid, password
  Connection con = DriverManager.getConnection(url, "root", "mysql");

  String query = "insert into board(title,author,content,date) value(?,?,?,now())";


  //앞으로 통신하면서 고정된 쿼리(질의)를 날리겠습니다.
  //물음표에 넣을 값을 대입합니다. 좌우의 Statement가 다름에 주의!
  PreparedStatement pstmt = con.prepareStatement(query);
  pstmt.setString(1, title);
  pstmt.setString(2, author);
  pstmt.setString(3, content);
  pstmt.executeUpdate();



  //close 안하면 웹서버에 많은 부담을 초래함.
  con.close();

%>

<h1>
성공적으로 저장되었습니다.
</h1>
<a href="/bbs/">목록으로</a>
