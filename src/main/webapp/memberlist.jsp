<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
	<h3>회원리스트</h3>
	<hr>
		<%
	 
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb"; 
		String username = "root";
		String password = "12345";
		
		
		String sql = "SELECT * FROM  members"; //sql문 가져오기 members 테이블 모든것
		
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null; //select 문이 반환할 데이터를 받아주는 데이터 타입 클래스
		
		try{
			Class.forName(driverName);//드라이버 로딩
			connection = DriverManager.getConnection(url, username, password);
			stmt = connection.createStatement();// sql문 객체 생성
			
			rs = stmt.executeQuery(sql); //중요 select 의 반환 결과물을 ResultSet 클래스 로 만든 객체로 받음

			while(rs.next()){ // 다음거 있어? 하고 계속 반복 되서 없으면 종료
				String m_id  = rs.getString("id"); //문자열이니까 string. 숫자면 int
				String m_pw  = rs.getString("pw");
				String m_username  = rs.getString("username");
				String m_email  = rs.getString("email");
				
				out.println(m_id + "|");
				out.println(m_pw + "|");
				out.println(m_username + "|");
				out.println(m_email + "<br>");
			}
			
			
		}catch(Exception e){
			e.printStackTrace(); //에러 발생시 에러내용을 콘솔창에 출력
		}finally {
			try{
				if(rs != null){
					rs.close();
				}
				if(stmt != null){
					stmt.close();
				}
				if(connection != null){
					connection.close();
				}
			}catch(Exception e){
				e.printStackTrace();
		  }
		}
		
		
	%>
</body>
</html>