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
	function canceljoin() {
		location.href = "${pageContext.request.contextPath }/user/main.do";
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
		if (str.value == '' || stri.value == null) {
			alert('전화번호를 입력해주세요');
			return false;
		}

		else if (stri.value.replace(blank_pattern, '') == "") {
			alert('전화번호에 공백만 입력되었습니다 ');
			return false;
		}

		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g

		else if (blank_pattern1.test(stri.value) == true) {
			alert('전화번호에 공백은 사용할 수 없습니다. ');
			return false;
		}

		else if (special_pattern.test(stri.value) == true) {
			alert('전화번호에 특수문자는 사용할 수 없습니다.');
			return false;
		}

		else if (str.value == '' || str.value == null) {
			alert('비밀번호 값을 입력해주세요');
			return false;
		}

		else if (str.value.replace(blank_pattern, '') == "") {
			alert('비밀번호에 공백만 입력되었습니다 ');
			return false;
		}

		else if (special_pattern.test(str.value) != true) {
			alert('비밀번호에 특수문자가 들어있지 않습니다.');
			return false;
		}

		else if (blank_pattern.test(str.value) == true) {
			alert('비밀번호에 공백은 사용할 수 없습니다. ');
			return false;
		}

		else if (str.value == '' || strn.value == null) {
			alert('이름을 입력해주세요');
			return false;
		}

		else if (strn.value.replace(blank_pattern, '') == "") {
			alert('이름에 공백만 입력되었습니다 ');
			return false;
		}

		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if (blank_pattern1.test(strn.value) == true) {
			alert('이름에 공백은 사용할 수 없습니다. ');
			return false;
		}

		else if (special_pattern.test(strn.value) == true) {
			alert('이름에 특수문자는 사용할 수 없습니다.');
			return false;
		}

		else if (stre.value == '' || stre.value == null) {
			alert('이메일을 입력해주세요');
			return false;
		}

		else if (stre.value.replace(blank_pattern, '') == "") {
			alert('이메일에 공백만 입력되었습니다 ');
			return false;
		}

		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if (blank_pattern1.test(stre.value) == true) {
			alert('이메일에 공백은 사용할 수 없습니다. ');
			return false;
		}

		else if (special_pattern.test(stre.value) == true) {
			alert('이메일에 @제외 특수문자는 사용할 수 없습니다.');
			return false;
		}

		else if (str.value == '' || stra.value == null) {
			alert('주소를 입력해주세요');
			return false;
		}

		else if (stra.value.replace(blank_pattern, '') == "") {
			alert('주소에 공백만 입력되었습니다 ');
			return false;
		}

		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if (blank_pattern1.test(stra.value) == true) {
			alert('주소에 공백은 사용할 수 없습니다. ');
			return false;
		}

		else if (special_pattern.test(stra.value) == true) {
			alert('주소에 특수문자는 사용할 수 없습니다.');
			return false;
		}

		else if (str.value == '' || strp.value == null) {
			alert('전화번호를 입력해주세요');
			return false;
		}

		else if (strp.value.replace(blank_pattern, '') == "") {
			alert('전화번호에 공백만 입력되었습니다 ');
			return false;
		}

		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		else if (blank_pattern1.test(strp.value) == true) {
			alert('전화번호에 공백은 사용할 수 없습니다. ');
			return false;
		}

		else if (special_pattern.test(strp.value) == true) {
			alert('전화번호에 특수문자는 사용할 수 없습니다.');
			return false;
		} else {
			document.j.email.value = document.j.email1.value
					+ document.j.email_addr.value;
			var uri = jQuery(location).attr('pathname')
					+ jQuery(location).attr('search');
			document.j.uri.value = uri;

			document.j.submit();
		}

	}

	function email_change() {
		document.j.email_addr.value = document.j.mail.value;

	}
	//로그인폼 +회원가입폼
	function logout() {
		location.href = "${pageContext.request.contextPath }/user/logout.do";

	}

	function modify() {
		location.href ="${pageContext.request.contextPath }/user/modifyform.do";
	}
	function cartlist(){
		location.href ="${pageContext.request.contextPath }/cart/list.do";
	}
	function orderlist(){
		location.href ="${pageContext.request.contextPath }/order/list.do";
	}
	function slist(){
		location.href ="${pageContext.request.contextPath }/product/slist.do";
	}
	function category_move(a) {
		console.log($(this.a));
	}

	$(document)
			.ready(
					function() {
						$("a")
								.click(
										function() {
											location.href = "${pageContext.request.contextPath}/product/category.do?category="
													+ $(this).html();
										});
					});

	function login() {
		var str = document.lg.user_id;
		var uri = jQuery(location).attr('pathname')
				+ jQuery(location).attr('search');
		var blank_pattern = /^\s+|\s+$/g;
		var blank_pattern = /[\s]/g;
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var strp = document.lg.pwd;
		document.lg.uri.value = uri;
		if (str.value == '' || str.value == null) {
			alert('아이디 값을 입력해주세요');
			return false;
		} else if (str.value.replace(blank_pattern, '') == "") {
			alert('아이디란에 공백만 입력되었습니다 ');
			return false;
		} else if (blank_pattern.test(str.value) == true) {
			alert('아이디에 공백은 사용할 수 없습니다. ');
			return false;
		} else if (special_pattern.test(str.value) == true) {
			alert('아이디에 특수문자는 사용할 수 없습니다.');
			return false;
		} else if (strp.value == '' || str.value == null) {
			alert('비밀번호 값을 입력해주세요');
			return false;
		} else {
			sendRequest("${pageContext.request.contextPath }/user/login.do",
					"&uri=" + uri + "&user_id=" + str.value + "&pwd="
							+ strp.value, logina, "post")
		}
	}
	function logina() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var res1 = httpRequest.responseText;
				if (res1 == "로그인실패했습니다.") {
					alert(res1);
				}	else {
					$("html").html(res1);
					
					
				}
			}
		}
	}
	function login1(){
		$("[data-modal=modal-1]").trigger("click");
	}
	function signup(){
		$("[data-modal=modal-2]").trigger("click");
	}
	function findpwd() {
		location.href = "${pageContext.request.contextPath }/user/findpwd.do"

	}
