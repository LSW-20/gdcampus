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
        //게시판용, ~~용, 폴더를 나눠서 저장하는 게 좋음board, 서명, 프로필....을 위해 매개변수
        //folderName으로 새로 받음
		String filePath = "/upload/" + folderName + new SimpleDateFormat("/yyyyMMdd").format(new Date());
        
        
        File filePathDir = new File("C:" + filePath);
        if(!filePathDir.exists()) { // 해당 경로의 폴더가 존재하지 않을 경우
           filePathDir.mkdirs();   // 해당 폴더 만들기
        }
           
        // 2) 파일명 수정 작업 
        String originalFilename = uploadFile.getOriginalFilename(); //"xxxx.jpg" | "xxxx.tar.gz"
        String originalExt = originalFilename.endsWith(".tar.gz") ? ".tar.gz" 
                                             : originalFilename.substring(originalFilename.lastIndexOf("."));
        
        // UUID.randomUUID().toString() : 랜덤값 발생 (32자리 + -4개)
        String filesystemName = UUID.randomUUID().toString().replace("-", "") + originalExt;
        
        
        // 3) 업로드 (폴더에 파일 저장)
        try {
           uploadFile.transferTo(new File(filePathDir, filesystemName));
        } catch (IllegalStateException | IOException e) {
           e.printStackTrace();
        }
        
        //DB에 기록할 데이터 다시 반환(Map에 담아서)
        Map<String,String> map = new HashMap<>();
        map.put("filePath", filePath);
        map.put("originalName", originalFilename);
        map.put("filesystemName", filesystemName);
        return map;
	}
}
