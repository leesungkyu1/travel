package com.tourist.www;

import java.io.*;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public static final String	APPKEY = "J069FcKyYMxO6OxKr6v7cvGNZQfZHU0Nh4kZXSnqHyYY32Y87dRs73Nhtxb3j3fFclc1AOTYPWqak3%2FKzUwOIw%3D%3D";

	@Autowired
	HomeService homeService;

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


	public static String getTagValue(String tag, Element eElement) {

		//결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		result = nlList.item(0).getTextContent();

		return result;
	}

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, String childTag, Element eElement) {

		//결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		for(int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {

			//result += nlList.item(i).getFirstChild().getTextContent() + " ";
			result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
		}

		return result;
	}


	@RequestMapping(value = "/tourView", method= RequestMethod.POST)
	public String tourView(String word, Model model) throws UnsupportedEncodingException {
		logger.info("Welcome view!");
		BufferedReader br = null;

		word = URLEncoder.encode(word, "UTF-8");
		String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?serviceKey="
				+ APPKEY
				+ "&MobileApp=AppTest"
				+ "&MobileOS=ETC"
				+ "&pageNo=1"
				+ "&numOfRows=470"
				+ "&keyword="
				+ word;

		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(urlstr);
			NodeList totalCount = doc.getElementsByTagName("totalCount");

			NodeList items = doc.getElementsByTagName("item");

			for(int i=0; i<items.getLength(); i++){
				Node item = items.item(i);
				Element eElement = (Element) item;
				System.out.println("getTagValue(\"addr1\", eElement) = " + getTagValue("addr1", eElement));
				System.out.println(i);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
		return "tourView";
	}
}

