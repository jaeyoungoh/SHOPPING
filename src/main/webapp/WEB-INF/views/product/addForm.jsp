<%@page import="com.kitri.shopping.product.Product"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath}/editor/css/smart_editor2.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/httpRequest.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/category.js" charset="utf-8"></script>
<script type="text/javascript">

	function Cfile(){
		var rFilter = "\.(bmp|gif|jpg|jpeg|png)$";  
		
		if(!(new RegExp(rFilter, "i")).test(document.addform.img_url1.value)){
			alert("이미지만 넣어주세요.");
			document.addform.img_url1.value="";
		}else{
			$("#imgdiv").html("<img src="+document.addform.img_url1.value+">");
		}
		
		
	}
	function edit_product(form1){
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		form1.action="${pageContext.request.contextPath}/product/edit.do";
		form1.category.value=form1.category1.value+">"+form1.category2.value+">"+form1.category3.value;
		form1.submit();
	}
	function add_product(form1){
			
			alert(form1.intro_content.value);
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			url="${pageContext.request.contextPath}/product/add.do";
			params="&img_url="+form1.img_url1.value
			+"&name="+form1.name.value
			+"&user_id="+form1.user_id.value
			+"&quantity="+form1.quantity.value
			+"&price="+form1.price.value
			+"&sale_pct="+form1.sale_pct.value
			+"&category="+form1.category1.value+">"+form1.category2.value+">"+form1.category3.value
			+"&intro_content="+form1.intro_content.value;
			form1.category.value=form1.category1.value+">"+form1.category2.value+">"+form1.category3.value;
			form1.img_url.value=form1.img_url1.value;
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
	
	
	function load_form() {
		var category="${product.category}";
		if('${product.quantity}'=="" || '${product.quantity}'==0){
		document.addform.quantity.value=0;}
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
<%@include file="../main.jsp" %>
<div id="cf">
<form action="${pageContext.request.contextPath}/product/add.do" name="addform" method="post" enctype="multipart/form-data">
	<table style="text-padding: 10px; width: 950px;">
		<tr>
			<th>상품명</th>
			<td colspan="3"><input type="text" name="name"
				value="${product.name}" style="width: 240px;" ></td>
				<th>카테고리</th>
			<td colspan="3"><input type="hidden" value="${product.category}" name="category">
			<select name="category1" onchange="category_c1()">
				<option value="주방가전">주방가전</option>
				<option value="생활가전">생활가전</option>
				<option value="TV">TV</option>
				<option value="이어폰">이어폰</option>
				<option value="디지털카메라">디지털카메라</option>
				<option value="컴퓨터">컴퓨터</option>
			</select>
			<div id="div_category2" style="display: inline-block;">
			<!-- <select name='category2' onchange='category_c2()'>
				<option value='냉장고'>냉장고</option>
				<option value='밥솥'>밥솥</option>
				<option value='전자레인지'>전자레인지</option>
				<option value='커피메이커'>커피메이커</option></select> -->
			</div>
			<div id="div_category3" style="display: inline-block;">
			<!-- <select name="category3">
				<option value="일반형">일반형</option>
				<option value="업소용">업소용</option>
				<option value="와인용">와인용</option>
				<option value="김치냉장고">김치냉장고</option>
				
			</select> -->
			</div>
			
			</td>
			
		</tr>
		<tr>
		<th>판매자명</th>
			<td><c:choose><c:when test="${msg=='edit'}"><input type="text" name="user_id"
				value="${product.user_id}" readonly="readonly"></c:when><c:otherwise><input type="text" name="user_id"
				value="${sessionScope.user_id}" readonly="readonly"></c:otherwise></c:choose></td>
			<th>가격</th>
			<td style="width: 70px;"><input type="text" name="price" value="${product.price}" style="width: 70px;" ></td>
			<th>할인률</th>
			<td style="text-align: center; width: 70px;"> <i class="fa fa-minus fa-1" onclick="p_del()" style="font-size: 10px" ></i><input
			type="text" value='${product.sale_pct+0}' name="sale_pct" id="sale_pct"
			style="width: 20px;text-align: right; border: none;" onchange="chack_p()" >% <i class="fa fa-plus fa-1" style="font-size: 10px" onclick="p_add()" ></i></div></td>
			<th>재고수량</th>
			<td style="width: 70px;"><input type="text" name="quantity"
				value='${product.quantity+0}' style="width: 50px;"></td>
			
		</tr>
		<tr><th>메인이미지</th><th colspan="8" style="text-align: left;"></th></tr>
			<tr><td colspan="9" style="padding-left: 30px;"><input type="file" name="img_url1"
				value="${product.img_url}" onchange="Cfile()"> 
				<input type="hidden" name="img_url" value="${product.img_url}">
				<div id="imgdiv"></div>
			<c:choose><c:when test="${msg=='edit'}">	<img src="${pageContext.request.contextPath}/img/${product.img_url}" style="width: 100px;height: 100px;"></c:when></c:choose></td>
		</tr>
		<tr>
			<th>상세설명</th><th colspan="8" ></th>
		</tr>
		<tr>
			<td colspan="9"> 	<textarea name="intro_content" id="ir1" rows="10" cols="100" style="width:916px; height:412px; display:none;"></textarea>
			</td>
		</tr>
		<tr><td colspan="9"><c:choose><c:when test="${msg=='add'}"><input type="button" onclick="add_product(this.form)"  value="저장"></c:when><c:otherwise><input type="button" onclick="edit_product(this.form)"  value="수정"></c:otherwise></c:choose><input type="reset" value="취소"></td></tr>
	</table>
</form>
</div>
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