</script>
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/demo1.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/menu_sideslide.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/menu.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="menu-wrap">
		<nav class="menu">
			<div class="icon-list">
				<div style="height: 30px;"></div>
				<div id="icon">
					<i class="fa fa-user" aria-hidden="true"></i><input type="button"
						value="내정보보기"
						onclick='<c:choose><c:when test="${!sessionScope.type!=null}">modify()</c:when><c:otherwise>login1()</c:otherwise></c:choose>'>
				</div>
				<div id="icon">
					<i class="fa fa-shopping-cart" aria-hidden="true"></i><input
						type="button" value="장바구니보기"
						onclick='<c:choose><c:when test="${sessionScope.type!=null}">cartlist()</c:when><c:otherwise>login1()</c:otherwise></c:choose>'>
				</div>
				<div id="icon">
					<i class="fa fa-list" aria-hidden="true"></i><input type="button"
						onclick='<c:choose><c:when test="${sessionScope.type!=null}">orderlist()</c:when><c:otherwise>login1()</c:otherwise></c:choose>'
						value="구매목록">
				</div>
				<c:if test="${sessionScope.type=='관리자'}">
					<div id="icon">
						<i class="fa fa-wrench" aria-hidden="true"></i><input
							type="button" value="관리자페이지" onclick="admin()">
					</div>
				</c:if>
				<c:if test="${sessionScope.type=='판매자'}">
					<div id="icon">
						<i class="fa fa-list" aria-hidden="true"></i><input type="button"
							value="등록상품목록" onclick="slist()">
					</div>
					<div id="icon">
						<i class="fa fa-fw fa-bar-chart-o"></i><input type="button"
							onclick="" value="고객구매내역">
					</div>
				</c:if>
				<div style="height: 30px;"></div>
				<c:choose>
					<c:when test="${sessionScope.type=='' || sessionScope.type==null}">
						<div id="icon" style="display: inline-block; font-size: 15px;">
							<i class="fa fa-sign-in" aria-hidden="true"></i><input
								type="button" onclick="login1()" value="로그인">
						</div>
						<div id="icon" style="display: inline-block; font-size: 15px;">
							<i class="fa fa-user" aria-hidden="true"></i> <input
								type="button" onclick="signup()" value="회원가입">
						</div>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/user/logout.do"
							style="display: inline-block; font-size: 15px;"><i
							class="fa fa-sign-out" aria-hidden="true"></i> <span>로그아웃</span></a>
					</c:otherwise>

				</c:choose>
			</div>

		</nav>
		<button class="close-button" id="close-button">Close Menu</button>
	</div>
	<button class="menu-button" id="open-button">Open Menu</button>


	<div
		style="position: relative; top: 80px; margin: 0 auto; width: 100px; margin: 0 auto;">
		<h1>DEPOSCO</h1>
	</div>
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
					style="vertical-align: middle; padding-left: 20px; padding-right: 20px; text-align: center; color: white;">
					<c:choose>
						<c:when test="${sessionScope.type=='' || sessionScope.type==null}">로그인을 해주세요. 
						<input type="button" class="md-trigger" data-modal="modal-1"
								value="로그인">
							<button class="md-trigger" data-modal="modal-2">회원가입</button>
						</c:when>
						<c:otherwise>
		 ${sessionScope.type}<font color="#c94e50">
								${sessionScope.name}</font> 님 어서오세요 <input type="button" value="정보수정"
								onclick="modify()">
							<input type="button" value="로그아웃" onclick="logout()">
							<i class="fa fa-bars" aria-hidden="true" onclick="menu()"></i>
							<c:if test="${sessionScope.type=='판매자'}">
								<select>
									<option value="관리지 품목목록">
								</select>
							</c:if>
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
				<form action="${pageContext.request.contextPath}/user/login.do"
					method="post" name="lg">
					<table style="margin: 0 auto; color: white;" id="list">
						<tr style="padding: 10px">
							<td>아 이 디</td>
							<td><input type="text" name="user_id"
								style="background: rgb(96, 134, 144); border: none; color: white;" /></td>
						</tr>
						<tr style="padding: 10px">
							<td>비밀번호</td>
							<Td><input type="password" name="pwd"
								style="background: rgb(96, 134, 144); border: none; color: white;" />
								<input type="hidden" name="uri"></Td>
						</tr>
						<tr>
							<td></td>
							<td><br> <input type="button" value="로그인"
								onclick="login()" /> <input type="hidden" class="md-close"
								value="X" /></td>

						</tr>
					</table>
				</form>


			</div>
		</div>
	</div>

	<div class="md-modal md-effect-9" id="modal-2">
		<div class="md-content" style="text-align: center;">
			<h3>회원가입</h3>
			<div>
				<p>정보를 입력해주세요.</p>
				<form action="${pageContext.request.contextPath }/user/adduser.do"
					name="j">
					<table style="color: white;" id="list">
						<tr>
							<td colspan="3">환영합니다. 어서오세요</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td colspan="2"><input type="text" name="user_id" id="i"
								style="background: rgb(96, 134, 144); border: none; color: white;" /></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td colspan="2"><input type="password" name="pwd" id="pw"
								style="background: rgb(96, 134, 144); border: none; color: white;" /></td>
						</tr>
						<tr>
							<td>이름</td>
							<td colspan="2"><input type="text" name="name" id="n"
								style="background: rgb(96, 134, 144); border: none; color: white;" /></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="hidden" name="email"
								style="background: rgb(96, 134, 144); border: none; color: white;" /><input
								type="text" name="email1" id="e"
								style="background: rgb(96, 134, 144); border: none; color: white;" />
								@ <input type="text" name="email_addr"
								style="background: rgb(96, 134, 144); border: none; color: white; width: 100px;">

								<select name="mail" onchange="email_change()"
								style="background: rgb(96, 134, 144); border: none; color: white;">
									<option value="직접입력">직접입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="empass.com">empass.com</option>
									<option value="daum.net">daum.net</option>
									<option value="kitri.re.kr">kitri.re.kr</option>
							</select></td>
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="2"><input type="text" name="address" id="a"
								style="background: rgb(96, 134, 144); border: none; color: white;" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td colspan="2"><input type="text" name="phone" id="p"
								style="background: rgb(96, 134, 144); border: none; color: white;" /></td>
						</tr>


						<tr>
							<td><input type="button" value="가입요청" onclick="join()"><input
								type="hidden" name="uri"></td>
							<td><input type="reset" value="입력취소"></td>
						</tr>
					</table>

				</form>


			</div>
		</div>
	</div>


	<div class="md-overlay"></div>
	<!-- the overlay element -->

	<script src="${pageContext.request.contextPath}/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
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
	<script
		src="${pageContext.request.contextPath}/js/css-filters-polyfill.js"></script>

</body>
</html>