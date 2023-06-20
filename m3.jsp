<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>m3.jsp</title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>병원별 접종건수 통계</h1>
		<table border=1>
			<tr>
				<td>병원코드</td>
				<td>병원명</td>
				<td>접종건수</td>
			</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt=con.createStatement();
				String sql =" select ah.hospcode, ah.hospname , count(av.resvno) as total"+
							" from AI_HOSP_2023 ah, AI_VACCRESV_2023 av" + 
							" where ah.hospcode=av.hospcode" + 
							" group by ah.hospcode,ah.hospname";
				ResultSet rs=stmt.executeQuery(sql);
				//String grandtotal = "";
				
				while(rs.next()){
						//grandtotal =rs.getString("tot");
						out.print("<tr><td>"+rs.getString("hospcode")+"</td>");
						out.print("<td>"+rs.getString("hospname")+"</td>"); 
						out.print("<td>"+rs.getString("total")+"</td></tr>");					
					}	
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
			<tr><td colspan='2' style="text-align:center;">총 누계</td>
			<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt=con.createStatement();
				String sql =" select sum(count(av.resvno)) as tot"+
							" from AI_HOSP_2023 ah, AI_VACCRESV_2023 av" + 
							" where ah.hospcode=av.hospcode" + 
							" group by ah.hospcode,ah.hospname";
				ResultSet rs=stmt.executeQuery(sql);
			
				while(rs.next()){
						out.print("<td>"+rs.getString("tot")+"</td></tr>");					
					}	
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
			
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
