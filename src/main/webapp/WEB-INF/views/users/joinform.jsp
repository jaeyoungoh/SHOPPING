<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>


</head>
<body>
	<form action="${pageContext.request.contextPath }/user/adduser.do"
		name="j">
		<table>
			<tr>
				<td colspan="3">deposco 회원가입양식. 환영합니다. 어서오세요</td>
			</tr>
			<tr>
				<td>아이디 :</td>
				<td colspan="2"><input type="text" name="user_id" id="i" /></td>
			</tr>
			<tr>
				<td>패스워드 :</td>
				<td colspan="2"><input type="password" name="pwd" id="pw" /></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td colspan="2"><input type="text" name="name" id="n" /></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="hidden" name="email" /><input type="text"
					name="email1" id="e" />@<input type="text" name="email_addr">

					<select name="mail" onchange="email_change()">
						<option value="직접입력">직접입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="empass.com">empass.com</option>
						<option value="daum.net">daum.net</option>
						<option value="kitri.re.kr">kitri.re.kr</option>
				</select></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td colspan="2"><input type="text" name="address" id="a" /></td>
			</tr>
			<tr>
				<td>전화번호:</td>
				<td colspan="2"><input type="text" name="phone" id="p" /></td>
			</tr>


			<tr>
				<td><input type="button" value="가입요청" onclick="join()"></td>
				<td><input type="reset" value="입력취소"></td>
				<td><input type="button" value="로그인화면으로" onclick="canceljoin()"></td>
			</tr>
		</table>

	</form>

</body>
</html>