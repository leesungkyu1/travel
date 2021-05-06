<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!DOCTYPE html>			
		
		
<script>
$(function(){ // 화면 로드 할때 시작되는 스크립트
   var result = "<%=result%>"; // model에 담겨온 값
   console.log(result ); // 한번 찍어서 테스트
   })
   
  
</script>
<!-- 			 
<script>
 
      $.ajax({          
            url: 'tourView',
            type: 'get',
            data: 'expression' : expression, 'hitCnt' : hitcnt,
            dataType: 'json'   
            }
            error : fuction(error){
            	console.log("error!!!!!!!!!!!!!")
            	alert("Error!");
            },
            success : functions(data){
            	var mydata = data.body;
            	console.log(mydata);
            	
            	'<h4>'+mydata.name+'<h>'
            }

        });    
 
 </script> -->