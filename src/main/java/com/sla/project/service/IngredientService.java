package com.sla.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sla.project.repository.IngredientRepository;
import com.sla.project.repository.ReplyRepository;
import com.sla.project.util.Ut;
import com.sla.project.vo.Reply;
import com.sla.project.vo.ResultData;

public class IngredientService {

	@Autowired
	private IngredientRepository ingredientRepository;

	public IngredientService(IngredientRepository ingredientRepository) {
		this.ingredientRepository = ingredientRepository;
	}

	public List<ingredient> getForPrintIngredients(int loginedMemberId, String relTypeCode, int relId) {
		List<Reply> replies = ingredientRepository.getForPrintIngredients(loginedMemberId, relTypeCode, relId);

		for (Reply ingredient : replies) {
			controlForPrintData(loginedMemberId, ingredient);
		}

		return replies;
	}

	public ResultData<Integer> writeReply(int loginedMemberId, String relTypeCode, int relId, String body) {
		ingredientRepository.writeReply(loginedMemberId, relTypeCode, relId, body);

		int id = ingredientRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 댓글이 생성되었습니다", id), "id", id);
	}

	private void controlForPrintData(int loginedMemberId, Reply ingredient) {
		if (ingredient == null) {
			return;
		}
		ResultData userCanModifyRd = userCanModify(loginedMemberId, ingredient);
		ingredient.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, ingredient);
		ingredient.setUserCanDelete(userCanDeleteRd.isSuccess());
	}

	public ResultData userCanDelete(int loginedMemberId, Reply ingredient) {

		if (ingredient.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 삭제 권한이 없습니다", ingredient.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 댓글이 삭제 되었습니다", ingredient.getId()));
	}

	public ResultData userCanModify(int loginedMemberId, Reply ingredient) {

		if (ingredient.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 수정 권한이 없습니다", ingredient.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 댓글을 수정했습니다", ingredient.getId()));
	}

	public Reply getReply(int id) {
		return ingredientRepository.getReply(id);
	}

	public ResultData deleteReply(int id) {
		ingredientRepository.deleteReply(id);
		return ResultData.from("S-1", Ut.f("%d번 댓글을 삭제했습니다", id));
	}

	public void modifyReply(int id, String body) {
		ingredientRepository.modifyReply(id, body);
	}
}
