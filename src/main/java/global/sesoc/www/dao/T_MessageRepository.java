package global.sesoc.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_Message;
import global.sesoc.www.dto.T_MessageRoom;

@Repository
public class T_MessageRepository {
	@Autowired
	SqlSession session;

	public List<T_Message> messageList(T_Message message) {
		T_MessageMapper mapper = session.getMapper(T_MessageMapper.class);
		List<T_Message> cr = mapper.messageList(message);	
		return cr;
	}
	
	public int addUser(T_MessageRoom chat) {
		T_MessageMapper mapper = session.getMapper(T_MessageMapper.class);
		int result = mapper.addUser(chat);
		return result;		
	}
	
	public int addMessage(T_Message msg) {
		T_MessageMapper mapper = session.getMapper(T_MessageMapper.class);
		int result = mapper.addMessage(msg);
		return result;
	}
	
	public int deleteUser(String id) {
		T_MessageMapper mapper = session.getMapper(T_MessageMapper.class);
		int result = mapper.deleteUser(id);
		return result;
	}

	public int msgDelete(T_Message message) {
		T_MessageMapper mapper = session.getMapper(T_MessageMapper.class);
		System.out.println(message);
		int result = mapper.msgDelete(message);
		return result;
	}

	public int msgCount(String userId) {
		T_MessageMapper mapper = session.getMapper(T_MessageMapper.class);
		int result = mapper.msgCount(userId);
		return result;
	}

	public int updateMsg(String userId) {
		T_MessageMapper mapper = session.getMapper(T_MessageMapper.class);
		int result = mapper.updateMsg(userId);
		return result;
	}
}
