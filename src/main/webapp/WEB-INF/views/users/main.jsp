<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deposco에 오신 것을 환영합니다.</title>
<script type="text/javascript">




</script>
	<link rel="shortcut icon" href="../favicon.ico"> 

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/component.css" />


		<script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>
	<body>
		<!-- All modals added here for the demo. You would of course just have one, dynamically created -->
		<div class="md-modal md-effect-1" id="modal-1">
			<div class="md-content">
				<h3>로그인폼</h3>
				<div>
					<p>아이디와 비밀번호를 입력하여 주세요.</p>
					 <form action="${pageContext.request.contextPath}/user/login.do" method="post">
          <table>
              <tr>
                      <td>아 이 디 </td><td> <input type="text" name="user_id" /></td>
              </tr>
              <tr>
                      <td>비밀번호 </td><Td><input type="text" name="pwd" /> <input type="hidden" name="uri"></Td>
              </tr>
              <tr>
              <td><input type="button" value="로그인" onclick="login()" /></td><td><input type="button" value="회원가입" onclick="join()" /></td>
              </tr>
         </table>
    </form>
				
					<button class="md-close">Close me!</button>
				</div>
			</div>
		</div>
		
	

			
			<div class="main clearfix">
				
				<div class="column">
					<button class="md-trigger" data-modal="modal-1">Fade in &amp; Scale</button>

				</div>
			</div>

		<div class="md-overlay"></div><!-- the overlay element -->

		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="${pageContext.request.contextPath}/js/classie.js"></script>
		<script src="${pageContext.request.contextPath}/js/modalEffects.js"></script>

		<!-- for the blur effect -->
		<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
		<script>
			// this is important for IEs
			var polyfilter_scriptpath = '${pageContext.request.contextPath}/js/';
		</script>
		<script src="${pageContext.request.contextPath}/js/cssParser.js"></script>
		<script src="${pageContext.request.contextPath}/js/css-filters-polyfill.js"></script>

     

	

</body>
</html>