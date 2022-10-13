<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공여부</title>
</head>
<body>
	<% //드라이버연결방법
	 	request.setCharacterEncoding("UTF-8");
		String mId = request.getParameter("id");
		String mPw = request.getParameter("pw");
		String mName = request.getParameter("username");
		String mEmail = request.getParameter("email");
		
		
		//out.println(mId);
		//out.println(mPw);
		//out.println(mName);
		//out.println(mEmail);
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb"; //mysql serverdb 이름폴더
		String username = "root";
		String password = "12345";
		
		//c r u d .Create(생성), Read(읽기), Update(갱신), Delete(삭제) 4개의 sql문
		String sql = "INSERT INTO members(id, pw, username, email) VALUES('"+mId+"','"+mPw+"','"+mName+"','"+mEmail+"'  )"; //create mysql꺼가서 필드명 보고 온다.
		
		Connection connection = null; //db와의 연동
		Statement stmt = null; // sql 연동을 위함 이아이도 닫아줘야함.
		
		try{
			Class.forName(driverName);//드라이버 로딩
			connection = DriverManager.getConnection(url, username, password); //DB연동
			stmt = connection.createStatement();// sql문 객체 생성
			
			int dbCheck= stmt.executeUpdate(sql); //매우중요 성공하면 1을 반환
			//stmt.executeQuery(sql); //매우중요
			
			
			if (dbCheck == 1){
				out.println("회원가입 성공");
			}else {
				out.println("회원가입 실패");
			}
			
			
			
			
			//예외처리 순서대로 차례대로 닫아라.
		}catch(Exception e){
			e.printStackTrace(); //에러 발생시 에러내용을 콘솔창에 출력
		}finally {
			try{
				
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

	
	<a href ="memberlist.jsp">회원리스트보기</a>
	
</body>
</html>