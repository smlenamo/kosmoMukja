package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.DongDTO;
import com.kosmo.mukja.service.SearchMapService;
import com.kosmo.mukja.service.StoreDTO;

@Repository
public class SearchMapDAO implements SearchMapService{
	//SqlSessionTemplate객체 주입
		@Resource(name="template")
		private SqlSessionTemplate sqlMapper;

		@Override
		public List<DongDTO> searchDong(Map map) {			
			return sqlMapper.selectList("searchDongList",map);
		}

		@Override
		public List<StoreDTO> getMarkerList(Map map) {
			return sqlMapper.selectList("getMarkerList", map);
		}
		
		

}
