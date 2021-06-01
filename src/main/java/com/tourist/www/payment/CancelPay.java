package com.tourist.www.payment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class CancelPay {
	
	@RequestMapping(value="/payments/cancel", method=RequestMethod.POST)
	public String cancelpay(HttpServletRequest request) {
		HttpURLConnection conn = null;
		String apikey = "7777261488965844";
		String apisecret = "hXp1A9QkUC6bidCb2xRAol3xOVvPYQSgNihns8HnLOy31bf3I7E7sIEgDa6C0ZSOhabKiT73HF7JQnMz";
		
		try {			
			URL url = new URL("https://api.iamport.kr/users/getToken");
			
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setDoOutput(true);
			
			JSONObject obj = new JSONObject();
			obj.put("imp_key", apikey);
			obj.put("imp_secret", apisecret );
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString());
			bw.flush();
			bw.close();
			
			System.out.println(obj);
			
			int result = 0;
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode"+ responseCode);
			
			if(responseCode == 200) {
				System.out.println("환불성공!!!");
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;;
				
				
				while((line=br.readLine())!=null) {
					sb.append(line);
				}
//				System.out.println(line);
				br.close();
				System.out.println(""+sb.toString());
				result =1;
				

//				JSONParser jsonParser = new JSONParser(); 
//				JSONObject jobj = (JSONObject)jsonParser.parse(line);
//				JSONObject jobj1 = (JSONObject)jobj.get("response");
//				
//				System.out.println(jobj1);

			}else {
				System.out.println(conn.getResponseMessage());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		
		return "tourView";
		
	}
	

}
