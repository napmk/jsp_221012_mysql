<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <!-- 자바연동하려면 꼭해줘야함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbcTest</title>
</head>
<body>
	<%
		//mysql 에 접속하기 위한 4가지 변수 선언 (driver,url, 계정id, 계정 pw)
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb"; //내컴퓨터경로
		String username = "root";
		String password = "12345";
	
		Connection connection = null;
		
		try{
			Class.forName(driverName);//드라이버 불러오기
			
			connection = DriverManager.getConnection(url,username, password);//db연동
			out.println("연결성공!!");
			out.println(connection);
		} catch (Exception e){
			
			out.println("연결실패!!");
		} finally{
			try{
			if(connection != null){  // null 값이 아니면
				connection.close();  // 연결안되면 닫아줘요
				}
			} catch (Exception e){   // 충돌 가능성있으니 닫아주자
				
			}
		}
	%>
</body>
</html>