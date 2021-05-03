package com.tourist.www;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	private String appkey;
	
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

		
		String urlstr = "http://apis.data.go.kr/6300000/tourDataService/tourDataList?"
				+ "5EyE8Ck8EJm69XXgn6cY0Nzp9+8SZsOxwXbfbOa1qODptNm5daE/9vIef81TSkoAW/1AN6bbfWc7roNRO+W5Qw==&"
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
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:"+urlstr;
				
		
		
		
		
	
	}
	
}
