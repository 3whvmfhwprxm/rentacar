package com.third.rent.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class adminCarImagesUpload {
	
	private static final Logger logger
		= LoggerFactory.getLogger(adminCarImagesUpload.class);
	
	public static final int FILE_UPLOAD=1;
	public static final int carImg_UPLOAD=2;
		
	@Resource(name="fileUploadProperties")
	private Properties fileProperties;
	
	public List<Map<String, Object>> carImgUpload(HttpServletRequest request, int uploadWhat){
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		
 		Iterator<String> iter = fileMap.keySet().iterator();
 		while(iter.hasNext()){
 			String key = iter.next();
  			MultipartFile tempFile = fileMap.get(key);
  			
  			if(!tempFile.isEmpty()){
  				String originFileName = tempFile.getOriginalFilename();
  				String carImg = getUniqueFileName(originFileName);
  				String carImg2 = getUniqueFileName(originFileName);
  				String carImg3 = getUniqueFileName(originFileName);
  				 				
  				String savePath = getUploadPath(request, uploadWhat); 
  				File file1 = new File(savePath, carImg);
  				File file2 = new File(savePath, carImg2);
  				File file3 = new File(savePath, carImg3);
  				try {
  					if(!file1.exists()){
  						file1.mkdirs();
  					}
					tempFile.transferTo(file1);
					tempFile.transferTo(file2);
					tempFile.transferTo(file3);
					
					logger.info("파일 업로드 완료! savePath={}, carImg={}", savePath, carImg);
					logger.info("파일 업로드 완료! savePath={}, carImg2={}", savePath, carImg2);
					logger.info("파일 업로드 완료! savePath={}, carImg3={}", savePath, carImg3);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
  				  				
  				Map<String, Object> map=new HashMap<String, Object>();
  				map.put("carImg", carImg);
  				map.put("carImg2", carImg2);
  				map.put("carImg3", carImg3);
  				
  				fileList.add(map);
  			}
 		}
 		
 		return fileList;
	}
	
	public String getUploadPath(HttpServletRequest request, int uploadWhat){
		String type = "test";
		
		String upPath = "", dir = "";
		if(type.equals("test")){
			//테스트 경로
			if(uploadWhat==FILE_UPLOAD){
				upPath = fileProperties.getProperty("carImagesUpload.upload.path.test");
			}else if(uploadWhat==carImg_UPLOAD){
				upPath = "carImages.upload.path.test";
			}
			
		}else{
			if(uploadWhat==FILE_UPLOAD){
				dir = fileProperties.getProperty("carImagesUpload.upload.path");				
			}else if(uploadWhat==carImg_UPLOAD){
				dir = fileProperties.getProperty("carImages.upload.path");
			}
			upPath = request.getSession().getServletContext().getRealPath(dir);			
		}
		
		return upPath;		
	}
	
	public String getUniqueFileName(String fName){
		int idx = fName.lastIndexOf(".");
 		String fileNm = fName.substring(0, idx);
 		String ext = fName.substring(idx);
 		
 		return fileNm+"_"+getCurrentTime()+ext;
	}
	
	public String getCurrentTime(){
		Date today = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		return sdf.format(today);
	}
}
