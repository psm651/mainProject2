package com.wthealth.service.community.impl;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.community.CommunityDao;
import com.wthealth.service.community.CommunityService;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addExCom(Post post) throws Exception {
		System.out.println("dsfsd");
		communityDao.addExCom(post);
	}
	
	@Override
	public void addDietCom(Post post) throws Exception {
		communityDao.addDietCom(post);
	}
	
	@Override
	public Post getCommunity(int postNo) throws Exception {
		return communityDao.getCommunity(postNo);
	}


	@Override
	public Map<String, Object> listExCom(Search search) throws Exception {
		List<Post> list = communityDao.listExCom(search);
		int totalCount = communityDao.getTotalCountForEC(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	
	@Override
	public Map<String, Object> listDietCom(Search search) throws Exception {
		List<Post> list = communityDao.listDietCom(search);
		int totalCount = communityDao.getTotalCountForDC(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public void updateCommunity(Post post) throws Exception {
		communityDao.updateCommunity(post);
	}

	@Override
	public void updateClickCount(Post post) throws Exception {
		communityDao.updateClickCount(post);
	}
	
	@Override
	public void updateLikeCount(Post post) throws Exception {
		communityDao.updateLikeCount(post);
	}

	@Override
	public void deleteCommunity(int postNo) throws Exception {
		communityDao.deleteCommunity(postNo);
	}

	@Override
	public Map<String, Object> listExComRecom(Search search) throws Exception {
		List<Post> exComList = communityDao.listExComRecom(search);
		int totalCount = communityDao.getTotalCountForEC(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("exComList", exComList);
		map.put("totalCount", new Integer(totalCount));
		return map;
		
	}
	
	@Override
	public Map<String, Object> listDietComRecom(Search search) throws Exception {
		List<Post> dietComList = communityDao.listDietComRecom(search);
		int totalCount = communityDao.getTotalCountForDC(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("dietComList", dietComList);
		map.put("totalCount", new Integer(totalCount));
		return map;
		
	}

}
