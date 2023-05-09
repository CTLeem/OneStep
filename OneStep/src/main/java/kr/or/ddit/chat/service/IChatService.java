package kr.or.ddit.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.chat.vo.ChatVO;
import kr.or.ddit.chat.vo.ChatroomVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.profile.vo.ProfileVO;

public interface IChatService {

	public List<ChatVO> chatDetail(Map<String, Object> param);

	public void insertChat(Map<String, String> param);

	public List<MemberVO> chatMember(Map<String, String> param);

	public List<MemberVO> selectChatList(Map<String, Object> param);


}
