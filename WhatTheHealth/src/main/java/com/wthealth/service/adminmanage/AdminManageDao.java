package com.wthealth.service.adminmanage;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Point;
import com.wthealth.domain.User;

public interface AdminManageDao {
	
	public List<User> listUserAdminManage(Search search) throws Exception;
	
	public User getAdminManage(String userId) throws Exception;
	
	public void updateUserAdminManage(User user) throws Exception;
	
	public int getUserTotalCount(Search search) throws Exception ; 
	
	public int getPointTotalCount(Search search) throws Exception ;
	
	public List<Point> listPointAdminManage(Search search) throws Exception;

}
