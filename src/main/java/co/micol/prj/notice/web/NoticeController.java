package co.micol.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.micol.prj.notice.service.NoticeReplyService;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.vo.NoticeReplyVO;
import co.micol.prj.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeDao;
	@Autowired
	private NoticeReplyService replyDao;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		return "notice/noticeList";
	}
	
	@PostMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo , NoticeReplyVO rvo, Model model) {
		rvo.setNotice_id(vo.getNoticeId()); // 댓글을 찾기위해 id를 rvo에 넣어줌
		model.addAttribute("notice", noticeDao.noticeSelect(vo));
		model.addAttribute("replys", replyDao.noticeReplySelect(rvo)); //댓글가져오기
		return "notice/noticeSelect";
	}
	@PostMapping("/ajaxReplyDelete.do")
	@ResponseBody //RestController와 같은 역활을 한다 호출한 페이지로 결과를 돌려줌
	public String ajaxReplyDelete(NoticeReplyVO vo) {
		int n = replyDao.noticeReplyDelete(vo);
		if(n != 0) {
			return "Success";
		}else {
			return null;
		}
	}
	
}
