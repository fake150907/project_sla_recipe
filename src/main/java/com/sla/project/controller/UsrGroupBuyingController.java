
package com.sla.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sla.project.service.GroupBuyingService;
import com.sla.project.service.BoardService;
import com.sla.project.service.ReactionPointService;
import com.sla.project.service.ReplyService;
import com.sla.project.util.Ut;
import com.sla.project.vo.GroupBuying;
import com.sla.project.vo.Board;
import com.sla.project.vo.ResultData;
import com.sla.project.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrGroupBuyingController {

	@Autowired
	private Rq rq;

	@Autowired
	private GroupBuyingService groupBuyingService;

	@Autowired
	private ReactionPointService reactionPointService;
	@Autowired
	private UsrReplyController usrReplyController;
	@Autowired
	private ReplyService replyService;

	public UsrGroupBuyingController() {

	}

	@RequestMapping("/usr/groupBuying/location")
	public String showLocationPage() {

		return "/usr/groupBuying/location";
	}

	@RequestMapping("/usr/groupBuying/locationTest")
	public String showLocationTestPage() {

		return "/usr/groupBuying/locationTest";
	}

	// 액션 메서드
	@RequestMapping("/usr/groupBuying/list")
	public String showList(HttpServletRequest req, Model model,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		String address1 = "탄방동";
		String address2 = "둔산동";
		String address3 = "갈마동";
		List<GroupBuying> groupBuyingsByAddress1 = groupBuyingService
				.getForPrintGroupBuyingsByMemberLocationTag(address1, searchKeywordTypeCode, searchKeyword);
		List<GroupBuying> groupBuyingsByAddress2 = groupBuyingService
				.getForPrintGroupBuyingsByMemberLocationTag(address2, searchKeywordTypeCode, searchKeyword);
		List<GroupBuying> groupBuyingsByAddress3 = groupBuyingService
				.getForPrintGroupBuyingsByMemberLocationTag(address3, searchKeywordTypeCode, searchKeyword);

		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("address1", address1);
		model.addAttribute("address2", address2);
		model.addAttribute("address3", address3);
		model.addAttribute("groupBuyingsByAddress1", groupBuyingsByAddress1);
		model.addAttribute("groupBuyingsByAddress2", groupBuyingsByAddress2);
		model.addAttribute("groupBuyingsByAddress3", groupBuyingsByAddress3);

		return "usr/groupBuying/list";
	}

	@RequestMapping("/usr/groupBuying/listByMemberLocationTag1")
	public String showListByMemberLocationTag1(HttpServletRequest req, Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		String address1 = "탄방동";

		int groupBuyingsCount = groupBuyingService.getGroupBuyingsCountByTag(address1, searchKeywordTypeCode,
				searchKeyword);

		// 한페이지에 글 10개씩이야
		// 글 20개 -> 2 page
		// 글 24개 -> 3 page
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil(groupBuyingsCount / (double) itemsInAPage);

		List<GroupBuying> groupBuyingsByAddress1 = groupBuyingService.getForPrintGroupBuyings(address1, itemsInAPage,
				page, searchKeywordTypeCode, searchKeyword);

		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("groupBuyingsCount", groupBuyingsCount);
		model.addAttribute("address1", address1);
		model.addAttribute("groupBuyingsByAddress1", groupBuyingsByAddress1);

		return "usr/groupBuying/listByMemberLocationTag1";
	}

	@RequestMapping("/usr/groupBuying/listByMemberLocationTag2")
	public String showListByMemberLocationTag2(HttpServletRequest req, Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		String address2 = "둔산동";

		int groupBuyingsCount = groupBuyingService.getGroupBuyingsCountByTag(address2, searchKeywordTypeCode,
				searchKeyword);

		// 한페이지에 글 10개씩이야
		// 글 20개 -> 2 page
		// 글 24개 -> 3 page
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil(groupBuyingsCount / (double) itemsInAPage);

		List<GroupBuying> groupBuyingsByAddress2 = groupBuyingService.getForPrintGroupBuyings(address2, itemsInAPage,
				page, searchKeywordTypeCode, searchKeyword);

		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("groupBuyingsCount", groupBuyingsCount);
		model.addAttribute("address2", address2);
		model.addAttribute("groupBuyingsByAddress2", groupBuyingsByAddress2);

		return "usr/groupBuying/listByMemberLocationTag2";
	}

	@RequestMapping("/usr/groupBuying/listByMemberLocationTag3")
	public String showListByMemberLocationTag3(HttpServletRequest req, Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		String address3 = "갈마동";

		int groupBuyingsCount = groupBuyingService.getGroupBuyingsCountByTag(address3, searchKeywordTypeCode,
				searchKeyword);

		// 한페이지에 글 10개씩이야
		// 글 20개 -> 2 page
		// 글 24개 -> 3 page
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil(groupBuyingsCount / (double) itemsInAPage);

		List<GroupBuying> groupBuyingsByAddress3 = groupBuyingService.getForPrintGroupBuyings(address3, itemsInAPage,
				page, searchKeywordTypeCode, searchKeyword);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("groupBuyingsCount", groupBuyingsCount);
		model.addAttribute("address3", address3);
		model.addAttribute("groupBuyingsByAddress3", groupBuyingsByAddress3);

		return "usr/groupBuying/listByMemberLocationTag3";
	}

	@RequestMapping("/usr/groupBuying/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		GroupBuying groupBuying = groupBuyingService.getForPrintGroupBuying(rq.getLoginedMemberId(), id);

		boolean isAlreadyAddGroupBuyingGoodRp = reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id,
				"groupBuying");
		boolean isAlreadyAddGroupBuyingBadRp = reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id,
				"groupBuying");
		boolean isAlreadyAddReplyGoodRp = reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id, "reply");
		boolean isAlreadyAddReplyBadRp = reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "reply");

		model.addAttribute("groupBuying", groupBuying);
		model.addAttribute("isLogined", rq.isLogined());
		model.addAttribute("isAlreadyAddGroupBuyingGoodRp", isAlreadyAddGroupBuyingGoodRp);
		model.addAttribute("isAlreadyAddGroupBuyingBadRp", isAlreadyAddGroupBuyingBadRp);
		model.addAttribute("isAlreadyAddReplyGoodRp", isAlreadyAddReplyGoodRp);
		model.addAttribute("isAlreadyAddReplyBadRp", isAlreadyAddReplyBadRp);
		model.addAttribute("replies", usrReplyController.showReplyList(req, model, id, "groupBuying"));
		model.addAttribute("loginedMemberId", rq.getLoginedMemberId());

		return "usr/groupBuying/detail";
	}

	@RequestMapping("/usr/groupBuying/doIncreaseHitCountRd")
	@ResponseBody
	public ResultData doIncreaseHitCountRd(int id) {

		ResultData increaseHitCountRd = groupBuyingService.increaseHitCount(id);

		if (increaseHitCountRd.isFail()) {
			return increaseHitCountRd;
		}

		ResultData rd = ResultData.newData(increaseHitCountRd, "hitCount",
				groupBuyingService.getGroupBuyingHitCount(id));
		rd.setData2("id", id);

		return rd;
	}

	@RequestMapping("/usr/groupBuying/write")
	public String showWrite(HttpServletRequest req) {

		return "usr/groupBuying/write";
	}

	@RequestMapping("/usr/groupBuying/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String title, String body, String memberLocationTag,
			String buyingLocation) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(memberLocationTag)) {
			return Ut.jsHistoryBack("F-3", "지역태그를 선택해주세요");
		}
		if (Ut.isNullOrEmpty(buyingLocation)) {
			return Ut.jsHistoryBack("F-4", "지역을 설정해주세요");
		}

		ResultData<Integer> writeGroupBuyingRd = groupBuyingService.writeGroupBuying(rq.getLoginedMemberId(), title,
				body, memberLocationTag, buyingLocation);

		int id = (int) writeGroupBuyingRd.getData1();

		GroupBuying groupBuying = groupBuyingService.getGroupBuying(id);

		return Ut.jsReplace(writeGroupBuyingRd.getResultCode(), writeGroupBuyingRd.getMsg(),
				"../groupBuying/detail?id=" + id);
	}

	@RequestMapping("/usr/groupBuying/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		GroupBuying groupBuying = groupBuyingService.getForPrintGroupBuying(rq.getLoginedMemberId(), id);

		if (groupBuying == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		model.addAttribute("groupBuying", groupBuying);

		return "usr/groupBuying/modify";
	}

	@RequestMapping("/usr/groupBuying/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String title, String body) {
		Rq rq = (Rq) req.getAttribute("rq");

		GroupBuying groupBuying = groupBuyingService.getGroupBuying(id);

		if (groupBuying == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		ResultData loginedMemberCanModifyRd = groupBuyingService.userCanModify(rq.getLoginedMemberId(), groupBuying);

		if (loginedMemberCanModifyRd.isSuccess()) {
			groupBuyingService.modifyGroupBuying(id, title, body);
		}

		return Ut.jsReplace(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(),
				"../groupBuying/detail?id=" + id);
	}

	// 로그인 체크 -> 유무 체크 -> 권한 체크 -> 삭제
	@RequestMapping("/usr/groupBuying/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		GroupBuying groupBuying = groupBuyingService.getGroupBuying(id);

		if (groupBuying == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		ResultData loginedMemberCanDeleteRd = groupBuyingService.userCanDelete(rq.getLoginedMemberId(), groupBuying);

		if (loginedMemberCanDeleteRd.isSuccess()) {
			groupBuyingService.deleteGroupBuying(id);
		}

		return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(),
				"../groupBuying/list");
	}

}
