package com.tourist.www;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.sound.sampled.AudioFormat.Encoding;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public static final String	APIKEY = "5EyE8Ck8EJm69XXgn6cY0Nzp9%2B8SZsOxwXbfbOa1qODptNm5daE%2F9vIef81TSkoAW%2F1AN6bbfWc7roNRO%2BW5Qw%3D%3D";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	
	
	
	@RequestMapping(value = "/tourView", method= RequestMethod.POST)
	public String tourView(String word, Model model, HttpServletRequest request, String area1) {
		
		
		
		logger.info("Welcome view!");
		BufferedReader br = null;
		String result ="";
		String line = "";
		
		
		
		
		try {
			System.out.println("word value = "+word);
			String keyword = URLEncoder.encode(word, "UTF-8");
			System.out.println("encoded word value = "+keyword);
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="
					+ APIKEY
					+ "&numOfRows=10"
					+ "&pageNo=1"
					+ "&MobileOS=ETC"
					+ "&MobileApp=AppTest"
					+ "&_type=json"
					+ "&listYN=Y" //목록 구분(Y=목록, N=개수)
					+ "&areaCode=39"
					+ "&keyword="
					+ keyword;
//				+ "&contentTypeId="
//				+ contenttypeid;
			
			
			
			System.out.println("url 값"+urlstr);
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			urlconnection.setRequestProperty("content-type", "apllication/json");
			System.out.println("Response code:"+urlconnection.getResponseCode());
			
			if(urlconnection.getResponseCode() >= 200 && urlconnection.getResponseCode() <= 300) {
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
				
			} else {
				br = new BufferedReader(new InputStreamReader(urlconnection.getErrorStream()));
				
			}
			
	
			
			//개행시 문자들 구별
			while((line=br.readLine())!=null) {
				result=result.concat(line);
//				System.out.println("line의 값은:"+line);
			}
			
			//파서 생성
			JSONParser jsonParse = new JSONParser();
			
			
			JSONObject jsonObject = (JSONObject)jsonParse.parse(result);
			System.out.println("jsonobj : "+jsonObject);
			
			JSONObject jsonresponse = (JSONObject)jsonObject.get("response");
//			System.out.println("=========================="+jsonresponse);
			
			JSONObject jsonheader = (JSONObject)jsonresponse.get("header");
//			System.out.println("+++++++++++++++++++++"+jsonheader);
			
			JSONObject jsonbody = (JSONObject)jsonresponse.get("body");
//			System.out.println(jsonbody+"=======================");
			
			JSONObject jsonitems = (JSONObject)jsonbody.get("items");
//			System.out.println(jsonitems+"ddddddddddddddddddddddddddddddd");
			
			JSONArray jsonitem = (JSONArray)jsonitems.get("item");
			System.out.println("===================item"+jsonitem);
			
			
			
			
			
			
//			for(int i=0; i<jsonitem.size(); i++) {
//				if(jsonitem.get(i).equals(0)) {
//					System.out.println("오류발생");
//				}
//				
//				
//			}
			
			//JSON 중괄호로 시작되는 키 구별
//			JSONObject comHeader = (JSONObject)jsonObject.get("comMsgHeader");
//			JSONObject msgHeader = (JSONObject)jsonObject.get("msgHeader");
			
			//대괄호로 만들어진 바디 배열화
			
			
//			JSONObject msgBody = (JSONObject)jsonObject.get("msgBody");
			
			
	
//			System.out.println("============변환============");
//			System.out.println("comHeader :"+comHeader);
//			System.out.println("msgHeader :"+msgHeader);
//			System.out.println("msgBody : "+ body);
			
			
			
			
			

//			 for(int i=0; i<body.size(); i++) { JSONObject obj = (JSONObject)body.get(i);
//			  
//			  
//			  System.out.println("body의 개수" + obj);
//			  
//			  
//			  }



			 model.addAttribute("place", jsonitem);
			 
			

		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "tourView";
				
		
		
		
		
	
	}



}
	

