package com.roomrsv.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import org.json.*;

public class Test {
	public static void main(String[] args) {
		
		
		JSONObject jsonObj1 = new JSONObject();
		JSONObject jsonObj2 = new JSONObject();
		JSONObject jsonObj3 = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		jsonObj1.put("rmType", "1");
		jsonObj1.put("rmLeft", "1");
		jsonObj2.put("rmType", "2");
		jsonObj2.put("rmLeft", "2");
		jsonObj3.put("rmType", "3");
		jsonObj3.put("rmLeft", "0");
		jsonArray.put(jsonObj1);
		jsonArray.put(jsonObj2);
		jsonArray.put(jsonObj3);
		JSONObject json = new JSONObject();
		json.put("2020-12-25",jsonArray);
//		JSONObject obj = new JSONObject();
//		obj.put("2020-12-25", jsonObj);
		System.out.print(json);
//		JSONArray jsonArray = new JSONArray();
//		jsonArray.put(jsonObj);
//		System.out.print(jsonArray.toString());
	}
}
