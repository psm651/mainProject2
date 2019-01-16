package com.wthealth.service.adminmanage;

import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.User;

public interface AdminManageService {

	public Map<String, Object> listUserAdminManage(Search search) throws Exception;
	
	public User getAdminManage(String userId) throws Exception;
	
	public void updateUserAdminManage(User user) throws Exception;
	
	public Map<String, Object> listPointAdminManage(Search search) throws Exception;
	
}
