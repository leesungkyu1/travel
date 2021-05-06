<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>			
				
			
<script>
 
      $.ajax({          
            url: 'tourView',
            type: 'get',
            dataType: 'json',
            success: function(body){
    
                console.log('msgtest : ========='+body);
                var myItem = body;
                
                for(var i=0; myItem.length; i++){
                    var output = '';
                    console.log(myItem[i]);
                    output += '<h3>'+ i + 'expression' +'</h3>';
                    output += '<h4>'+myItem[i].hitCnt+'</h4>';
                    output += '<h4>'+myItem[i].addr2+'</h4>';
                    output += '<h4>'+myItem[i].contents2+'</h4>';
                     document.body.innerHTML += output;
                }
                error : fuction(error){
                	alert("Error!")
                }
            }
        });    
 
</script>