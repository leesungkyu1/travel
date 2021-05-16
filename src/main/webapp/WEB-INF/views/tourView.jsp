<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<%@ page import = "org.json.simple.JSONArray" %>
<%@include file = "header.jsp" %>
<%
	JSONArray jObj = (JSONArray)request.getAttribute("place");
%>

<%-- <%@include file = "header.jsp"%> --%>
<!DOCTYPE html>	

<script>
 	function goDetailPage(contentId){
 	     location.href="/detail?contentId="+contentId;
 	}
 	
//  	var area = document.getElementById("areacode");
//  	var areacode = area.options[area.selectedvalue].value;

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
	width: 300px;
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



</style>



<body>

	

	<div id="contents">
			<div class="wrap_contView clfix search">
				<ul class="list_thumType type1">
					<div class = "listwrap">
						<c:set var="dataList" value="<%=jObj %>" />
						    <c:forEach var="list" items="${dataList}">
						    		<li class= "list_thumType" style="border-bottom: 1px solid #e6e6e6;">
								      <div class="photo">
									     <a onclick="goDetailPage('${list.contentId}')">
									      	<img src="${list.firstimage2 }">
								      	</a>
								      </div>
								      
								      <div class = "textbox">
									      <div class="contentid">
										      <a onclick="goDetailPage('${list.contentid}')">
										      	${list.contentid}
										      </a>
									      </div>
									      <div class="title" >
										      <a onclick="goDetailPage('${list.contentid}')">
										      	${list.title}
										      </a>
										      
										  </div>
									      <div class="addr2">${list.addr1}</div>
									      <div class="readcount">${list.readcount }</div>    
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
										<div class="name"><a href="/detail?tourSeq=${cnt.tourSeq}">${cnt.name}</a></div>
									</li>
								</c:forEach>
							</ul>
					
				</div>
			</div>
		</div>
	</div>
	
	
	
	
</body>
