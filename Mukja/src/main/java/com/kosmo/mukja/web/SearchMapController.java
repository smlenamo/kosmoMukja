package com.kosmo.mukja.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.mukja.service.DongDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.impl.SearchMapServiceImpl;

@Controller
public class SearchMapController {
	@Resource(name = "serchService")
	SearchMapServiceImpl service;

	
	
	
	@ResponseBody
	@RequestMapping(value = "/Search/Place.do", produces="application/json; charset=utf8")
	public String searchDong(@RequestParam Map map) {
		System.out.println("searchDong 접근");
		 System.out.println("dong : "+map.get("dong").toString());
		 List<DongDTO> list = service.searchDong(map);
		 //디버그
		 System.out.println("dong : "+map.get("dong").toString());
		 System.out.println(list.get(0).getSido()+list.get(0).getSi_goon_go()+list.get(0).getDong()+list.get(0).getDong_sub());
		 System.out.println("list size "+String.valueOf(list.size()));
		 JSONArray jsonArray = new JSONArray();
		 for(DongDTO dto : list) {
			 
			JSONObject jsonDto = new JSONObject();
			jsonDto.put("code", dto.getCode());
			jsonDto.put("sido", dto.getSido());
			jsonDto.put("si_goon_go", dto.getSi_goon_go());
			jsonDto.put("dong", dto.getDong());
			jsonDto.put("dong_sub", dto.getDong_sub());
			jsonDto.put("lat", dto.getLat());
			jsonDto.put("lng", dto.getLng());
			jsonArray.add(jsonDto);
		 }
		 System.out.println("toJSONString"+jsonArray.toJSONString());
		return jsonArray.toJSONString(); 
	}
	
	
	@ResponseBody
	@RequestMapping( value = "/getMarker.pbs", produces = "application/json; charset=utf8")
	public String getMarker(@RequestParam Map map) {
			
		System.out.println(map.get("namsualat".toString()));
		System.out.println(map.get("namsualng".toString()));
		System.out.println(map.get("bukdonglat".toString()));
		System.out.println(map.get("bukdonglng".toString()));
		System.out.println(map.get("bnksualat".toString()));
		System.out.println(map.get("bnksualng".toString()));
		System.out.println(map.get("namdonglat".toString()));
		System.out.println(map.get("namdonglng".toString()));
		List<StoreDTO>list = service.getMarkerList(map);
		System.out.println("list:"+list.toString());
		 JSONArray jsonArray = new JSONArray();
		 for(StoreDTO dto : list) {			 
				JSONObject jsonDto = new JSONObject();
				jsonDto.put("store_id", dto.getUsername());	
				jsonDto.put("store_name", dto.getStore_name());				
				jsonDto.put("store_phonenumber", dto.getStore_phnum());
				jsonDto.put("store_email", dto.getStore_email());
				jsonDto.put("store_avg", dto.getStore_avg());
				jsonDto.put("store_intro", dto.getStore_intro());
				jsonDto.put("store_time", dto.getStore_time());
				jsonDto.put("store_lat", dto.getStore_lat());
				jsonDto.put("store_lng", dto.getStore_lng());			
				jsonArray.add(jsonDto);
			 }
		 
		 
		 return jsonArray.toJSONString(); 
	}
	
	
	@RequestMapping("Store/StoreDetail.do")
	public String toStoreDetial() {
			System.out.println("스토어 디테일로 이동");
		return "bbs/View";
	}
	
}
