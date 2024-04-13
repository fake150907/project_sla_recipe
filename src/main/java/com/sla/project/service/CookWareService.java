package com.sla.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sla.project.repository.CookWareRepository;
import com.sla.project.util.Ut;
import com.sla.project.vo.CookWare;
import com.sla.project.vo.CookWareList;
import com.sla.project.vo.ResultData;

@Service
public class CookWareService {

	@Autowired
	private CookWareRepository cookWareRepository;

	public CookWareService(CookWareRepository cookWareRepository) {
		this.cookWareRepository = cookWareRepository;
	}

	public List<CookWare> getForPrintCookWares(int loginedMemberId, int recipeId) {
		List<CookWare> cookWares = cookWareRepository.getForPrintCookWares(loginedMemberId, recipeId);

		return cookWares;
	}

	public void writeCookWare(int loginedMemberId, CookWareList cookWares) {

		int id = cookWareRepository.getLastInsertId();

		cookWareRepository.writeCookWare(loginedMemberId, cookWares.getCookWares());

	}

	public CookWare getCookWare(int id) {
		return cookWareRepository.getCookWare(id);
	}

	public ResultData deleteCookWare(int id) {
		cookWareRepository.deleteCookWare(id);
		return ResultData.from("S-1", Ut.f("%d번 댓글을 삭제했습니다", id));
	}

	public void modifyCookWare(int id, String body) {
		cookWareRepository.modifyCookWare(id, body);
	}
}
