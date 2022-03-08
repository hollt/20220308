package co.micol.prj.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.micol.prj.notice.service.NoticeReplyMapper;
import co.micol.prj.notice.service.NoticeReplyService;
import co.micol.prj.notice.vo.NoticeReplyVO;

@Repository("replyDao")
public class NoticeReplyServiceImpl implements NoticeReplyService {
	@Autowired
	private NoticeReplyMapper map;
	
	@Override
	public List<NoticeReplyVO> noticeReplySelect(NoticeReplyVO vo) {
		return map.noticeReplySelect(vo);
	}

	@Override
	public int noticeReplyInsert(NoticeReplyVO vo) {
		return map.noticeReplyInsert(vo);
	}

	@Override
	public int noticeReplyDelete(NoticeReplyVO vo) {
		return map.noticeReplyDelete(vo);
	}

	@Override
	public NoticeReplyVO selectReplyNo() {
		return map.selectReplyNo();
	}

}
