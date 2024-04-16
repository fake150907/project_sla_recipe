package com.sla.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.sla.project.service.GenFileService;
import com.sla.project.service.MemberService;
import com.sla.project.util.Ut;
import com.sla.project.vo.Member;
import com.sla.project.vo.ResultData;
import com.sla.project.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrMemberController {

	@Autowired
	private Rq rq;

	@Autowired
	private MemberService memberService;

	@Autowired
	private GenFileService genFileService;

	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그아웃 상태입니다");
		}

		rq.logout();

		return Ut.jsReplace("S-1", "로그아웃 되었습니다", "/");
	}

	@RequestMapping("/usr/member/login")
	public String showLogin(HttpServletRequest req) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		return "usr/member/login";
	}

	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s(은)는 존재하지 않는 아이디입니다", loginId));
		}
		System.out.println(Ut.sha256(loginPw));

		if (member.getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-4", Ut.f("비밀번호가 일치하지 않습니다"));
		}

		/*
		 * if (member.getLoginPw().equals(Ut.sha256(loginPw)) == false) { return
		 * Ut.jsHistoryBack("F-4", Ut.f("비밀번호가 일치하지 않습니다!!!!!")); }
		 */
		rq.login(member);

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "/");
	}

	@RequestMapping("/usr/member/join")
	public String showJoin(HttpServletRequest req, Model model) {
		int currentId = memberService.getCurrentMemberId();

		model.addAttribute("currentId", currentId);

		return "usr/member/join";
	}

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpServletRequest req, String JoinId, String JoinPw, String JoinName, String JoinNickName,
			String JoinCellPhoneNum, String JoinEmail, MultipartRequest multipartRequest) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 상태입니다");
		}
		if (Ut.isNullOrEmpty(JoinId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(JoinPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(JoinName)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(JoinNickName)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}

		if (Ut.isNullOrEmpty(JoinCellPhoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(JoinEmail)) {
			return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
		}

		ResultData<Integer> joinRd = memberService.join(JoinId, JoinPw, JoinName, JoinNickName, JoinCellPhoneNum,
				JoinEmail);

		if (joinRd.isFail()) {
			return Ut.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
		}

		Member member = memberService.getMember(joinRd.getData1());

		int id = joinRd.getData1();

		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		return Ut.jsReplace(joinRd.getResultCode(), joinRd.getMsg(), "../member/login");
	}

	@RequestMapping("/usr/member/loginIdConfirm")
	@ResponseBody
	public Map<String, Object> loginIdConfirm(HttpServletRequest req, String JoinId, String loginPw, String name,
			String nickname, String cellphoneNum, String email) {
		Rq rq = (Rq) req.getAttribute("rq");
		Member existsMember = memberService.getMemberByLoginId(JoinId);

		Map<String, Object> rs = new HashMap<>();

		if (existsMember != null) {

			rs.put("msg", Ut.f("*이미 사용중인 아이디(%s)입니다", JoinId));
			rs.put("code", "F-7");

			return rs;
		}

		rs.put("code", "S-1");
		rs.put("msg", "*사용가능한 아이디입니다.");

		return rs;
	}

	@RequestMapping("/usr/member/checkPw")
	public String showCheckPw() {

		return "usr/member/checkPw";
	}

	@RequestMapping("/usr/member/doCheckPw")
	public String doCheckPw(String loginPw) {

		if (Ut.isNullOrEmpty(loginPw)) {
			return rq.historyBackOnView("비번 입력해");
		}

		if (rq.getLoginedMember().getLoginPw().equals(Ut.sha256(loginPw)) == false) {
			return rq.historyBackOnView("비번 틀림");
		}

		return "usr/member/modify";
	}

	@RequestMapping("/usr/member/myPage")
	public String showMyPage(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		String relTypeCode = "member";
		model.addAttribute("relTypeCode", relTypeCode);
		model.addAttribute("loginedMemberId", rq.getLoginedMemberId());

		return "usr/member/myPage";
	}

	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		Rq rq = (Rq) req.getAttribute("rq");

		// 비밀번호 안바꿀 수도 있어서 비번 null 체크는 제거

		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");

		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
		}

		ResultData modifyRd;

		if (Ut.isNullOrEmpty(loginPw)) {
			modifyRd = memberService.modifyWithoutPw(rq.getLoginedMemberId(), name, nickname, cellphoneNum, email);
		} else {
			modifyRd = memberService.modify(rq.getLoginedMemberId(), loginPw, name, nickname, cellphoneNum, email);
		}

		return Ut.jsReplace(modifyRd.getResultCode(), modifyRd.getMsg(), "../member/myPage");
	}

	@RequestMapping("/usr/member/findLoginId")
	public String showFindLoginId() {

		return "usr/member/findLoginId";
	}

	@RequestMapping("/usr/member/doFindLoginId")
	@ResponseBody
	public String doFindLoginId(@RequestParam(defaultValue = "/") String afterFindLoginIdUri, String name,
			String email) {

		Member member = memberService.getMemberByNameAndEmail(name, email);

		if (member == null) {
			return Ut.jsHistoryBack("F-1", "너는 없는 사람이야");
		}

		return Ut.jsReplace("S-1", Ut.f("너의 아이디는 [ %s ] 야", member.getLoginId()), afterFindLoginIdUri);
	}

	@RequestMapping("/usr/member/findLoginPw")
	public String showFindLoginPw() {

		return "usr/member/findLoginPw";
	}

	@RequestMapping("/usr/member/doFindLoginPw")
	@ResponseBody
	public String doFindLoginPw(@RequestParam(defaultValue = "/") String afterFindLoginPwUri, String loginId,
			String email) {

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-1", "너는 없는 사람이야");
		}

		if (member.getEmail().equals(email) == false) {
			return Ut.jsHistoryBack("F-2", "일치하는 이메일이 없는데?");
		}

		ResultData notifyTempLoginPwByEmailRd = memberService.notifyTempLoginPwByEmail(member);

		return Ut.jsReplace(notifyTempLoginPwByEmailRd.getResultCode(), notifyTempLoginPwByEmailRd.getMsg(),
				afterFindLoginPwUri);
	}
}