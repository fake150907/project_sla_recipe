package com.sla.project.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Recipe {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String title;
	private String body;
	private int hitCount;
	private int goodReactionPoint;
	private int badReactionPoint;
	private int categoryId;
	private int personnel;
	private int cookingTime;
	private int cookLevel;
	private List<Ingredient> ingredients;
	private List<CookWare> cookWares;
	
	private int extra__repliesCnt;
	private String extra__writer;

	private boolean userCanModify;
	private boolean userCanDelete;

}
