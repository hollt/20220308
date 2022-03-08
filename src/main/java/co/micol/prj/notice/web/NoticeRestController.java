package co.micol.prj.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.micol.prj.notice.service.NoticeReplyService;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.vo.NoticeReplyVO;
import co.micol.prj.notice.vo.NoticeVO;

@RestController //responsebody + mapping 호출한 페이지로 결과를 돌려줌
public class NoticeRestController {
	@Autowired
	private NoticeReplyService replyDao;
	@Autowired
	private NoticeService noticeDao;
	
	@PostMapping("/ajaxReplyInsert.do")
	public String ajaxReplyInsert(NoticeReplyVO vo) { //댓글 입력
		int n = replyDao.noticeReplyInsert(vo);
		if( n != 0) {
			vo = replyDao.selectReplyNo();
			return Integer.toString(vo.getReplyNo());
		}else {
			return null;
		}
		
	}
	@PostMapping("/ajaxNoticeSearch.do")
	public List<NoticeVO> ajaxNoticeSearch(@RequestParam("key") String key, @RequestParam("val") String val) {
		return noticeDao.noticeSearchList(key, val); 
	}
}
