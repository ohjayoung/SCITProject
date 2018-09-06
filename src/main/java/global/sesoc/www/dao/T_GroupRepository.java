package global.sesoc.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_Group;

@Repository
public class T_GroupRepository {
	@Autowired
	SqlSession session;
	
	public int insertGroup(T_Group group) {
		T_GroupMapper mapper=session.getMapper(T_GroupMapper.class);
		int result=mapper.insertGroup(group);
		return result;
	}
	
	public List<T_Group> selectAllGroup(){
		T_GroupMapper mapper=session.getMapper(T_GroupMapper.class);
		List<T_Group>list=mapper.selectAllGroup();
		return list;
	}
	public T_Group selectOneGroup(T_Group group) {
		T_GroupMapper mapper=session.getMapper(T_GroupMapper.class);
		T_Group g=mapper.selectOneGroup(group);
		return g;
	}
	public List<T_Group> selectMyGroupList(T_Group group){
		T_GroupMapper mapper=session.getMapper(T_GroupMapper.class);
		List<T_Group> list=mapper.selectMyGroupList(group);
		return list;
	}
}
