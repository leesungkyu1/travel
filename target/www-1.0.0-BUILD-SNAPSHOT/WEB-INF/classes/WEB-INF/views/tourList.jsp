<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
      $.ajax({          
            url: 'tourList',
            type: 'get',
            dataType: 'json',
            success: function(msg){
                console.log(msg.response.body.items.item);
                var myItem = msg.response.body.items.item;
                
                for(var i=0; myItem.length; i++){
                    var output = '';
                    console.log(myItem.length);
                    output += '<h3>'+ i + '번째 서울 축제 데이터' +'</h3>';
                    output += '<h4>'+myItem[i].addr1+'</h4>';
                    output += '<h4>'+myItem[i].title+'</h4>';
                    output += '<h4>'+myItem[i].tel+'</h4>';
                     document.body.innerHTML += output;
                }
            }
        });    
 
</script>