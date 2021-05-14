package com.tourist.www;

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
	public String DetailView(String seq1, Model model, HttpServletRequest request) {
		
		
		seq1 = request.getParameter("tourSeq");
		String apikey = "5rufcvkmc6sxjc7s";
		BufferedReader br = null;
		String result = "";
		String line = "";
		
		System.out.println(seq1);
		
		String urlstr1 = "http://api.visitjeju.net/vsjApi/contents/searchList?apiKey="
		     	+apikey
		     	+"&tourSeq="
		     	+seq1;
		
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
			
			JSONObject jsoncom = (JSONObject)jsonobj.get("comMsgHeader");
			
			JSONObject jsonbody = (JSONObject)jsonobj.get("msgBody");
			
			System.out.println("com============================================"+jsoncom);
			System.out.println("body==================="+jsonbody);
	
			
			JSONArray jsonimg = (JSONArray)jsonbody.get("imageList");
//			System.out.println("img==============================="+jsonimg.get(1));
			
			JSONObject img2 = (JSONObject)jsonimg.get(0);
			System.out.println("========================="+img2);

			
//			System.out.println("================================================="+img2.get("tFilename"));
			

			
			model.addAttribute("detaildata", jsonbody);
			model.addAttribute("img", img2);
			
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return "detail";
		
		
		
		
	}
}