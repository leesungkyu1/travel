<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>





<script>
 	function pagingMove(pageno){
 		var form = document.createElement("form");
 		var input = document.createElement("input");
 		var input2 = document.createElement("input");
 		
 		input.setAttribute("type","text");
 		input.setAttribute("name","pageNo");
 		input.setAttribute("value",pageno);
 		
 		input2.setAttribute("type","text");
 		input2.setAttribute("name","word");
 		input2.setAttribute("value","${word}");
 		
 		form.method = "post";
 		form.action = "/tourView";
 		
 		form.appendChild(input);
 		form.appendChild(input2);
 		
 		document.body.appendChild(form);
 		
 		form.submit();
 	}
 		
	     /* location.href="/tourView?pageNo="+pageno;	} */
</script>
 	

<body>
    <c:set var="cnt" value="${page1 }"></c:set>
    	<c:if test="${cnt.pageNo > 1}">
			 <div>
			 	<input type="button" value="이전으로" onclick="pagingMove(${cnt.pageNo -1})"/>
	  		 </div>    	
    	</c:if>
    	
		<div>
			<input type="button" value="다음으로" onclick="pagingMove(${cnt.pageNo + 2})"/>
		</div>    	

</body>
</html>