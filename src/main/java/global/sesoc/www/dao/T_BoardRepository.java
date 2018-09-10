package global.sesoc.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_Board;

@Repository
public class T_BoardRepository {
	@Autowired
	SqlSession session;
	public int insertBoard(T_Board board) {
		T_BoardMapper mapper=session.getMapper(T_BoardMapper.class);
		int result=mapper.insertBoard(board);
		return result;
	}
	
	public List<T_Board> selectGroNumBoard(int groNum){
		T_BoardMapper mapper=session.getMapper(T_BoardMapper.class);
		List<T_Board> list=mapper.selectGroNumBoard(groNum);
		return list;
	}
}
