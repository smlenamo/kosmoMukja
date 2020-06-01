package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface SearchMapService {
	public List<DongDTO> searchDong(Map map);
	public List<StoreDTO> getMarkerList(Map map);

}
