package com.wthealth.service.adminmanage.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Point;
import com.wthealth.domain.User;
import com.wthealth.service.adminmanage.AdminManageDao;

@Repository("adminManageDaoImpl")
public class AdminManageDaoImpl implements AdminManageDao {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}	
	
	//Constructor
	public AdminManageDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public List<User> listUserAdminManage(Search search) throws Exception {
		return sqlSession.selectList("AdminManageMapper.listUserAdminManage", search);
	}

	@Override
	public User getAdminManage(String userId) throws Exception {
		return sqlSession.selectOne("AdminManageMapper.getAdminManage", userId);
	}

	@Override
	public void updateUserAdminManage(User user) throws Exception {
		sqlSession.update("AdminManageMapper.updateUserAdminManage", user);
	}

	@Override
	public int getUserTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("AdminManageMapper.getUserTotalCount", search);
	}

	@Override
	public List<Point> listPointAdminManage(Search search) throws Exception {
		return sqlSession.selectList("AdminManageMapper.listPointAdminManage", search);
	}

	@Override
	public int getPointTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("AdminManageMapper.getPointTotalCount", search);
	}

	

}
