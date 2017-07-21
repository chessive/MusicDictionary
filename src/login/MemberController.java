package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import login.MemberVO;

@Controller
public class MemberController {

	//HttpSession session = null;
	
	//session=request.getSession();
	

	// 로그인
	@RequestMapping(value = "view/mem.do", method = RequestMethod.POST)
	public String memlogin(@RequestParam("id") String id, @RequestParam("pwd") String pwd,HttpSession session) {
		String msg = null;
		
		MemberVO mo = new MemberVO(id, pwd);
		System.out.println("id : " + id + "pwd : " + pwd);
		msg = new Service().login(mo);

		// System.out.println("msg값 :"+msg);

		if (msg.equals("ID가 존재합니다")) {
			// 비밀번호틀림
			session.setAttribute("id", "nosession");
			return "index.html"; // login과 회원가입있는 화면으로 이동
		}
		if (msg.equals("ID가 존재하지 않습니다.")) {
			// ID가 존재하지 않습니다.
			session.setAttribute("id", "nosession");
			return "index.html";
		}

		// System.out.println("진짜끝");
		// 로그인성공
		System.out.println("로그인성공");

		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);

		return "index.html"; // logout만뜨는 화면으로 이동

	}

	// @회원가입
	@RequestMapping(value = "view/memjoin.do", method = RequestMethod.POST)
	public String memJoin(MemberVO mo,HttpSession session) {
		System.out.println("login controller post시작");
		new Service().join(mo);
		session.setAttribute("id", (String) session.getAttribute("id"));
		session.setAttribute("pwd", (String) session.getAttribute("pwd"));
		return "index.html";

	}

	// @회원정보수정
	@RequestMapping(value = "view/memupdate.do", method = RequestMethod.POST)
	public String memUpdate(MemberVO mo, HttpSession session) {
		System.out.println("Update controller post시작");
		new Service().update(mo);
		session.setAttribute("id", (String) session.getAttribute("id"));
		session.setAttribute("pwd", (String) session.getAttribute("pwd"));
		return "index.html";

	}

	// @회원탈퇴
	@RequestMapping(value = "view/memdelete.do", method = RequestMethod.POST)
	public String memDelete(MemberVO mo, HttpSession session) {
		System.out.println("delete controller post시작");
		new Service().delete(mo);
		session.invalidate();
		return "index.html";

	}

}
