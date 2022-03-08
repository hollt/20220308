<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN방식 -->
<script src="resources/js/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 목록</h1>
		</div>
		<div>
			<form>
				<table>
					<tr>
						<td width="660"><select name="key" id="key">
								<option value="전체" selected>전체</option>
								<option value="작성자">작성자</option>
								<option value="제목">제목</option>
						</select>&nbsp; <input type="text" size="10" name="val" id="val">&nbsp;
							<button type="button" onclick="SearchList()">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div>
			<table border="1" id="contents">
				<thead>
					<tr>
						<th width="70">순번</th>
						<th width="100">작성자</th>
						<th width="300">제목</th>
						<th width="100">작성일자</th>
						<th width="70">조회수</th>
					</tr>
				</thead>
				<tbody id="body">
					<c:forEach items="${notices }" var="notice">
						<tr onmouseover='this.style.background="#fcecae";'
							onmouseleave='this.style.background="#FFFFFF";'
							onclick="searchNotice('${notice.noticeId }')">
							<td align="center">${notice.noticeId }
							<td align="center">${notice.noticeWriter }
							<td>${notice.noticeTitle }
							<td align="center">${notice.noticeDate }
							<td align="center">${notice.noticeHit }
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<form id="frm" action="noticeSelect.do" method="post">
				<input type="hidden" id="noticeId" name="noticeId">
			</form>
		</div>
		<br>
		<div>
			<button type="button" onclick="location.href='home.do'">홈으로</button>
		</div>
	</div>
	
	<script type="text/javascript">
	function searchNotice(id) {
		frm.noticeId.value = id;
		frm.submit();
	}
	function SearchList() {
		$.ajax({
			url : "ajaxNoticeSearch.do",
			type : "post",
			data : {
				"key" : $("#key").val(),
				"val" : $("#val").val()
			},
			dataType : "json",
			success : function(result) {
				if (result.length > 0) {
					jsonHtmlConvert(result);
				}
			}
		})
	}
	

	function jsonHtmlConvert(result) {
		var tb = $("#body");
		$("#body").empty();
		
		$.each(result,function(index, item) {
			var html = $("<tr />").attr({
					'onmouseover' : 'this.style.background="#fcecae";',	
					'onmouseleave' : 'this.style.background="#FFFFFF";',
					'onclick': 'searchNotice('+item.noticeId+')'
				}).append(
				$("<td align='center'/>").text(item.noticeId),
				$("<td align='center'/>").text(item.noticeWriter),
				$("<td />").text(item.noticeTitle),
				$("<td align='center'/>").text(item.noticeDate),
				$("<td align='center'/>").text(item.noticeHit)
			);
			tb.append(html);
		});
		$("#contents").append(tb);
	}
	</script>
</body>
</html>