<%@page import="com.kitri.shopping.product.Product"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath}/editor/css/smart_editor2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/httpRequest.js" charset="utf-8"></script>
<script type="text/javascript">
	function Cfile(){
		var rFilter = "\.(bmp|gif|jpg|jpeg|png)$";  
		
		if(!(new RegExp(rFilter, "i")).test(document.addform.img_url.value)){
			alert("이미지만 넣어주세요.");
			document.addform.img_url.value="";
		}
		
		
	}
	function edit_product(form1){
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		form1.action="${pageContext.request.contextPath}/product/edit.do";
		form1.category.value=form1.category1.value+">"+form1.category2.value+">"+form1.category3.value;
		alert(form1.category.value);
		form1.submit();
	}
	function add_product(form1){
			
			alert(form1.intro_content.value);
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			url="${pageContext.request.contextPath}/product/add.do";
			params="&img_url="+form1.img_url.value
			+"&name="+form1.name.value
			+"&user_id="+form1.user_id.value
			+"&quantity="+form1.quantity.value
			+"&price="+form1.price.value
			+"&sale_pct="+form1.sale_pct.value
			+"&category="+form1.category1.value+">"+form1.category2.value+">"+form1.category3.value
			+"&intro_content="+form1.intro_content.value;
			form1.category.value=form1.category1.value+">"+form1.category2.value+">"+form1.category3.value;
			alert(form1.category.value);
			form1.submit();
	}
	function calllist() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var res1 = httpRequest.responseText;
				document.getElementById("container").innerHTML = res1;
			}
		}
	}
	function p_add() {
		if(Number(document.getElementById("sale_pct").value)+1<=99){
		document.getElementById("sale_pct").value=Number(document.getElementById("sale_pct").value)+1;
		}
		else if(Number(document.getElementById("sale_pct").value)+1>99){
			alert("99% 이상의 할인율을 적용할 수 없습니다.");
		}
	}
	function p_del() {
		if(Number(document.getElementById("sale_pct").value)-1>=0){
		document.getElementById("sale_pct").value=Number(document.getElementById("sale_pct").value)-1;
		}
		else if(Number(document.getElementById("sale_pct").value)-1<0){
			alert("0미만 값은 넣을 수 없습니다.");
		}
	}
	function chack_p(){
		if(document.getElementById("sale_pct").value<0 || document.getElementById("sale_pct").value>99){
			alert("잘못된 숫자가 들어갔습니다. 0~99값을 넣어주세요.");
			document.getElementById("sale_pct").value=1;
		}else{
		}
	}
	
	function category_c1() {
		switch (document.addform.category1.value) {
		case "주방가전":
			document.getElementById("div_category2").innerHTML="<select name='category2' onchange='category_c2()'>"
				+"<option value='냉장고'>냉장고</option>"
				+"<option value='밥솥'>밥솥</option>"
				+"<option value='전자레인지'>전자레인지</option>"
				+"<option value='커피메이커'>커피메이커</option>"+"</select>";
			break;
		case "생활가전":
			document.getElementById("div_category2").innerHTML="<select name='category2' onchange='category_c2()'>"
				+"<option value='세탁기'>세탁기</option>"
				+"<option value='청소기'>청소기</option>"
				+"<option value='전화기'>전화기</option>"
				+"<option value='다리미'>다리미</option>"+"</select>";
			break;
		case "TV":
			document.getElementById("div_category2").innerHTML="<select name='category2' onchange='category_c2()'>"
				+"<option value='LED TV'>LED TV</option>"
				+"<option value='셋톱박스'>셋톱박스</option>"
				+"<option value='액서서리'>액서서리</option>"+"</select>";
			break;
		case "이어폰":
			document.getElementById("div_category2").innerHTML="<select name='category2' onchange='category_c2()'>"
				+"<option value='이어폰'>이어폰</option>"
				+"<option value='헤드폰'>헤드폰</option>"+"</select>";
			break;
		case "디지털카메라":
			document.getElementById("div_category2").innerHTML="<select name='category2' onchange='category_c2()'>"
				+"<option value='디지털카메라'>디지털카메라</option>"
				+"<option value='캠코더'>캠코더</option>"
				+"<option value='카메라렌즈'>카메라렌즈</option>"
				+"<option value='주변기기'>주변기기</option>"+"</select>";
			break;
		case "컴퓨터":
			document.getElementById("div_category2").innerHTML="<select name='category2' onchange='category_c2()'>"
				+"<option value='모니터'>모니터</option>"
				+"<option value='노트북'>노트북</option>"
				+"<option value='일체형PC'>일체형PC</option>"
				+"<option value='브랜드PC'>브랜드PC</option>"
				+"<option value='서버'>서버</option>"+"</select>";
			break;

		default:
			break;
		}
		category_c2();
	}
		function category_c2(){
			console.log(document.addform.category2.value);
			var msg="<select name='category3'>";
			
			switch (document.addform.category2.value) {
			case "냉장고":
				msg+="<option value='일반형'>일반형</option>"
					+"<option value='업소용'>업소용</option>"
					+"<option value='와인용'>와인용</option>"
					+"<option value='김치냉장고'>김치냉장고</option>";
				break;
			case "밥솥":
				msg+="<option value='IH압력'>IH압력</option>"
					+"<option value='열판압력'>열판압력</option>"
					+"<option value='비압력'>비압력</option>";
				break;
			case "전자레인지":
				msg+="<option value='전자레인지'>전자레인지</option>"
					+"<option value='오븐레인지'>오븐레인지</option>";
				break;
			case "커피메이커":
				msg+="<option value='자동머신'>자동머신</option>"
					+"<option value='캡슐머신'>캡슐머신</option>";
					+"<option value='로스터'>로스터</option>";
				break;
			case "세탁기":
				msg+="<option value='일반세탁기'>일반세탁기</option>"
					+"<option value='드럼세탁기'>드럼세탁기</option>";
					+"<option value='건조기'>건조기</option>";
				break;
			case "청소기":
				msg+="<option value='진공청소기'>진공청소기</option>"
					+"<option value='로봇청소기'>로봇청소기</option>"
					+"<option value='스팀청소기'>스팀청소기</option>";
					
				break;
			case "전화기":
				msg+="<option value='유선전화기'>유선전화기</option>"+
					"<option value='무선전화기'>무선전화기</option>"+
					"<option value='인터넷폰'>인터넷폰</option>";
				break;
			case "다리미":
				msg+="<option value='일반형'>일반형</option>"+
					"<option value='스탠드형'>스탠드형</option>"+
					"<option value='건식다리미'>건식다리미</option>";
				break;
			case "LED TV":
				msg+="<option value='기본형TV'>기본형TV</option>"+
					"<option value='커브드TV'>커브드TV</option>"+
					"<option value='UHD'>UHD</option>";
				break;
			case "셋톱박스":
				msg+="<option value='블루레이플레이어'>블루레이플레이어</option>"
					+"<option value='DVD플레이어'>DVD플레이어</option>"
					+"<option value='셋톱박스'>셋톱박스</option>";
				break;
			case "액서서리":
				msg+="<option value='3D안경'>3D안경</option>"
					+"<option value='위성TV'>위성TV</option>"
					+"<option value='리모컨'>리모컨</option>";
				break;
			case "이어폰":
				msg+="<option value='통화가능이어폰'>통화가능이어폰</option>"
					+"<option value='블루투스이어폰'>블루투스이어폰</option>"
					+"<option value='방수,스포츠'>방수,스포츠</option>";
				break;
			case "헤드폰":
				msg+="<option value='유선 헤드폰'>유선 헤드폰</option>"
					+"<option value='블루투스 헤드폰'>블루투스 헤드폰</option>"
					+"<option value='밀폐형 헤드폰'>밀폐형 헤드폰</option>";
				break;
			case "캠코더":
 				msg+="<option value='디지털캠코더'>디지털캠코더</option>"+
					"<option value='방수 캠코더'>방수 캠코더</option>";
				break;
			case "디지털카메라":
				msg+="<option value='DSLR 디카'>DSLR 디카</option>"
					+"<option value='콤팩트 디카'>콤팩트 디카</option>"
					+"<option value='하이엔드디카 '>하이엔드디카 </option>"
					+"<option value='미러리스 디카'>미러리스 디카</option>";
				break;
			case "카메라렌즈":
				msg+="<option value='DSLR용 렌즈'>DSLR용 렌즈</option>"
					+"<option value='광각화각 렌즈'>광각화각 렌즈</option>"
					+"<option value='망원화각 렌즈'>망원화각 렌즈</option>";
				break;
			case "주변기기":
				msg+="<option value='메모리카드'>메모리카드</option>"
					+"<option value='카드리더기'>카드리더기</option>"
					+"<option value='삼각대'>삼각대</option>"
					+"<option value='배터리/충전기'>배터리/충전기</option>";
				break;
			case "모니터":
				msg+="<option value='표준모니터'>표준모니터</option>"
					+"<option value='게이밍 모니터'>게이밍 모니터</option>"
					+"<option value='TV겸용 모니터'>TV겸용 모니터</option>"
					+"<option value='UHD 모니터'>UHD 모니터</option>";
				break;
			case "노트북":
				msg+="<option value='표준노트북'>표준노트북</option>"
					+"<option value='게임용노트북'>게임용노트북</option>"
					+"<option value='맥북'>맥북</option>";
				break;
			case "일체형PC":
				msg+="<option value='곡면형 모니터'>곡면형 모니터</option>"
				+"<option value='게임용'>게임용</option>"
				+"<option value='터치스크린'>터치스크린</option>";
				break;
			case "브랜드PC":
				msg+="<option value='게임용'>게임용</option>"
					+"<option value='사무용'>사무용</option>"
					+"<option value='운영체제 미포함'>운영체제 미포함</option>";
				break;
			case "서버":
				msg+="<option value='서버 컴퓨터'>서버 컴퓨터</option>";
				break;
			default:
				break;
			}
			msg+=+"</select>";
			document.getElementById("div_category3").innerHTML=msg;
		}
	function load_form() {
		var category="${product.category}";
		var arr=category.split(">");
		for(i=0;i<arr.length;i++){
			$("[value='"+arr[i]+"']").attr("selected","selected");
			if(i==0){
			category_c1();
			}else{
			category_c2();
			}
		}
/* 			var category=document.getElementsByName("category"+(i+1));
			
			var node=category[0].childNodes;
			for(a=0;a<node.length;a++){
				
				console.log("자식"+node[a].value+"불러온"+arr[i]);
				if(node[a].value==arr[i]){
					console.log("if");
					b=b+1;
					node[a].setAttribute("selected","selected");
					if(b=1){
					category_c1();
					}else{
					category_c2();	
					} 
				}
				
				}
			}*/
			/*
			var type=document.getElementsByName("type");
			for(i=0;i<list1.length;i++){
				var node=type[i].childNodes;
				for(a=0;a<node.length;a++){
					if(node[a].value==list1[i]){
						node[a].setAttribute("selected","selected");
					}
				}
			}
			*/
		
	}

