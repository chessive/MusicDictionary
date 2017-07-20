package login;

import login.MemberDAO;
import login.MemberVO;

public class Service {
	String msg = null;
	MemberDAO mdao = new MemberDAO();
	
	
	//로그인
	public String login(MemberVO mvo){
		msg = mdao.searchMember_id(mvo);
	
		return msg;
	}
	

	//회원가입
	public void join(MemberVO mvo){
		System.out.println("join");
		mdao.insert(mvo);	
		}

	//중복체크
	public boolean duplicheck(String id){
		boolean c = false;
		MemberVO vo = new MemberVO();
		vo.setId(id);
		msg=mdao.searchMember_id(vo);
		if(msg==null)return c;
		else if(msg.equals("ID가 존재합니다")){
			c = true;
		}else c = false;
		return c;
	}


	public void update(MemberVO mo) {
		mdao.update(mo);
		
	}
	
	//중복체크2
	public String duplicheck2(String id,String pwd){
		String msg=null;
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setId(pwd);
		msg=mdao.searchMember_id(vo);

		return msg;
	}


	public void delete(MemberVO mo) {
		mdao.delete(mo);
		
	}

}
