<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>(과정평가형 정보처리산업기사) 백신접종예약 프로그램 Ver 2023</title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>예약번호 : <%= request.getParameter("resvnumber") %>의 접종예약조회</h1>
		
		<%
		    String resvnumber = request.getParameter("resvnumber");
		    
		    try {
		        Class.forName("oracle.jdbc.OracleDriver");
		        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		        Statement stmt = con.createStatement();
		        String sql = " SELECT aj.pname, av.jumin, CASE SUBSTR(av.jumin, 8, 1) WHEN '1' THEN '남' WHEN '2' THEN '여' END as gender, aj.tel, " +
		                     " SUBSTR(av.resvdate, 1, 4) || '년' || SUBSTR(av.resvdate, 5, 2) || '월' || SUBSTR(av.resvdate, 7, 2) || '일' as date1, " +
		                     " SUBSTR(av.resvyime, 1, 2) || ':' || SUBSTR(av.resvyime, 3, 2) as time1, ah.hospname, ah.hosptel, ah.hospaddr, " +
		                     " CASE av.vcode WHEN 'V001' THEN 'A백신' WHEN 'V002' THEN 'B백신' WHEN 'V003' THEN 'C백신' END as vac1 " +
		                     " FROM ai_hosp_2023 ah, ai_jumin_2023 aj, ai_vaccresv_2023 av " +
		                     " WHERE av.resvno = '" + resvnumber + "' AND aj.jumin = av.jumin AND ah.hospcode = av.hospcode";

		        ResultSet rs = stmt.executeQuery(sql);
		        //out.print(rs.next());
		        if (rs.next()){ //rs.next -> 다음 행의 값이 있으면 True 없으면 False 를 반환해준다.
		            %>
		            <table border="1">
		                <tr>
		                    <td>이름</td>
		                    <td>주민번호</td>
		                    <td>성별</td>
		                    <td>전화번호</td>
		                    <td>예약일자</td>
		                    <td>예약시간</td>
		                    <td>병원명</td>
		                    <td>대표전화</td>
		                    <td>병원주소</td>
		                    <td>백신종류</td>
		                </tr>
		            <% 
		            	//while 문과 do while 로 할려고 했지만 한 줄만 출력해야하는 결과물이므로 반복문을 제외 , 더군다나 while 문 사용은 안 되고 do while은 된다.
		                out.print("<tr><td>" + rs.getString("pname"));
		                out.print("</td><td>" + rs.getString("jumin"));
		                out.print("</td><td>" + rs.getString("gender"));
		                out.print("</td><td>" + rs.getString("tel"));
		                out.print("</td><td>" + rs.getString("date1"));
		                out.print("</td><td>" + rs.getString("time1"));
		                out.print("</td><td>" + rs.getString("hospname"));
		                out.print("</td><td>" + rs.getString("hosptel"));
		                out.print("</td><td>" + rs.getString("hospaddr"));
		                out.print("</td><td>" + rs.getString("vac1") + "</td></tr>");
		            
		            %>
		          	  </table><br>
		          	<%
		            out.println("<div style=\"text-align: center;\">");
		            out.println("<input type=\"submit\" value=\"돌아가기\" onclick=\"window.location.href='m2.jsp';\">");
		            out.println("</div>");
		        } else {
		            out.println("<h1>"+"회원 등록이 되어있지 않습니다."+"<h1>");
		            out.println("<input type=\"submit\" value=\"돌아가기\" onclick=\"window.location.href='m2.jsp';\">");
		        }
			        rs.close();
			        stmt.close();
			        con.close();
			        
		    }catch (Exception e) {
		        e.printStackTrace();
		    }
		%>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
