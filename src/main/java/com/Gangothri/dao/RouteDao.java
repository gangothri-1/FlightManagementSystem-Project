package com.Gangothri.dao;

import java.util.List;


import com.Gangothri.bean.Route;

public interface RouteDao {
	public void save(Route route);
	public List<Route> findAllRoutes();
	public Route findRouteById(Long id);
	public Route findRouteBySourceAndDestination(String source,String destination);
	public Long generateRouteId();
	public List<Long> findAllRoutesId();
	


}
