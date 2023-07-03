<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>m2.jsp</title>
</head>
<script type="text/javascript">
	function ccc(){
		if(document.frm2.resvnumber.value.length == 0){
			alert("입력해주세요");
			frm2.resvnumber.focus();
			return false;
		}
		success();
		return true;
	}
	function success(){
		alert("예약번호가 입력되었습니다.");
	}
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>접종예약조회</h1>
		<form action="action2.jsp" name="frm2">
		<table border=1>
			<tr>
				<td>예약번호를 입력하시오</td>
				<td><input type="text" name="resvnumber"></td>
			</tr>
			<tr> 
				<td colspan=2 style="text-align:center;">
					<input type="submit" name="resv" value="예약조회" onclick="return ccc();">
					<input type="submit" name="home" value="홈으로" onclick="window.location.href = 'index.jsp'; return false;">
				</td>
			</tr>
			
		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>