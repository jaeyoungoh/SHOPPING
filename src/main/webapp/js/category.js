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
					+"<option value='오븐레인지'>오븐레인지</option>"
				break;
			case "커피메이커":
				msg+="<option value='자동머신'>자동머신</option>"
					+"<option value='캡슐머신'>캡슐머신</option>"
					+"<option value='로스터'>로스터</option>";
				break;
			case "세탁기":
				msg+="<option value='일반세탁기'>일반세탁기</option>"
					+"<option value='드럼세탁기'>드럼세탁기</option>"
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