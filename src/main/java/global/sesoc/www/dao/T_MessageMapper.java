package global.sesoc.www.dao;

import java.util.List;

import global.sesoc.www.dto.T_Message;
import global.sesoc.www.dto.T_MessageRoom;

public interface T_MessageMapper {
	public List<T_Message> messageList(T_Message message);
	//소켓에 접속한 아이티 테이블에 넣기
	public int addUser(T_MessageRoom chat);
	//메세지 저장
	public int addMessage(T_Message msg);
	//소켓 접속 끊은 사람 테이블에서 제거
	public int deleteUser(String id);
	//메세지삭제
	public int msgDelete(T_Message message);
	//메세지 갯수카운트
	public int msgCount(String userId);
	//메세지 확인시 확인으로 컬럼 업데이트
	public int updateMsg(String userId);
}
