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
public class UserFileUploadWebUtil {
	
	private static final Logger logger=LoggerFactory.getLogger(UserFileUploadWebUtil.class);
	
	//파일 업로드 관련 상수
	public static final int FILE_UPLOAD=1;	//자료실 - 파일업로드
	public static final int IMAGE_UPLOAD=2; //상품등록 - 이미지 업로드
		
	@Resource(name="fileUploadProperties")
	private Properties fileProperties;
	//context-common.xml에서 fileUploadProperties 이름으로 등록된 bean객체를 주입하는것 @Autowired와 같은 역할을 한다
	
	public  List<Map<String, Object>> evtImgUpload(HttpServletRequest request, int uploadWhat){
		//파일 업로드 처리
		
		//업로드 처리를 위해 MultipartHttpServletRequest로 다운 캐스팅
		MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap=multiRequest.getFileMap();
		//jsp 폼태그 안속 input type="file" name="여기 이름이 키값이 된다"
		
		//업로드한 파일들의 정보를 담을 List(파일 자체가 아니라 파일이름이나, 파일사이즈 같은내용)
		List<Map<String, Object>> fileList=new ArrayList<Map<String,Object>>();
		
 		Iterator<String> iter = fileMap.keySet().iterator();
 		while(iter.hasNext()){
 			String key = iter.next();
  			MultipartFile tempFile = fileMap.get(key);
  			
  			//파일이 업로드된 경우
  			if(!tempFile.isEmpty()){
  				String originFileName = tempFile.getOriginalFilename();
  				//이름이 중복되는 경우 파일명 변경하기
  				String fileName = getUniqueFileName(originFileName);
  				
  				long fileSize=tempFile.getSize();
  				
  				//파일 업로드 처리
  				//업로드할 경로 구하기  				
  				String savePath= getUploadPath(request, uploadWhat); 
  				File file = new File(savePath, fileName);
  				try {
  					if(!file.exists()){
  						file.mkdirs();
  					}
					tempFile.transferTo(file);
					logger.info("파일 업로드 완료! 업로드 경로:{},파일명:{}", savePath, fileName);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
  				  				
  				//이미지명을 map에 저장 이런 맵이 여러개 리스트에 저장됨
  				Map<String, Object> map=new HashMap<String, Object>();
  				map.put("img", fileName);
  				
  				//다시 map을 List에 저장
  				fileList.add(map);
  			}
 		}//while
 		
 		return fileList;
	}
	
	public  List<Map<String, Object>> fileUpload(HttpServletRequest request, int uploadWhat){
		//파일 업로드 처리
		
		//업로드 처리를 위해 MultipartHttpServletRequest로 다운 캐스팅
		MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap=multiRequest.getFileMap();
		//jsp 폼태그 안속 input type="file" name="여기 이름이 키값이 된다"
		
		//업로드한 파일들의 정보를 담을 List(파일 자체가 아니라 파일이름이나, 파일사이즈 같은내용)
		List<Map<String, Object>> fileList=new ArrayList<Map<String,Object>>();
		
 		Iterator<String> iter = fileMap.keySet().iterator();
 		while(iter.hasNext()){
 			String key = iter.next();
  			MultipartFile tempFile = fileMap.get(key);
  			
  			//파일이 업로드된 경우
  			if(!tempFile.isEmpty()){
  				String originFileName = tempFile.getOriginalFilename();
  				//이름이 중복되는 경우 파일명 변경하기
  				String fileName = getUniqueFileName(originFileName);
  				
  				long fileSize=tempFile.getSize();
  				
  				//파일 업로드 처리
  				//업로드할 경로 구하기  				
  				String savePath= getUploadPath(request, uploadWhat); 
  				File file = new File(savePath, fileName);
  				try {
  					if(!file.exists()){
  						file.mkdirs();
  					}
					tempFile.transferTo(file);
					logger.info("파일 업로드 완료! 업로드 경로:{},파일명:{}", savePath, fileName);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
  				  				
  				//파일명과 파일크기를 먼저 map에 저장
  				Map<String, Object> map=new HashMap<String, Object>();
  				map.put("fileName", fileName);
  				map.put("fileSize", fileSize);
  				map.put("originalFileName", originFileName);
  				
  				//다시 map을 List에 저장
  				fileList.add(map);
  			}
 		}//while
 		
 		return fileList;
	}
	
	public String getUploadPath(HttpServletRequest request, int uploadWhat){
		//파일 업로드 경로 구하기
		String type="test";
				//fileProperties.getProperty("file.upload.type");
		
		String upPath="", dir="";
		if(type.equals("test")){
			//테스트 경로
			if(uploadWhat==FILE_UPLOAD){
				upPath=fileProperties.getProperty("file.upload.path.test");
			}else if(uploadWhat==IMAGE_UPLOAD){
				upPath="C:\\Users\\User\\git\\rentacar\\rentACar\\src\\main\\webapp\\user_img";
						//fileProperties.getProperty("imageFile.upload.path.test");
			}
			
		}else{
			//배포시 실제 경로
			if(uploadWhat==FILE_UPLOAD){
				dir = fileProperties.getProperty("file.upload.path");				
			}else if(uploadWhat==IMAGE_UPLOAD){
				dir = fileProperties.getProperty("imageFile.upload.path");
			}
			upPath=request.getSession().getServletContext().getRealPath(dir);			
		}
		
		return upPath;		
	}
	
	public String getUniqueFileName(String fName){
		//파일명이 중복되지 않도록 파일명 이름 변경
		//ab.txt => ab_20170404152650123.txt
		//=> 순수 파일명과 확장자사이에 현재시간(밀리초) 추가
		int idx = fName.lastIndexOf(".");
 		String fileNm = fName.substring(0, idx);  //ab
 		String ext = fName.substring(idx);  //.txt
 		
 		return fileNm+"_"+getCurrentTime()+ext;
	}
	
	public String getCurrentTime(){
		Date today = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		return sdf.format(today);
	}
}
