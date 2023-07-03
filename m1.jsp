<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>m1.jsp</title>

<script type="text/javascript">
	function aaa(){
		if(document.frm.resvno.value.length != 8){
			alert("접종 예약번호가 입력되지 않았습니다.");
			frm.resvno.focus();
			return false;
		}
		if(document.frm.jumin.value.length != 14){
			alert("주민번호가 입력되지 않았습니다.");
			frm.jumin.focus();
			return false;
		}
		if(document.frm.vcode.value.length != 4){
			alert("백신코드가 입력되지 않았습니다.");
			frm.vocode.focus();
			return false;
		}
		if(document.frm.hospcode.value.length != 4){
			alert("병원코드가 입력되지 않았습니다.");
			frm.hospcode.focus();
			return false;
		}
		if(document.frm.resvdate.value.length != 8){
			alert("예약일자가 입력되지 않았습니다.");
			frm.resvdate.focus();
			return false;
		}
		if(document.frm.resvyime.value.length != 4){
			alert("에약시간이 입력되지 않았습니다.");
			frm.resvytime.focus();
			return false;
		}
		success();
		return true;
	}
	
	function success(){
		alert("접종 예약 정보가 등록 되었습니다");
	}
	
	function bbb(){
		alert("초기화 되었습니다.");
		frm.resvno.focus();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>백신접종예약</h1>
		<form name="frm" action="action.jsp">
			<table border=1>
				<tr>
					<td id="special">접종 예약번호</td>
					<td><input type="text" name="resvno">예) 20210101</td>
				</tr>
				<tr>
					<td id="special">주민번호</td>
					<td><input type="text" name="jumin">예) 710101-1000001</td>
				</tr>
				<tr>
					<td id="special">백신코드</td>
					<td><input type="text" name="vcode">예) V001-V003</td>
				</tr>
				<tr>
					<td id="special">병원코드</td>
					<td><input type="text" name="hospcode">예) H001</td>
				</tr>
				<tr>
					<td id="special">예약일자</td>
					<td><input type="text" name="resvdate">예) 20211231</td>
				</tr>
				<tr>
					<td id="special">예약시간</td>
					<td><input type="text" name="resvyime">예) 12:30</td>
				</tr>
				<tr>
					<td colspan=2 style="text-align:center;">
						<input type="submit" value="등록" onclick="return aaa()">
						<input type="reset" value="다시쓰기" onclick="return bbb()">
					</td>
				</tr>
		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>