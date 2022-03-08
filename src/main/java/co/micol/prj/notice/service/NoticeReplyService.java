package co.micol.prj.notice.service;

import java.util.List;

import co.micol.prj.notice.vo.NoticeReplyVO;

public interface NoticeReplyService {
	List<NoticeReplyVO> noticeReplySelect(NoticeReplyVO vo); //댓글 가져오기
	int noticeReplyInsert(NoticeReplyVO vo); //댓글 작성
	int noticeReplyDelete(NoticeReplyVO vo); //댓글 삭제 
	NoticeReplyVO selectReplyNo(); //최신글 key값 찾아오기
}
