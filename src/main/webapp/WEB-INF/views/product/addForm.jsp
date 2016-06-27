<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath}/editor/css/smart_editor2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/httpRequest.js" charset="utf-8"></script>
<script type="text/javascript">
	function add_product(form1){
			
			alert(form1.intro_content.value);
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			url="${pageContext.request.contextPath}/product/add.do";
			params="&imgurl="+form1.imgurl.value
			+"&name="+form1.name.value
			+"&user_id="+form1.user_id.value
			+"&quantity="+form1.quantity.value
			+"&price="+form1.price.value
			+"&sale_pct="+form1.sale_pct.value
			+"&category="+form1.category.value
			+"&intro_content="+form1.intro_content.value;
			
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
	

	    

</script>
<form action="${pageContext.request.contextPath}/product/add.do" name="addform" method="post" enctype="multipart/form-data">
	<table style="text-padding: 10px; width: 800px;" border="1">
		<tr>
			<th>상품명</th>
			<td colspan="4"><input type="text" name="name"
				value="${product.name}" style="width: 240px;"></td>
			<th>판매자명</th>
			<td colspan="4" ><input type="text" name="user_id"
				value="${sessionScope.user_id}" ></td>
		</tr>
		<tr><th>카테고리</th>
			<td>
			<select name="category">
				<option value="" selected="selected"></option>
				<option value="컴퓨터">컴퓨터</option>
				<option value="회사">회사</option>
				<option value="식품">식품</option>
			</select></td>
			<th>가격</th>
			<td style="width: 70px;"><input type="text" name="price" value="${product.price}" style="width: 70px;" ></td>
			<th>할인률</th>
			<td><input type="button" value="-" onclick="p_del()"><input
			type="text" value=0 name="sale_pct" id="sale_pct"
			style="width: 25px;text-align: center; border: none;" onchange="chack_p()" >%<input
			type="button" value="+" onclick="p_add()"></td>
			<th >재고수량</th>
			<td style="width: 70px;"><input type="text" name="quantity"
				value="${product.quantity}" style="width: 70px;"></td>
			
		</tr>
		<tr>
			<th colspan="9">메인이미지</th></tr>
			<tr><td colspan="9"><input type="file" name="imgurl"
				value="${product.img_url}"></td>
		</tr>
		<tr>
			<th colspan="9">상세설명</th>
		</tr>
		<tr>
			<td colspan="9"> 	<textarea name="intro_content" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
			</td>
		</tr>
		<tr><td colspan="8"><input type="button" onclick="add_product(this.form)"  value="저장"><input type="reset" value="취소"></td></tr>
	</table>
</form>

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
		oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
	},
	fCreator: "createSEditor2"
});

</script>