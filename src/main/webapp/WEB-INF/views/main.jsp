<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/httpRequest.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

	function logout() {
		location.href = "${pageContext.request.contextPath }/user/logout.do";

	}

	function modify() {
		location.href = "${pageContext.request.contextPath }/user/modifyform.do";

	}
	function category_move(a) {
		console.log($(this.a));
	}

	$(document)
			.ready(
					function() {
						$("a").click(function() {
											location.href="${pageContext.request.contextPath}/product/category.do?category="+ $(this).html();
						});
					});


	function join(){

		location.href="${pageContext.request.contextPath }/user/joinform.do"
	}

	function login(){
		var str = document.lg.user_id;
		var uri=jQuery(location).attr('pathname')+jQuery(location).attr('search');
		var blank_pattern = /^\s+|\s+$/g;
		var blank_pattern = /[\s]/g;
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var strp = document.lg.pwd;
		document.lg.uri.value=uri;
		if( str.value == '' || str.value == null ){
		    alert( '아이디 값을 입력해주세요' );
		    return false;
		}
		else if( str.value.replace( blank_pattern, '' ) == "" ){
		    alert('아이디란에 공백만 입력되었습니다 ');
		    return false;
		}
		else if( blank_pattern.test( str.value) == true){
		    alert('아이디에 공백은 사용할 수 없습니다. ');
		    return false;
		}
		else if( special_pattern.test(str.value) == true ){
		    alert('아이디에 특수문자는 사용할 수 없습니다.');
		    return false;
		}
		else if( strp.value == '' || str.value == null ){
		    alert( '비밀번호 값을 입력해주세요' );
		    return false;
		}
		else{
		sendRequest("${pageContext.request.contextPath }/user/login.do", "&uri="+uri+"&user_id="+str.value+"&pwd="+strp.value, logina, "post")
		}
		}
	function logina(){
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var res1 = httpRequest.responseText;
				if(res1=="로그인실패했습니다."){
					alert(res1);
				}else{
				$("html").html(res1);
				}
			}
		}
	}
	function findpwd(){
		location.href="${pageContext.request.contextPath }/user/findpwd.do"
		
	}
