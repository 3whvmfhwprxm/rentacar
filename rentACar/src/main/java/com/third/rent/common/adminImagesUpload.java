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
public class adminImagesUpload {
	
	@Resource(name="fileUploadProperties")
	private Properties fileProperties;

	public static final int FILE_UPLOAD = 1;
	public static final int companyLogo_UPLOAD = 2;
	public static final int carImg_UPLOAD = 3;
		
	private static final Logger logger
		= LoggerFactory.getLogger(adminImagesUpload.class);
	
	public List<Map<String, Object>> companyLogoUpload(HttpServletRequest request, int uploadWhat){
		
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();
		
 		Iterator<String> iter = fileMap.keySet().iterator();
 		while(iter.hasNext()){
 			String key = iter.next();
  			MultipartFile tempFile = fileMap.get(key);
  			
  			if(!tempFile.isEmpty()){
  				String origincomLogo = tempFile.getOriginalFilename();
  				String comLogo = getUniqueFileName(origincomLogo);
 				
  				String savePath = getLogoUploadPath(request, uploadWhat); 
  				File file = new File(savePath, comLogo);
  				try {
  					if(!file.exists()){
  						file.mkdirs();
  					}
					tempFile.transferTo(file);
					logger.info("파일 업로드 완료! 업로드 경로={}, 파일명={}", savePath, comLogo);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
  				  				
  				Map<String, Object> map = new HashMap<String, Object>();
  				map.put("comLogo", comLogo);
  				map.put("origincomLogo", origincomLogo);
  				
  				fileList.add(map);
  			}
 		}
 		
 		return fileList;
	}
	
	public String getLogoUploadPath(HttpServletRequest request, int uploadWhat){
		String type = "test";
		
		String upPath = "", dir = "";
		if(type.equals("test")){
			if(uploadWhat==FILE_UPLOAD){
				upPath = fileProperties.getProperty("companyLogoUpload.upload.path.test");
			}else if(uploadWhat==companyLogo_UPLOAD){
				upPath = "C:\\Users\\User\\git\\rentacar\\rentACar\\src\\main\\webapp\\companyLogo";
				/*upPath = "companyLogo.upload.path.test";*/
			}
			
		}else{
			if(uploadWhat==FILE_UPLOAD){
				dir = fileProperties.getProperty("companyLogoUpload.upload.path");				
			}else if(uploadWhat==companyLogo_UPLOAD){
				dir = fileProperties.getProperty("companyLogo.upload.path");
			}
			upPath = request.getSession().getServletContext().getRealPath(dir);			
		}
		
		return upPath;		
	}
	
	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	public List<Map<String, Object>> carImgUpload(HttpServletRequest request, int uploadWhat){
		
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();
		
 		Iterator<String> iter = fileMap.keySet().iterator();
 		while(iter.hasNext()){
 			String key = iter.next();
  			MultipartFile tempFile = fileMap.get(key);
  			
  			if(!tempFile.isEmpty()){
  				String originCarImg = tempFile.getOriginalFilename();
  				String carImg = getUniqueFileName(originCarImg);
 				
  				String savePath = getcarImgUploadPath(request, uploadWhat); 
  				File file = new File(savePath, carImg);
  				try {
  					if(!file.exists()){
  						file.mkdirs();
  					}
					tempFile.transferTo(file);
					logger.info("파일 업로드 완료! 업로드 경로={}, 파일명={}", savePath, carImg);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
  				  				
  				Map<String, Object> map = new HashMap<String, Object>();
  				map.put("carImg", carImg);
  				map.put("originCarImg", originCarImg);
  				
  				fileList.add(map);
  			}
 		}
 		
 		return fileList;
	}
	
	public String getcarImgUploadPath(HttpServletRequest request, int uploadWhat){
		String type = "test";
		
		String upPath = "", dir = "";
		if(type.equals("test")){
			if(uploadWhat==FILE_UPLOAD){
				upPath = fileProperties.getProperty("carImagesUpload.upload.path.test");
			}else if(uploadWhat==carImg_UPLOAD){
				upPath = "C:\\Users\\User\\git\\rentacar\\rentACar\\src\\main\\webapp\\carImages";
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
