<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN방식 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 상세보기</h1>
		</div>
		<div>
			<table border="1">
				<tr>
					<th width="100">작성자</th>
					<td width="150" align="center">${notice.noticeWriter}</td>
					<th width="100">작성일자</th>
					<td width="150" align="center">${notice.noticeDate}</td>
					<th width="100">조회수</th>
					<td width="150" align="center">${notice.noticeHit}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5">${notice.noticeTitle }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea rows="6" cols="100">${notice.noticeSubject }</textarea>
					</td>
				</tr>
			</table>
		</div><br>
		<div align="center">
			<button type="button" onclick="location.href='noticeList.do'">목록</button>
		</div>
		<br>
		<div id="wrap">
			<table border="1" id="rtable">
				<c:if test="${not empty replys }">
					<c:forEach items="${replys }" var="reply">
						<tr>
							<td width="400">${reply.replyContents }</td>
							<td width="70" align="center">
								<button type="button" onclick="deleteReply(${reply.replyNo})">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<div>
			<form id="frm">
				<input type="text" id="replyContents" size="50" >
				&nbsp;
				<button type="button" onclick="aJaxCall(${notice.noticeId})">등록</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
   function aJaxCall() {
      $.ajax({
         url : "ajaxReplyInsert.do",
         type : "post",
         data : {"notice_id" : ${notice.noticeId}, "replyId" : "홍길동","replyContents" : $("#replyContents").val()},
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

   
   </script>
   <script src="resources/js/noticeSelect.js"></script>
</body>
</html>