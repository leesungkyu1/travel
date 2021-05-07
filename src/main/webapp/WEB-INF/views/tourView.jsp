<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<%@ page import = "org.json.simple.JSONArray" %>
<%
	JSONArray jObj = (JSONArray)request.getAttribute("place");
%>


<!DOCTYPE html>			
<script>


<%-- 	$(function(){
		var list = <%=jObj%>;
		
		
		console.log(list);
	}) --%>

</script>

<style>
.*{
	padding: 0;
	margin: 0;
	
}


</style>



<body>

		<c:set var="dataList" value="<%=jObj %>" />
		    <c:forEach var="list" items="${dataList}">
		      <div class="name" >이름 : ${list.name}</div>
		      <div class="arr2">${list.arr2}</div>
		      <div class="seq">${list.tourSeq}</div>
		      <div class="contents2">${list.contents2 }</div>
		      <div><img src="http://www.daejeon.go.kr/${list.idxImgPath }"></a></div>
		      <div>${list.idxImgName }</div>
		   </c:forEach>
</body>
