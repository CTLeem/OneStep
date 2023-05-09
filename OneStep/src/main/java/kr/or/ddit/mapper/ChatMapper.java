package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.chat.vo.ChatVO;
import kr.or.ddit.chat.vo.ChatroomVO;
import kr.or.ddit.member.vo.MemberVO;

public interface ChatMapper {

	public List<ChatVO> chatDetail(Map<String, Object> paramMap);

	public void insertChat(Map<String, String> param);

	public List<MemberVO> chatMember(Map<String, String> param);

	public List<MemberVO> selectChatList(Map<String, Object> param);

}
