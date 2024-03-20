package com.sla.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sla.project.repository.GroupBuyingRepository;
import com.sla.project.util.Ut;
import com.sla.project.vo.GroupBuying;
import com.sla.project.vo.ResultData;

@Service
public class GroupBuyingService {

	@Autowired
	private GroupBuyingRepository groupBuyingRepository;

	// 서비스 메서드
	public GroupBuying getForPrintGroupBuying(int loginedMemberId, int id) {
		GroupBuying groupBuying = groupBuyingRepository.getForPrintGroupBuying(id);

		controlForPrintData(loginedMemberId, groupBuying);

		return groupBuying;
	}

	private void controlForPrintData(int loginedMemberId, GroupBuying groupBuying) {
		if (groupBuying == null) {
			return;
		}
		ResultData userCanModifyRd = userCanModify(loginedMemberId, groupBuying);
		groupBuying.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, groupBuying);
		groupBuying.setUserCanDelete(userCanDeleteRd.isSuccess());
	}

	public ResultData userCanDelete(int loginedMemberId, GroupBuying groupBuying) {

		if (groupBuying.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 삭제 권한이 없습니다", groupBuying.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", groupBuying.getId()));
	}

	public ResultData userCanModify(int loginedMemberId, GroupBuying groupBuying) {

		if (groupBuying.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", groupBuying.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", groupBuying.getId()));
	}

	public ResultData<Integer> writeGroupBuying(int memberId, String title, String body, String memberLocationTag, String buyingLocation) {
		groupBuyingRepository.writeGroupBuying(memberId, title, body,memberLocationTag,buyingLocation);

		int id = groupBuyingRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	public void deleteGroupBuying(int id) {
		groupBuyingRepository.deleteGroupBuying(id);
	}

	public void modifyGroupBuying(int id, String title, String body) {
		groupBuyingRepository.modifyGroupBuying(id, title, body);
	}

	public GroupBuying getGroupBuying(int id) {
		return groupBuyingRepository.getGroupBuying(id);
	}

	public List<GroupBuying> getGroupBuyings() {
		return groupBuyingRepository.getGroupBuyings();
	}

	public int getGroupBuyingsCount(String searchKeywordTypeCode, String searchKeyword) {
		return groupBuyingRepository.getGroupBuyingsCount(searchKeywordTypeCode, searchKeyword);
	}
//
//	public List<GroupBuying> getForPrintGroupBuyings(int boardId) {
//		return groupBuyingRepository.getForPrintGroupBuyings(boardId);
//	}

	public ResultData increaseHitCount(int id) {
		int affectedRow = groupBuyingRepository.increaseHitCount(id);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "해당 게시물 없음", "id", id);
		}

		return ResultData.from("S-1", "해당 게시물 조회수 증가", "id", id);

	}

	public Object getGroupBuyingHitCount(int id) {
		return groupBuyingRepository.getGroupBuyingHitCount(id);
	}

	public List<GroupBuying> getForPrintGroupBuyings(int itemsInAPage, int page,
			String searchKeywordTypeCode, String searchKeyword) {

//		SELECT * FROM groupBuying WHERE boardId = 1 ORDER BY id DESC LIMIT 0, 10; 1page
//		SELECT * FROM groupBuying WHERE boardId = 1 ORDER BY id DESC LIMIT 10, 10; 2page

		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		return groupBuyingRepository.getForPrintGroupBuyings(limitFrom, limitTake, searchKeywordTypeCode,
				searchKeyword);
	}

	public void increaseGoodRp(int id) {
		groupBuyingRepository.increaseGoodRp(id);
	}

	public void increaseBadRp(int id) {
		groupBuyingRepository.increaseBadRp(id);
	}

	public void decreaseGoodRp(int id) {
		groupBuyingRepository.decreaseGoodRp(id);
	}

	public void decreaseBadRp(int id) {
		groupBuyingRepository.decreaseBadRp(id);
	}

	public int getGoodRpCount(int id) {

		return groupBuyingRepository.getGoodRpCount(id);
	}

	public int getBadRpCount(int id) {
		return groupBuyingRepository.getBadRqCount(id);
	}

}
