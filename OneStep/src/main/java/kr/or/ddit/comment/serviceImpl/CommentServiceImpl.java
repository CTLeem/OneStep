package kr.or.ddit.comment.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements ICommentService{

	@Inject
	private CommentMapper mapper;
	
	
	@Override
	public void insertComment(CommentVO commVO) {
		mapper.insertComment(commVO);
	}


	@Override
	public List<CommentVO> commentList(int boardId) {
		return mapper.commentList(boardId);
	}

	@Override
	public void modifyComment(CommentVO commentVO) {
		mapper.modifyComment(commentVO);
		
	}


	@Override
	public int commDelete(int commId) {
		return mapper.commDelete(commId);
	}





}
