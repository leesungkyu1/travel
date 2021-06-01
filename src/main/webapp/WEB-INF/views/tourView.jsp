<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<%@include file = "header.jsp" %>

<!DOCTYPE html>	

<script>
 	function goDetailPage(contid){
 	     location.href="/detail?contentid="+contid;
 	}
</script>


<style>

.*{
	padding: 0;
	margin: 0;
	
}




..wrap_contView.search {
	margin-top: 0;
}

.wrap_contView.search {
	position: relative;
    width: 100%;
	
}


.div {
	display: block;
}

#contents {
	width: 980px;
	margin: 0 auto;
	padding: 0 20px 27px 20px;
	position: relative;
}

.listwrap{
	font-size: 20px;
	margin: 0 auto;
	position: relative;
	width: 60rem;
	height : 100rem;
	display:flex;	
	flex-direction:column;
	float: left;
}
.photo {
	float: left;
	width: 180px;
	height: 120px;
	margin : 5px;

}
.textbox {
	width: 60%;
}



.photo img{
	width: 100%;
	height: 100%;
	
}

.data {
	left: 15rem;
	right: 15rem;

}

.li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.list_thumType.type1 > li:first-child{
	border-top:0;
}

.list_thumType > li {
	position: relative;
	padding: 20px 0;
	
}

.list_thumType > li .textbox{
	min-height: 94px;
}

.dl, ul, ol, menu, li{
	list-style: none;
}

.area_sWordList ul li {
	overflow: hidden;
	position: relative;
	margin-top: 14px;
}

.box_rightType3 {
	float: right;
	width: 400px;
	border: 1px solid #e6e6e6;
	background-color: #f7f7f7;
	position: absolute;
	left: 52rem;
}


.area_sWordList ul {
	width: 100%;
	margin-top: 13px;
}

.area_sWordList:first-child h3 {
	margin-top: 0;
}

.area_sWordList h3{
	font-weight: 400;
	font-size: 18px;
	color: #000;
	text-align: center;
	margin: 10px;	
}

.body, input, textarea, button, select, table {
    font: 13px/1.4 NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
    color: #666;
    -webkit-text-size-adjust: none;

}

</style>





<body>
	<div id="contents">
		<button onclick="pay()">test</button>
		<button onclick="cancelPay()">환불하기</button>
			<div class="wrap_contView clfix search">
				<ul class="list_thumType type1">
					<div class = "listwrap">
						<c:set var="dataList" value="${place}" />
						    <c:forEach var="list" items="${dataList}">
						    		<li class= "list_thumType" style="border-bottom: 1px solid #e6e6e6;">
								      <div class="photo">
									     <a onclick="goDetailPage('${list.contentid}')">
									      	<img src="${list.firstimage2 }">
								      	</a>
								      </div>
								      
								      <div class = "textbox">
									      
									      <div class="title" >
										      <h3><a onclick="goDetailPage('${list.contentid}')">${list.title }</a></h3>
										  </div>
									      <div class="addr2">${list.addr1}</div>
								      </div>
							      </li>
						</c:forEach>
				   </div>
				</ul>   
				
				<div class="box_rightType3">
					<div class="area_sWordList" id="sWord2">
						<h3>어제의 인기 검색어</h3>
							<ul id="p_search">
								<c:forEach var="cnt" items="${dataList }">
									<li>
										<div class="name"><a>${cnt.title}</a>
										</div>
									</li>
								</c:forEach>
							</ul>
					</div>
				</div>
		</div>
	</div>
	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script>
		console.log('test');	
		IMP.init('imp14890030'); // 아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능
		function pay () {	
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);         
			});
		}
	</script>
	
  	<script 
  		src="https://code.jquery.com/jquery-3.3.1.min.js"
	    	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	    	crossorigin="anonymous">
  	</script>
  	
  	<!-- jQuery CDN --> 
	<script>
	    function cancelPay(){
	      jQuery.ajax({
	        "url": "/payments/cancel",
	        "type": "POST",
	        "contentType": "application/json",
	        "data": JSON.stringify({
	          "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
	          "cancel_request_amount": 100, // 환불금액
	          "reason": "테스트 결제 환불", // 환불사유
	        }),
	        "dataType": "json"
	      }).done(function(result){
	    	  alert("환불 성공");
	      }).done(function(error){
	    	  alert("환불 실패");
	      });
	    }
	    
	</script>

	

	
</body>
