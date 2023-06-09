package kr.or.ddit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVO {
	private int reportId;
	private String reportMem;
	private Date reportDate;
	private int reportStatus;
	private String reportContent;
	private String commId;
	private String boardId;
	private String memId;
	private int boardCategory;
	private String boardTitle;
	private String boardContent;
}