</script>
	<link rel="shortcut icon" href="../favicon.ico"> 

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/menu.css">
</head>
<body>
<div style="position:relative; top: 80px; margin: 0 auto;width:100; margin:0 auto;"><h1>DEPOSCO</h1></div>
	<ul class="nav">
		<li><a href="#" onclick="">Home</a></li>
		<li class="dropdown"><a href="#" onclick="">주방가전</a>
			<ul>
				<li class="dropdown"><a href="#" onclick="">냉장고</a>
					<ul>
						<li><a href="#" onclick="">일반형</a></li>
						<li><a href="#" onclick="">업소용</a></li>
						<li><a href="#" onclick="">와인용</a></li>
						<li><a href="#" onclick="">김치냉장고</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" onclick="">밥솥</a>
					<ul>
						<li><a href="#" onclick="">IH압력</a></li>
						<li><a href="#" onclick="">열판압력</a></li>
						<li><a href="#" onclick="">비압력</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" onclick="">전자레인지</a>
					<ul>
						<li><a href="#" onclick="">전자레인지</a></li>
						<li><a href="#" onclick="">오븐레인지</a></li></li>
			</ul>
		<li class="dropdown"><a href="#" onclick="">커피메이커</a>
			<ul>
				<li><a href="#" onclick="">자동머신</a></li>
				<li><a href="#" onclick="">캡슐머신</a></li>
				<li><a href="#" onclick="">로스터</a></li>
			</ul></li>
	</ul>
	</li>
	<li class="dropdown"><a href="#" onclick="">생활가전</a>
		<ul>
			<li class="dropdown"><a href="#" onclick="">세탁기</a>
				<ul>
					<li><a href="#" onclick="">일반세탁기</a></li>
					<li><a href="#" onclick="">드럼세탁기</a></li>
					<li><a href="#" onclick="">건조기</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">청소기</a>
				<ul>
					<li><a href="#" onclick="">진공청소기</a></li>
					<li><a href="#" onclick="">로봇청소기</a></li>
					<li><a href="#" onclick="">스팀청소기</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">전화기</a>
				<ul>
					<li><a href="#" onclick="">유선전화기</a></li>
					<li><a href="#" onclick="">무선전화기</a></li>
					<li><a href="#" onclick="">인터넷폰</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">다리미</a>
				<ul>
					<li><a href="#" onclick="">일반형</a></li>
					<li><a href="#" onclick="">스탠드형</a></li>
					<li><a href="#" onclick="">건식다리미</a></li>
				</ul></li>
		</ul></li>
	<li class="dropdown"><a href="#" onclick="">TV</a>
		<ul>
			<li class="dropdown"><a href="#" onclick="">LED TV</a>
				<ul>
					<li><a href="#" onclick="">기본형TV</a></li>
					<li><a href="#" onclick="">커브드TV</a></li>
					<li><a href="#" onclick="">UHD</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">셋톱박스</a>
				<ul>
					<li><a href="#" onclick="">블루레이플레이어</a></li>
					<li><a href="#" onclick="">DVD플레이어</a></li>
					<li><a href="#" onclick="">셋톱박스</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">액서서리</a>
				<ul>
					<li><a href="#" onclick="">3D안경</a></li>
					<li><a href="#" onclick="">위성TV</a></li>
					<li><a href="#" onclick="">리모컨</a></li>
				</ul></li>
		</ul></li>
	<li class="dropdown"><a href="#" onclick="">이어폰</a>
		<ul>
			<li class="dropdown"><a href="#" onclick="">이어폰</a>
				<ul>
					<li><a href="#" onclick="">통화가능이어폰</a></li>
					<li><a href="#" onclick="">블루투스이어폰</a></li>
					<li><a href="#" onclick="">방수, 스포츠</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">헤드폰</a>
				<ul>
					<li><a href="#" onclick="">유선 헤드폰</a></li>
					<li><a href="#" onclick="">블루투스 헤드폰</a></li>
					<li><a href="#" onclick="">밀폐형 헤드폰</a></li>
				</ul></li>
		</ul></li>
	<li class="dropdown"><a href="#" onclick="">디지털카메라</a>
		<ul>
			<li class="dropdown"><a href="#" onclick="">디지털카메라</a>
				<ul>
					<li><a href="#" onclick="">DSLR 디카</a></li>
					<li><a href="#" onclick="">콤팩트 디카</a></li>
					<li><a href="#" onclick="">하이앤드 디카</a></li>
					<li><a href="#" onclick="">미러리스 디카</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">캠코더</a>
				<ul>
					<li><a href="#" onclick="">디지털 캠코더</a></li>
					<li><a href="#" onclick="">방수 캠코더</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">카메라렌즈</a>
				<ul>
					<li><a href="#" onclick="">DSLR용 렌즈</a></li>
					<li><a href="#" onclick="">광각화각 렌즈</a></li>
					<li><a href="#" onclick="">망원화각 렌즈</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">주변기기</a>
				<ul>
					<li><a href="#" onclick="">메모리카드</a></li>
					<li><a href="#" onclick="">카드리더기</a></li>
					<li><a href="#" onclick="">삼각대</a></li>
					<li><a href="#" onclick="">배터리/충전기</a></li>
				</ul></li>
		</ul></li>
	<li class="dropdown"><a href="#" onclick="">컴퓨터</a>
		<ul>
			<li class="dropdown"><a href="#" onclick="">모니터</a>
				<ul>
					<li><a href="#" onclick="">표준모니터</a></li>
					<li><a href="#" onclick="">게이밍 모니터</a></li>
					<li><a href="#" onclick="">TV겸용 모니터</a></li>
					<li><a href="#" onclick="">UHD 모니터</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">노트북</a>
				<ul>
					<li><a href="#" onclick="">표준노트북</a></li>
					<li><a href="#" onclick="">게임용노트북</a></li>
					<li><a href="#" onclick="">맥북</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">일체형PC</a>
				<ul>
					<li><a href="#" onclick="">곡면형 모니터</a></li>
					<li><a href="#" onclick="">게임용</a></li>
					<li><a href="#" onclick="">터치스크린</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">브랜드PC</a>
				<ul>
					<li><a href="#" onclick="">게임용</a></li>
					<li><a href="#" onclick="">사무용</a></li>
					<li><a href="#" onclick="">운영체제 미포함</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" onclick="">서버</a>
				<ul>
					<li><a href="#" onclick="">서버 컴퓨터</a></li>
				</ul></li>


		</ul></li>

	<br>
	<div id="container"></div>

	<div class="layer_fixed">
		<table cellspacing="0" cellpadding="0"
			style="width: 100%; height: 100%;">
			<tr>
				<td
					style="vertical-align: middle; padding-left: 20px; padding-right: 20px; text-align: center;">
					<c:choose>
						<c:when test="${sessionScope.type=='' || sessionScope.type==null}">로그인을 해주세요. 
						<input	type="button" class="md-trigger" data-modal="modal-1" value="로그인">
						</c:when>
						<c:otherwise>
		 ${sessionScope.type} ${sessionScope.name} 님 어서오세요 <input
								type="button" value="정보수정" onclick="modify()">
							<input type="button" value="로그아웃" onclick="logout()">
							<c:if test="${sessionScope.type=='판매자'}"><select> <option value="관리지 품목목록"></select></c:if>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>



		<script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>

		<!-- All modals added here for the demo. You would of course just have one, dynamically created -->
		<div class="md-modal md-effect-1" id="modal-1">
			<div class="md-content" style="text-align: center;">
				<h3>로그인</h3>
				<div>
					<p>아이디와 비밀번호를 입력하여 주세요.</p>
					 <form action="${pageContext.request.contextPath}/user/login.do" method="post" name="lg">
          <table style="margin: 0 auto;color: white;">
              <tr style="padding: 10px">
                      <td>아 이 디 </td><td> <input type="text" name="user_id" style="background: #9dd0c8;border: none;"/></td>
              </tr>
              <tr style="padding: 10px">
                      <td>비밀번호 </td><Td><input type="password" name="pwd" style="background: #9dd0c8;border: none;"/> <input type="hidden" name="uri"></Td>
              </tr>
              <tr>
             <td></td> <td><br><input type="button" value="로그인" onclick="login()" /><input type="button" value="회원가입" onclick="join()" /></td>
              </tr>
         </table>
    </form>
				
					
				</div>
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