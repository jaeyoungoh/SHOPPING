<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function canceljoin(){
	location.href="${pageContext.request.contextPath }/user/main.do";
	
}

function join() {
	
	var stri = document.getElementById('i');
	var str = document.getElementById('pw');
	var strn = document.getElementById('n');
	var stre = document.getElementById('e');
	var strp = document.getElementById('p');
	var stra = document.getElementById('a');
	var blank_pattern1 = /[\s]/g;
	var blank_pattern = /^\s+|\s+$/g;

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if( str.value == '' || stri.value == null ){
	    alert( '전화번호를 입력해주세요' );
	    return false;
	}

	
	else if( stri.value.replace( blank_pattern, '' ) == "" ){
	    alert('전화번호에 공백만 입력되었습니다 ');
	    return false;
	}
	 
	//공백 금지
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	
	else if( blank_pattern1.test( stri.value) == true){
	    alert('전화번호에 공백은 사용할 수 없습니다. ');
	    return false;
	}

	else if( special_pattern.test(stri.value) == true ){
	    alert('전화번호에 특수문자는 사용할 수 없습니다.');
	    return false;
	}
	
	
	
	
	
	
	
	
	
	
		
	else if( str.value == '' || str.value == null ){
		    alert( '비밀번호 값을 입력해주세요' );
		    return false;
		}

	else if( str.value.replace( blank_pattern, '' ) == "" ){
		    alert('비밀번호에 공백만 입력되었습니다 ');
		    return false;
		}

	else if( special_pattern.test(str.value) != true ){
		    alert('비밀번호에 특수문자가 들어있지 않습니다.');
		    return false;
		}
		
		else if( blank_pattern.test( str.value) == true){
		    alert('비밀번호에 공백은 사용할 수 없습니다. ');
		    return false;
		}
		
		
		
		
		
		else if( str.value == '' || strn.value == null ){
		    alert( '이름을 입력해주세요' );
		    return false;
		}

		else if( strn.value.replace( blank_pattern, '' ) == "" ){
		    alert('이름에 공백만 입력되었습니다 ');
		    return false;
		}
		 
		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if( blank_pattern1.test( strn.value) == true){
		    alert('이름에 공백은 사용할 수 없습니다. ');
		    return false;
		}

		else if( special_pattern.test(strn.value) == true ){
		    alert('이름에 특수문자는 사용할 수 없습니다.');
		    return false;
		}
		
		
		
		
		
		else if( str.value == '' || stre.value == null ){
		    alert( '이메일을 입력해주세요' );
		    return false;
		}

		else if( stre.value.replace( blank_pattern, '' ) == "" ){
		    alert('이메일에 공백만 입력되었습니다 ');
		    return false;
		}
		 
		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if( blank_pattern1.test( stre.value) == true){
		    alert('이메일에 공백은 사용할 수 없습니다. ');
		    return false;
		}

		else if( special_pattern.test(stre.value) == true ){
		    alert('이메일에 @제외 특수문자는 사용할 수 없습니다.');
		    return false;
		}
		
		
		
		
		
		else if( str.value == '' || stra.value == null ){
		    alert( '주소를 입력해주세요' );
		    return false;
		}

		else if( stra.value.replace( blank_pattern, '' ) == "" ){
		    alert('주소에 공백만 입력되었습니다 ');
		    return false;
		}
		 
		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if( blank_pattern1.test( stra.value) == true){
		    alert('주소에 공백은 사용할 수 없습니다. ');
		    return false;
		}

		else if( special_pattern.test(stra.value) == true ){
		    alert('주소에 특수문자는 사용할 수 없습니다.');
		    return false;
		}
		
		
		
		
		
		
		else if( str.value == '' || strp.value == null ){
		    alert( '전화번호를 입력해주세요' );
		    return false;
		}

		else if( strp.value.replace( blank_pattern, '' ) == "" ){
		    alert('전화번호에 공백만 입력되었습니다 ');
		    return false;
		}
		 
		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if( blank_pattern1.test( strp.value) == true){
		    alert('전화번호에 공백은 사용할 수 없습니다. ');
		    return false;
		}

		else if( special_pattern.test(strp.value) == true ){
		    alert('전화번호에 특수문자는 사용할 수 없습니다.');
		    return false;
		}
		else {
			var mail=document.getElementsByName("mail");
			
			document.j.submit();
		}
	
		
		
		
	
	
}

function email_change(){
	var frm = documet.bizForm;
	var em = frm.email.value;
	frm.email.addr.value = em;
	if(em ==''){
		frm.email_addr.disabled = false;
	}else{
		frm.email_addr.disabled = true;
	}
	
} 


</script>


</head>
<body>
<form action="${pageContext.request.contextPath }/user/adduser.do" name="j">
<table>
<tr><td colspan="3">deposco 회원가입양식. 환영합니다. 어서오세요</td></tr>
<tr>
<td>아이디 :</td>
<td colspan="2"><input type="text" name="user_id" id="i" /></td>
</tr>
<tr>
<td>패스워드 :</td>
<td colspan="2"><input type="password" name="pwd" id="pw"  /></td>
</tr>
<tr>
<td>이름 :</td>
<td colspan="2"><input type="text" name="name" id="n" /></td>
</tr>
<tr><td>이메일 :</td><td><input type="text" name="email" id="e" />@<input type="text" name="email_addr">
			
			<select name="mail" onchange="email_change()">
			<option value="직접입력">직접입력</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="empass.com">empass.com</option>
			<option value="daum.net">daum.net</option>
			<option value="kitri.re.kr">kitri.re.kr</option>
			</select>
			
					
			
			</td>
			</tr>
<tr><td>주소 :</td><td colspan="2"><input type="text" name="address" id="a" /></td></tr>
<tr><td>전화번호:</td><td colspan="2"><input type="text" name="phone" id="p" /></td></tr>


<tr>
<td><input type="button" value="가입요청" onclick="join()"></td>
<td><input type="reset" value="입력취소" ></td>
<td><input type="button" value="로그인화면으로" onclick="canceljoin()"></td>
</tr>
</table>

</form>

</body>
</html>