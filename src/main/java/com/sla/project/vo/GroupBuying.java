package com.sla.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupBuying {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String title;
	private String body;
	private String memberLocationTag;
	private String buyingLocation;

	private int extra__groupBuyingCnt;
	private String extra__writer;

	private boolean userCanModify;
	private boolean userCanDelete;
}
