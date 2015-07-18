package com.project.scgl.action;

import java.util.List;

import org.apache.commons.logging.Log;
import com.project.base.service.SelectDataService;
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
	
	public void getPcSbTb(){
		
		log.info("请求班组图表");
		String sql = "select round(((sum(edgs*jgsl))/(select gzsj from scglxt_t_gzsj where sfqy = 1)),2) v,bzid c,sb k,sbid id from v_scglxt_pc_tb group by sbid order by kssj,bzid";
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	
	public void getPcRyTb(){
		
		log.info("请求人员图表");
		String sql = "select round(((sum(edgs*jgsl))/(select gzsj from scglxt_t_gzsj where sfqy = 1)),2) v,bzid c,ry k,ryid id from v_scglxt_pc_tb group by ryid order by kssj,ryid";
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	
	public void getSbTbInfo(){
		
		String sql = "select gygcid,zddmc,serial jgsx,jgsl,gymc,edgs,cast(jhkssj as char) jhkssj,cast(kssj as char) kssj,bzmc,sbmc from `v_scglxt_pc_tb_info` where sbid = '02'";
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		json = "{\"data\":" + json + "}";
		Response.write(json);
	}
	
	public void getRyTbInfo(){
		
		String sql = "select gygcid, zddmc,serial jgsx,jgsl,gymc,edgs,cast(jhkssj as char) jhkssj,cast(kssj as char) kssj,bzmc,sbmc from `v_scglxt_pc_tb_info` where ryid = '02'";
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		json = "{\"data\":" + json + "}";
		Response.write(json);
	}
}
