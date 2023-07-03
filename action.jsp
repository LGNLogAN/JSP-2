<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String resvno1 = request.getParameter("resvno");
		String jumin1 = request.getParameter("jumin");
		String vcode1 = request.getParameter("vcode");
		String hospcode1 = request.getParameter("hospcode");
		String resvdate1 = request.getParameter("resvdate");
		String resvyime1 = request.getParameter("resvyime");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			String sql = " insert into AI_VACCRESV_2023" + 
						 " values('"+resvno1+"','"+jumin1+"','"+vcode1+"','"+hospcode1+"','"+resvdate1+"','"+resvyime1+"')";
			stmt.executeUpdate(sql);
			response.sendRedirect("index.jsp");	
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		
	%>
</body>
</html>