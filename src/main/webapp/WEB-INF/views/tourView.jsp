<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>			
				
			
<script>
 
      $.ajax({          
            url: 'tourView',
            type: 'get',
            dataType: 'json',
            success: function(msgBody){
    
                console.log('msgtest : ========='+msgBody);
                var myItem = msgBody;
                
                for(var i=0; myItem.length; i++){
                    var output = '';
                    console.log(myItem.length);
                    output += '<h3>'+ i + '번째 관광지' +'</h3>';
                    output += '<h4>'+myItem[i].addr1+'</h4>';
                    output += '<h4>'+myItem[i].tourSeq+'</h4>';
                    output += '<h4>'+myItem[i].name+'</h4>';
                     document.body.innerHTML += output;
                }
            }
        });    
 
</script>