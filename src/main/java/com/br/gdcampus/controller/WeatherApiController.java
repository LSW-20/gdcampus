package com.br.gdcampus.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

/*
    @RestController : 기본으로 하위에 있는 메소드들은 모두 @ResponseBody를 가지게 된다.
    @RequestBody : 클라이언트가 요청한 XML/JSON을 자바 객체로 변환해서 전달 받을 수 있다.
    @ResponseBody : 자바 객체를 XML/JSON으로 변환해서 응답 객체의 Body에 실어 전송할 수 있다.
            클라이언트에게 JSON 객체를 받아야 할 경우는 @RequestBody, 자바 객체를 클라이언트에게 JSON으로 전달해야할 경우에는 @ResponseBody 어노테이션을 붙여주면 된다. 
    @ResponseBody를 사용한 경우 View가 아닌 자바 객체를 리턴해주면 된다.
*/
@RestController
@RequestMapping("/api")
public class WeatherApiController {
	
	//02시부터 3시간단위로 날씨 정보 제공
	@GetMapping("/weather")
	public JSONObject restApiGetWeather() throws Exception {
		// 현재 시간 가져오기
        LocalDateTime currentDateTime = LocalDateTime.now();

        // "02시" 기준으로 가장 가까운 3의 배수로 시간 계산
        int hour = currentDateTime.getHour();
        int adjustedHour = 2 + (hour - 2) / 3 * 3;

        // 만약 계산된 시간이 현재 시간보다 이전이라면, 3시간을 더해줍니다.
        if (adjustedHour < hour) {
            adjustedHour += 3;
        }

        // 시간을 정수로 00 분으로 설정하여 시간 포맷팅
        LocalDateTime adjustedDateTime = currentDateTime.withHour(adjustedHour).withMinute(0).withSecond(0).withNano(0);

        // 시간 포맷팅 (HH00)
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH00");
        String formattedBaseTime = adjustedDateTime.toLocalTime().format(timeFormatter);

        // 날짜 포맷팅 (yyyyMMdd)
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        String formattedBaseDate = adjustedDateTime.toLocalDate().format(dateFormatter);

        // URL 생성
        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
                + "?serviceKey=dCbOrM2k31aZBqqmhNxaH%2BfTkBEaBaKDJ4pCDS9M9BUxFkGc2ZZd7sTHBqli%2BfKXm3T7qaXiQ25cx4JuF92uyg%3D%3D"
                + "&dataType=JSON"
                + "&numOfRows=10"
                + "&pageNo=1"
                + "&base_date=" + formattedBaseDate
                + "&base_time=" + formattedBaseTime
                + "&nx=60"
                + "&ny=127";
	    // API 응답 파싱
	    JSONObject result = new JSONObject(); 
	    HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");

	    BufferedReader rd;
	    if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	    } else {
	        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	    }

	    StringBuilder sb = new StringBuilder();
	    String line;
	    while ((line = rd.readLine()) != null) {
	        sb.append(line);
	    }
	    rd.close();
	    conn.disconnect();

	    // 응답을 JSON 형태로 반환
	    JSONParser parser = new JSONParser();
	    result = (JSONObject) parser.parse(sb.toString());

	    // JSON 응답 출력
	    System.out.println("API 응답: " + result);
	    return result;
	}
    
    public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception {
        boolean isPost = false;

        if ("post".equals(type)) {
            isPost = true;
        } else {
            url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
        }

        return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
    }
    
    public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception {
        URL apiURL = new URL(url);

        HttpURLConnection conn = null;
        BufferedReader br = null;
        BufferedWriter bw = null;

        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            conn = (HttpURLConnection) apiURL.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setDoOutput(true);

            if (isPost) {
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", contentType);
                conn.setRequestProperty("Accept", "*/*");
            } else {
                conn.setRequestMethod("GET");
            }

            conn.connect();

            if (isPost) {
                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
                bw.write(parameter);
                bw.flush();
                bw = null;
            }

            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));

            String line = null;

            StringBuffer result = new StringBuffer();

            while ((line=br.readLine()) != null) result.append(line);

            ObjectMapper mapper = new ObjectMapper();

            resultMap = mapper.readValue(result.toString(), HashMap.class);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(url + " interface failed" + e.toString());
        } finally {
            if (conn != null) conn.disconnect();
            if (br != null) br.close();
            if (bw != null) bw.close();
        }

        return resultMap;
    }
}