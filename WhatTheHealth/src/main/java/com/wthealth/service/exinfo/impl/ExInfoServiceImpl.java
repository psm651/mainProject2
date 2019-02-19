package com.wthealth.service.exinfo.impl;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.common.URLConnection;
import com.wthealth.domain.Post;
import com.wthealth.domain.Weather;
import com.wthealth.service.exinfo.ExInfoDao;
import com.wthealth.service.exinfo.ExInfoService;


@Service("exInfoServiceImpl")
public class ExInfoServiceImpl implements ExInfoService {

	//Field
	@Autowired
	@Qualifier("exInfoDaoImpl")
	private ExInfoDao exInfoDao;
	public void setExInfoDao(ExInfoDao exInfoDao) {
		this.exInfoDao = exInfoDao;
	}
	
	//Constructor
	public ExInfoServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addExInfo(Post post) throws Exception {
		exInfoDao.addExInfo(post);
	}
	
	
	@Override
	public void updateExInfo(Post post) throws Exception {
		exInfoDao.updateExInfo(post);
	}
	
	@Override
	public Post getExInfo(int postNo) throws Exception {
		return exInfoDao.getExInfo(postNo);
	}

	@Override
	public Map<String, Object> listExInfo(Search search) throws Exception {
		
		List<Post> list = exInfoDao.listExInfo(search);
		
		int totalCount = exInfoDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	@Override
	public Map<String, Object> listWeatherRecom(String mainCityName) throws Exception {
		
	
		//서울의 위도와 경도
        String urlstr = "http://api.openweathermap.org/data/2.5/weather?"
                + "q="+mainCityName+"&appid=d61d8ae1c0822fa84c4234c5c5a5f290";   
        
        System.out.println(urlstr);
        URL url = new URL(urlstr);
        BufferedReader bf;
        String line;
        String result="";

        //날씨 정보를 받아온다.
        bf = new BufferedReader(new InputStreamReader(url.openStream()));

        //버퍼에 있는 정보를 문자열로 변환.
        while((line=bf.readLine())!=null){
            result=result.concat(line);
        }

        //문자열을 JSON으로 파싱
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(result);

 
        //도시코드 출력
        String cityID = (String)jsonObj.get("id").toString();
       
        //지역 출력
        String cityName = (String)jsonObj.get("name");
        cityName = cityName.replaceAll(" ", "");
       


  
        //날씨 출력
        JSONArray weatherArray = (JSONArray) jsonObj.get("weather");
        JSONObject obj = (JSONObject) weatherArray.get(0);

        String weatherCode= (String) obj.get("id").toString();
        String subWeatherCode = weatherCode.substring(0, 1);
        System.out.println(weatherCode+":::::::코드자르기::::::"+subWeatherCode);
        
        InputStream  inputStream = null;
        String currentWeather = null;
        
        try {
        Properties prop = new Properties();
        String fileName = "config/weatherTranslation.properties";
        
        inputStream = getClass().getClassLoader().getResourceAsStream(fileName);
        	if(inputStream != null) {
        		prop.load(inputStream);
        	}else {
        		throw new FileNotFoundException("property file '" + fileName + "' not found in the classpath");
        	}
        		currentWeather = prop.getProperty(weatherCode);
        		cityName = prop.getProperty(cityName);
        		System.out.println("current : " +currentWeather);
        }catch(Exception e){
        	e.printStackTrace();
        }finally {
        	inputStream.close();
        }
        
        	
        //온도 출력(절대온도라서 변환 필요)
        JSONObject mainArray = (JSONObject) jsonObj.get("main");
        double ktemp = Double.parseDouble(mainArray.get("temp").toString());
        String temp = String.format("%.2f\n", ktemp-273.15);
        double temperature = Double.parseDouble(temp);
        
        Weather weather = new Weather();
        weather.setCityName(cityName);
        weather.setCurrentWeather(currentWeather);
        weather.setTemperature(temperature);
        weather.setCityID(cityID);
        //Cloud, Rain
        
	    System.out.println(weather);
        
        bf.close();
        
        
        List<Post> weatherRecom = exInfoDao.listWeatherRecom(weather);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("weather", weather);
        map.put("weatherRecom", weatherRecom);
        map.put("weatherCode",subWeatherCode);
        
		return map;
	}

	@Override
	public void deleteStatus(String postNo) throws Exception {
		exInfoDao.deleteStatus(postNo);
		
	}
	
   @Override
   public Map<String, Object> listExInfoRecom(Search search) throws Exception {
      List<Post> exInfoList = exInfoDao.listExInfoRecom(search);
      int totalCount = exInfoDao.getTotalCount(search);
      
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("exInfoList", exInfoList);
      map.put("totalCount", new Integer(totalCount));
      return map;
   }
	   

}
