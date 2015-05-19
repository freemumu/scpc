package com.project.scgl.action;

import java.util.List;

import org.apache.commons.logging.Log;
import com.project.base.service.SelectDataService;
import com.project.commonModel.util.Request;
import com.project.commonModel.util.Response;
import com.project.util.JsonObjectUtil;

public class PcglAction {

	
	private static Log log = org.apache.commons.logging.LogFactory.getLog(BzglAction.class);
	private SelectDataService selectDataService;
	public SelectDataService getSelectDataService() {
		return selectDataService;
	}
	public void setSelectDataService(SelectDataService selectDataService) {
		this.selectDataService = selectDataService;
	}
	
	/**
	 * 获取班组
	 */
	public void getBzList(){
		String sql = "select id,bzmc,bzfzr from scgl_gzbz_info";
		log.info("班组信息查询sql"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	
	/**
	 * 获取设备
	 */
	public void getSbList(){
		
		String sql = "select id,bzmc,bzfzr from scgl_gzbz_info";
		log.info("班组信息查询sql"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
		
	}
	
	/**
	 * 获取人员
	 */
	public void getRyList(){
		
		String sql = "select id,bzmc,bzfzr from scgl_gzbz_info";
		log.info("班组信息查询sql"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	
	/**
	 * 获取已选择条件下排产信息
	 */
	public void getPcInfo(){
		//时间
		//班组
		//设备
		
		//人员
		
		String sql = "select 'A任务排产' title,cast(jhkssj as char)start,cast(jhwcsj as char) end,'red' color from scglxt_mk_scpc;";
		log.info("查询排产信息"+sql);
		
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	
	public String addPcInfo(){
		
		return "addPcSuccess";
	} 
}