</script>
<body onload="load_form()">
<form action="${pageContext.request.contextPath}/product/add.do" name="addform" method="post" enctype="multipart/form-data">
	<table style="text-padding: 10px; width: 800px;" border="1">
		<tr>
			<th>상품명</th>
			<td colspan="4"><input type="text" name="name"
				value="${product.name}" style="width: 240px;"></td>
			<th>판매자명</th>
			<td colspan="4" ><c:choose><c:when test="${msg=='edit'}"><input type="text" name="user_id"
				value="${product.user_id}" ></c:when><c:otherwise><input type="text" name="user_id"
				value="${sessionScope.user_id}" ></c:otherwise></c:choose></td>
		</tr>
		<tr><th>카테고리</th>
			<td><input type="hidden" value="${product.category}" name="category">
			<select name="category1" onchange="category_c1()">
				<option value="주방가전">주방가전</option>
				<option value="생활가전">생활가전</option>
				<option value="TV">TV</option>
				<option value="이어폰">이어폰</option>
				<option value="디지털카메라">디지털카메라</option>
				<option value="컴퓨터">컴퓨터</option>
			</select>
			<div id="div_category2">
			<select name='category2' onchange='category_c2()'>
				<option value='냉장고'>냉장고</option>
				<option value='밥솥'>밥솥</option>
				<option value='전자레인지'>전자레인지</option>
				<option value='커피메이커'>커피메이커</option></select>
			</div>
			<div id="div_category3">
			<select name="category3">
				<option value="일반형">일반형</option>
				<option value="업소용">업소용</option>
				<option value="와인용">와인용</option>
				<option value="김치냉장고">김치냉장고</option>
				
			</select>
			</div>
			
			</td>
			<th>가격</th>
			<td style="width: 70px;"><input type="text" name="price" value="${product.price}" style="width: 70px;" ></td>
			<th>할인률</th>
			<td><input type="button" value="-" onclick="p_del()"><input
			type="text" value='${product.sale_pct}' name="sale_pct" id="sale_pct"
			style="width: 25px;text-align: center; border: none;" onchange="chack_p()" >%<input
			type="button" value="+" onclick="p_add()"></td>
			<th >재고수량</th>
			<td style="width: 70px;"><input type="text" name="quantity"
				value="${product.quantity}" style="width: 70px;"></td>
			
		</tr>
		<tr><th colspan="9">메인이미지</th></tr>
			<tr><td colspan="9"><input type="file" name="img_url"
				value="${product.img_url}" onchange="Cfile()"> 
			<c:choose><c:when test="${msg=='edit'}">	<img src="${pageContext.request.contextPath}/img/${product.img_url}"></c:when></c:choose></td>
		</tr>
		<tr>
			<th colspan="9">상세설명</th>
		</tr>
		<tr>
			<td colspan="9"> 	<textarea name="intro_content" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
			</td>
		</tr>
		<tr><td colspan="8"><c:choose><c:when test="${msg=='add'}"><input type="button" onclick="add_product(this.form)"  value="저장"></c:when><c:otherwise><input type="button" onclick="edit_product(this.form)"  value="수정"></c:otherwise></c:choose><input type="reset" value="취소"></td></tr>
	</table>
</form>
</body>
<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/editor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		oEditors.getById["ir1"].exec("PASTE_HTML", ['${product.intro_content}']);
	},
	fCreator: "createSEditor2"
});

</script>