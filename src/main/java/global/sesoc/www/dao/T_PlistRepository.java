package global.sesoc.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_Plist;

@Repository
public class T_PlistRepository {
	@Autowired
	SqlSession session;
	public int insertPlist(T_Plist plist) {
		System.out.println(plist);
		T_PlistMapper mapper=session.getMapper(T_PlistMapper.class);
		int result=mapper.insertPlist(plist);
		return result;
	}
	public int deletePlanner_Plist(int plaNum) {
		T_PlistMapper mapper=session.getMapper(T_PlistMapper.class);
		int result=mapper.deletePlanner_Plist(plaNum);
		return result;
	}
}
