package com.myspring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pettoday.dao.memberDAO;
import com.pettoday.vo.JoinVO;
import com.pettoday.vo.LoginVO;
import com.pettoday.vo.SessionVO;

@Controller
public class MemberController {
	
	@Autowired
	private memberDAO memberDao;

	/**
	 * 로그인 컨트롤러
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login(String loginResult) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("loginResult", loginResult);
		mv.setViewName("/member/login.user");

		return mv;
	}
	@RequestMapping(value = "/login_proc.do", method = RequestMethod.POST)
	public String login_proc(LoginVO vo, HttpSession session) {
		String resPage = "";
		SessionVO svo = memberDao.getResultLogin(vo);
		// DB연동
		if (svo != null) {
			if (svo.isResult()) {
				// 세션등록 * session을 사용하는 경우에는 ModelAndView를 사용하지 않아도 된다.
				session.setAttribute("svo", svo);
				session.setAttribute("sid", vo.getId());
				resPage = "member/login_success.user";
			}
		}else {
			resPage = "member/login_fail2.user";
		}
		return resPage;
	}
	
	/**
	 * 회원가입 컨트롤러
	 */
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		return "/member/join.user";
	}
	@RequestMapping(value = "/join_proc.do", method = RequestMethod.POST)
	public String join_proc(JoinVO vo) {
		String resPage = "";
		int joinResult = memberDao.getResultJoin(vo);

		// DB연동
		
		/*JoinCheckService service = new JoinCheckService();
		joinResult = service.getJoinResult(vo);*/

		if (joinResult!=0) {
			resPage = "redirect:/login.do";
		} else {
			resPage = "redirect:/join.do";
		}

		return resPage;
	}
	@RequestMapping(value = "/join_OK.do", method = RequestMethod.GET)
	public String join_OK() {
		return "/member/join_OK.user";
	}
	
	/**
	 * 주소팝업 컨트롤러
	 */
	@RequestMapping(value = "/Sample.do", method = RequestMethod.GET)
	public String Sample() {
		return "/member/Sample";
	}
	
	// 아이디 중복 확인(id_check_process.jsp파일은 필요없어짐)
		@RequestMapping(value = "/id_check_process.do", method = RequestMethod.GET)
		@ResponseBody
		public String id_check_process(String mem_id) {
			int result = memberDao.getResultIdCheck(mem_id);

			return String.valueOf(result);
		}
		
		// 로그아웃
		@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			// 세션 종료
			SessionVO svo = (SessionVO) session.getAttribute("svo");
			if (svo != null) {
				session.invalidate();
			}
			return "redirect:/index.do";
		}
		
		/**
		 * 비밀번호 찾기
		 */
		@RequestMapping(value = "/login_Pw.do", method = RequestMethod.GET)
		public String login_Pw() {
			return "/member/login_Pw.user";
		}
		
		@RequestMapping(value = "/login_Pw_proc.do", method = RequestMethod.POST)
	public ModelAndView login_Pw_proc(JoinVO vo) throws Exception {
			ModelAndView mv = new ModelAndView();
		String result = memberDao.getPw(vo);
		if (result != null) {
			mv.addObject("result", result);
			mv.setViewName("/member/login_PwOK.user");
		} else {
			mv.setViewName("/member/login_IdFail.user");
		}

		return mv;
	}
		
		/**
		 * 비밀번호 찾기 성공
		 */
		@RequestMapping(value = "/login_PwOK.do", method = RequestMethod.GET)
		public String login_PwOK() {
			return "/member/login_PwOK.user";
		}
		
		/**
		 * 아이디 찾기
		 */
		@RequestMapping(value = "/login_Id.do", method = RequestMethod.GET)
		public String login_Id() {
			return "/member/login_Id.user";
		}
		
		@RequestMapping(value = "/login_Id_proc.do", method = RequestMethod.POST)
	public ModelAndView login_Id_proc(JoinVO vo) throws Exception {
			ModelAndView mv = new ModelAndView();
		String result = memberDao.getId(vo);
		if (result != null) {
			mv.addObject("result", result);
			mv.setViewName("/member/login_IdOK.user");
		} else {
			mv.setViewName("/member/login_IdFail.user");
		}

		return mv;
	}
		
		/**
		 * 아이디 찾기 성공
		 */
		@RequestMapping(value = "/login_IdOK.do", method = RequestMethod.GET)
		public String login_IdOK() {
			return "/member/login_IdOK.user";
		}
}
