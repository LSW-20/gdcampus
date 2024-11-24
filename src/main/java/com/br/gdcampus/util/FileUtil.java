package com.br.gdcampus.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class FileUtil {
	
	public Map<String,String> fileupload(MultipartFile uploadFile, String folderName) {
		
        // 1) 업로드할 폴더 (/upload/yyyyMMdd)
		
        // 서비스별로 첨부파일이 저장될 폴더를 구분해서 저장하는 것이 좋다. folderName 변수로 구분한다. board, notice 등..
		String filePath = "/upload/" + folderName + new SimpleDateFormat("/yyyyMMdd").format(new Date());
        
        
        File filePathDir = new File("C:" + filePath); // 스프링 때는 "C:"를 붙이지 않았다. 외부 톰캣을 사용했기 때문에 /만 해도 C를 찾았다. 스프링 부트는 내장 톰캣을 사용해서 따로 적어줘야 한다.
        if(!filePathDir.exists()) { // 해당 경로의 폴더가 존재하지 않을 경우
           filePathDir.mkdirs();   // 해당 폴더 만들기
        }
        
           
        
        // 2) 파일명 수정 작업 
        
        // 원본파일명
        String originalFilename = uploadFile.getOriginalFilename(); //"xxxx.jpg" | "xxxx.tar.gz"
        // 원본파일명에서 확장자 추출하기
        String originalExt = originalFilename.endsWith(".tar.gz") ? ".tar.gz" 
                                             : originalFilename.substring(originalFilename.lastIndexOf("."));
        // db에 업로드될 파일명
        String filesystemName = UUID.randomUUID().toString().replace("-", "") + originalExt; // UUID.randomUUID().toString() : 랜덤값 발생 (32자리 + -4개)
        
        
        // 3) 업로드 (폴더에 파일 저장)
        try {
           uploadFile.transferTo(new File(filePathDir, filesystemName));
           
        } catch (IllegalStateException | IOException e) {
           e.printStackTrace();
        }
        
        // Map에 담아서 호출한 곳으로 DB에 기록할 데이터를 반환한다.
        Map<String,String> map = new HashMap<>();
        map.put("filePath", filePath);
        map.put("originalName", originalFilename);
        map.put("filesystemName", filesystemName);
        
        return map;
        
	}
}
