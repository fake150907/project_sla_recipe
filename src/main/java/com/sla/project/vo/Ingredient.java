package com.sla.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ingredient {
	private int id;
	private int recipeId;
	private int memberId;
	private String name;
	private String nutrients;
	private String measure;
}
