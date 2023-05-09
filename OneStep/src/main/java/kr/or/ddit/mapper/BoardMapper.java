package kr.or.ddit.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.vo.AttVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportVO;

public interface BoardMapper {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);
	public int insertBoard(BoardVO boardVO);
	public void incrementHit(int boardId);
	public BoardVO selectBoard(int boardId);

	public int updateBoard(BoardVO boardVO);
	public int deleteBoard(int boardId);
	
	//파일 업로드 
	public AttVO selectBoardFile(Integer integer);
	public void deleteBoardFile(Integer integer);
	public void deleteBoardFileByBoardId(int boardId);
	public void insertBoardFile(AttVO attVO);
	
	// 다운로드 횟수와, 다운로드 가능하게 하는 메소드 
	public AttVO boardDownload(int attId);
	public void incrementBoardDowncount(int attId);
	public void insertReport(ReportVO reportVO);

}
