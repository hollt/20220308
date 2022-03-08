package co.micol.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.comm.ShaEncript;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("memberLoginForm.do")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	@PostMapping("memberLogin.do")
	public String memberLogin(MemberVO vo, Model model) {
		ShaEncript shaEncript = new ShaEncript();
		vo.setPassword(shaEncript.encryptSHA256(vo.getPassword()));//패스워드 암호화
		vo =  memberDao.memberSelect(vo);	
		if(vo != null) {
			model.addAttribute("message",vo.getName() + "님 환영합니다." );
		}else {
			model.addAttribute("message", "아이디 또는 패스워드가 틀립니다");
		}
		return "member/memberLogin";
	}
}
