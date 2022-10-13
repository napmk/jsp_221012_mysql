<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("id");
		
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb"; //mysql serverdb 이름폴더
		String username = "root";
		String password = "12345";
		
		//c r u d .Create(생성), Read(읽기), Update(갱신), Delete(삭제) 4개의 sql문
		String sql = "DELETE FROM members WHERE id =  ?"; //데이터 뭐가들어올지 모르니 ? 씀
		
		Connection connection = null; //db와의 연동
		//Statement stmt = null; // sql 연동을 위함 이아이도 닫아줘야함.
		PreparedStatement pstmt = null; // 탈퇴시 사용
		try{
			Class.forName(driverName);//드라이버 로딩
			connection = DriverManager.getConnection(url, username, password); //DB연동
			pstmt = connection.prepareStatement(sql);// sql문 객체 준비후 생성
			pstmt.setString(1, mId); // 인덱스 1 여긴 0부터 아님!!
			
			int dbCheck= pstmt.executeUpdate(); //매우중요 성공하면 1을 반환
			//stmt.executeQuery(sql); //매우중요
			
			
			if (dbCheck == 1){
				out.println("회원탈퇴 성공!!!");
			}else {
				out.println("회원탈퇴 실패!!!");
			}
			
			
			
			
			//예외처리 순서대로 차례대로 닫아라.
		}catch(Exception e){
			e.printStackTrace(); //에러 발생시 에러내용을 콘솔창에 출력
		}finally {
			try{
				
				if(pstmt != null){
					pstmt.close();
				}
					
				if(connection != null){
					connection.close();
				}
			}catch(Exception e){
				e.printStackTrace();
		  }
		}
		
		
	%>
	<br><br>
	<a href="memberlist.jsp">회원리스트 보기</a>
</body>
</html>