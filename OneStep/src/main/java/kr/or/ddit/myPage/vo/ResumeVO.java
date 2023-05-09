package kr.or.ddit.myPage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.member.vo.MemberVO;
import lombok.Data;

@Data
public class ResumeVO {
	
	/* 이력서 */
	private int resumeId;									// 이력서번호
	private String resumeTitle;								// 이력서제목
	private String resumeStatus;							// 이력서상태
	private String resumeRepresentative;					// 대표이력서여부
	private List<ActivityVO> activityList;					// 활동
	private List<AwardVO> awardList;						// 수상
	private List<CareerVO> careerList;						// 경력
	private List<CertificationVO> certList;					// 자격증
	private List<DesiredEmplVO> desiredList;				// 희망근무조건
	private List<EducationVO> eduList;						// 학력
	private List<EmploymentPreferencesVO> prfrnList;		// 취업우대사항/병역
	private List<LanguageVO> langList;						// 이력
	private List<SkillVO> skillList;						// 스킬
	private List<PortfolioVO> portfolioList;				// 포트폴리오
	private List<WorkfieldVO> workfieldList;				// 희망직무
	private String resumePhoto;								// 증명사진
	private MultipartFile photoFile;						// 증명사진파일
	private MultipartFile uploadFile;						// 증명사진파일
	private String memId;									// 회원ID
	private String resumeInsertDate;						// 작성날짜
	private String resumeDeleteDate;						// 삭제날짜
	
	private String workfield1;	
	private String desiredSalary;
	private String memName;
	private String memGender;
	
}
