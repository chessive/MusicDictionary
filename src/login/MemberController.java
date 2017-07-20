package login;

import org.springframework.stereotype.Controller;



import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import login.MemberVO;

@Controller
public class MemberController{
	
	
	//로그인
	@RequestMapping(value = "mem.do", method = RequestMethod.POST)
	public String memlogin(@RequestParam("id")  String id, @RequestParam("pwd") String pwd){
		String msg = null;
		
		MemberVO mo = new MemberVO(id,pwd);
		//System.out.println("id : "+id + "pwd : "+pwd);
		msg=new Service().login(mo);

		//System.out.println("msg값 :"+msg);
		if(msg.equals("ID가 존재합니다")){
			//비밀번호틀림
			return "LoginView.html";  			//login과 회원가입있는 화면으로 이동
		}
		if(msg.equals("ID가 존재하지 않습니다.")){
			//ID가 존재하지 않습니다.
			return "LoginView.html";
		}
		
		//System.out.println("진짜끝");
			//로그인성공
			return "index2.html"; 			//logout만뜨는 화면으로 이동
		
			
	}
	
	
/*	//중복체크
	public String duplicate(String id){
		//추출,set완료
		MemberVO mo = new MemberVO();
		mo.setId(id);
		
		msg = new Service().login(mo);
		
		return "";
	}
	*/
	//@회원가입
	@RequestMapping(value = "memjoin.do", method = RequestMethod.POST)
	public String memJoin(MemberVO mo){
		//System.out.println("login controller post시작");
		new Service().join(mo);	
		return "index2.html";
		
	}

	//@회원정보수정
	@RequestMapping(value = "memupdate.do", method = RequestMethod.POST)
	public String memUpdate(MemberVO mo){
		System.out.println("Update controller post시작");
		new Service().update(mo);	
		return "index2.html";
		
	}
	
	//@회원탈퇴
	@RequestMapping(value = "memdelete.do", method = RequestMethod.POST)
	public String memDelete(MemberVO mo){
		System.out.println("delete controller post시작");
		new Service().delete(mo);	
		return "index.html";
		
	}
	
	
}
