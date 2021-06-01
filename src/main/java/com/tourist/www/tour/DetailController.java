package com.tourist.www.tour;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailController {

	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String DetailView(String contentid, Model model, HttpServletRequest request) {
		
		
		
//		contentid = request.getParameter("contentid");
//		System.out.println(contentid);
		
		String apikey = "5EyE8Ck8EJm69XXgn6cY0Nzp9%2B8SZsOxwXbfbOa1qODptNm5daE%2F9vIef81TSkoAW%2F1AN6bbfWc7roNRO%2BW5Qw%3D%3D";
		BufferedReader br = null;
		String result = "";
		String line = "";
		
		
		String urlstr1 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
		     	+ apikey
		     	+ "&contentId="
		     	+ contentid
		     	+ "&MobileOS=ETC"
		     	+ "&defaultYN=Y"
		     	+ "&firstImageYN=Y"
		     	+ "&overviewYN=Y"
				+ "&MobileApp=AppTest"
				+ "&_type=json"
				+ "&mapninfoYN=Y"
				+ "&addrinfoYN=Y";
		
		System.out.println(urlstr1);
		
		
		try {
			URL url1 = new URL(urlstr1);
			HttpURLConnection urlconnection1 = (HttpURLConnection) url1.openConnection();
			urlconnection1.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection1.getInputStream(), "UTF-8"));
			
			while((line=br.readLine())!=null) {
				result=result.concat(line);
			}
			
			System.out.println(result);
			
			
			JSONParser json = new JSONParser();
			
			JSONObject jsonobj = (JSONObject)json.parse(result);
			System.out.println("========================="+ jsonobj);
			
			JSONObject jsonresponse = (JSONObject)jsonobj.get("response");
			System.out.println("123123========================="+jsonresponse);
			
//			JSONObject jsonheader = (JSONObject)jsonresponse.get("header");
			JSONObject jsonbody = (JSONObject)jsonresponse.get("body");
			
			System.out.println("==========================="+jsonbody);
			JSONObject jsonitems = (JSONObject)jsonbody.get("items");
			JSONObject jsonitem = (JSONObject)jsonitems.get("item");
			
			
			System.out.println("com============================================"+jsonitem);

	
//			
//			JSONArray jsonimg = (JSONArray)jsonbody.get("imageList");
//			System.out.println("img==============================="+jsonimg.get(1));
			
//			JSONObject img2 = (JSONObject)jsonimg.get(0);
//			System.out.println("========================="+img2);

			
//			System.out.println("================================================="+img2.get("tFilename"));
			

			
			model.addAttribute("detaildata", jsonitem);
//			model.addAttribute("img", img2);
			
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return "detail";
		
		
		
		
	}
}
