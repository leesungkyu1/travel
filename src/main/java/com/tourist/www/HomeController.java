package com.tourist.www;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
	public static final String	APPKEY = "5EyE8Ck8EJm69XXgn6cY0Nzp9%2B8SZsOxwXbfbOa1qODptNm5daE%2F9vIef81TSkoAW%2F1AN6bbfWc7roNRO%2BW5Qw%3D%3D";
	
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
	public String tourView(String word, Model model, Locale locale) {
		logger.info("Welcome view!", locale);
		BufferedReader br = null;
		
		ArrayList tourList = new ArrayList();

		
		
		String urlstr = "http://apis.data.go.kr/6300000/tourDataService/tourDataListJson?servicekey="
				+ APPKEY
				+ "numOfRows=10&"
				+ "pageNo=1&"
				+ "searchKeyword="
				+ word;
		
		System.out.println(urlstr);
		
		try {
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			JSONParser jsonParse = new JSONParser();
			
			//객체화
			JSONObject jsonObject = (JSONObject)jsonParse.parse(url);
			
			//관광지 배열 생성
			JSONArray touristArray = (JSONArray) jsonObject.get("tourList");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("word", urlstr);
		return "redirect:list";
		
		
				
		
		
		
		
	
	}
	
}
