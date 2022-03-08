/**
 * 공지사항 리스트 가져올때 쓰는 자바 스크립트
 */
 function aJaxCall(n) {
      $.ajax({
         url : "ajaxReplyInsert.do",
         type : "post",
         data : {'notice_id' : n, 'replyId' : '홍길동','replyContents' : $('#replyContents').val()},
         dataType : "text",
         success : function(data){
        	
          	if(data.length > 0){
          		htmlConvert(data); //성공되어올때 처리하는 함수         		
          	}
         }
       });
   }
   function htmlConvert(data){
	   
	   var button = "<button id='delet' onclick='deleteReply("+data+")'>삭제</button>";
	   var tb = $("<table border='1' id='rtable'>");
       var row = $("<tr />").append(
       		$("<td width='400'/ >").text($("#replyContents").val()),
       		$("<td align='center' width='50'/ >").append(button) //삭제버튼
       	);
       	tb.append(row);
       	$("#replyContents").val(""); //input box 초기화
        $("#wrap").append(tb);
	   
   }
   
   function deleteReply(n){ //n = 전달된 replyNo 값
		var del = false;
		$.ajax({
			url : "ajaxReplyDelete.do",
			type : "post",
			data : {"replyNo" : n},
			async:false,
			dataType : "text",
			success : function(data) {
				if(data.length > 0){
					del = true;
				}
			}
		});
		if(del){
			$(event.target).parent().parent().remove();			
		}else{
			alert(del + "삭제실패!!");
		}	
       //event.target.parentElement.parenElement.remove();
	}
