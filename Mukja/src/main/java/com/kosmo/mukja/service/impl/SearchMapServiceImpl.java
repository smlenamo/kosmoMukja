package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.DongDTO;
import com.kosmo.mukja.service.SearchMapService;
import com.kosmo.mukja.service.StoreDTO;


@Service("serchService")
public class SearchMapServiceImpl implements SearchMapService{
	@Resource(name = "searchMapDAO")
	SearchMapDAO dao;
	
	@Override
	public List<DongDTO> searchDong(Map map) {		
		return dao.searchDong(map);
	}

	@Override
	public List<StoreDTO> getMarkerList(Map map) {		
		return dao.getMarkerList(map);
	}
	
	
	
}
