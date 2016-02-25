package com.project.scgl.action;

import java.util.List;

import org.apache.commons.lang.RandomStringUtils;
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
	
	public void getPcSbTb(){
		
		log.info("请求班组图表");
		String sql = "SELECT  CONCAT(k,'\n','已排产至：',DATE_FORMAT(TIMESTAMPADD(DAY,v,NOW()),'%Y-%m-%d'),' 日')k,v,c,id   FROM v_scglxt_pc_sb_tb";
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
		
		String sql = "select gygcid,zddmc,serial jgsx,jgsl,gymc,edgs,cast(jhkssj as char) jhkssj,cast(kssj as char) kssj,bzmc,sbmc from `v_scglxt_pc_tb_info` where sbid = '03'";
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
	
	public void editGygcJhkssjById(){
		
		String id = Request.getParameter("gygcid");
		String jhkssj = Request.getParameter("jhkssj");
		String sql = "UPDATE `scpc`.`scglxt_t_gygc` SET `JHKSSJ`='"+jhkssj+"' WHERE `id`='"+id+"'";
		try{
			
			this.selectDataService.execute(sql);
		}catch(Exception e){
			Response.write("error");
			e.printStackTrace();
		}
		Response.write("success");
		
	}
	
	/**
	 * 获取子订单当前状态供排产管理人员调整
	 */
	public void getBomStatusList(){
		String sql = "select id ,zddmc,clxz,bmcl,date_format(starttime,'%Y-%m-%d') jhkssj,date_format(endtime,'%Y-%m-%d') jhjssj,gs,fun_dqgygc(id) ddtz from scglxt_t_bom  where 1=1 order by jhkssj";
		log.info("获取子订单当前状态供排产管理人员调整sql"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		json = "{\"data\":"+json+"}";
		Response.write(json);
	}
	
	/**
	 * 获取当前待加工的所有工序
	 */
	public void getBomGygcJg(){
		String sql = "SELECT gygc.id, bom.zddmc,bom.bmcl,date_format(bom.starttime,'%Y-%m-%d') jhkssj,date_format(bom.endtime,'%Y-%m-%d') jhjssj,bom.gs,jggy.gymc,gygc.kjgjs,gygc.yjgjs,gygc.bfjs,gygc.kjgjs-gygc.yjgjs-gygc.bfjs-gygc.sjjs djgjs,gygc.sjjs FROM scpc.scglxt_t_gygc gygc,scpc.scglxt_t_bom bom,scglxt_t_jggy jggy where  gygc.bomid = bom.id and jggy.id = gygc.gyid and (gygc.bfjs+gygc.yjgjs+gygc.sjjs<gygc.kjgjs)";
		log.info("获取当前待加工的所有工序sql"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		json = "{\"data\":"+json+"}";
		Response.write(json);
	}
	
	/**根据班组获取所有人员*/
	
	public void getRyByBz(){
		
		
		String ssbz = Request.getParameter("ssbz");
		String sql = "SELECT id,rymc mc,ssbz bz FROM scglxt_t_ry WHERE ssbz = '"+ssbz+"'";
		log.info("根据班组获取该班组所有人员"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	
	/**
	 * 获取当前待检验的所有工序
	 */
	public void getBomGygcJy(){
		String sql = "SELECT jggl.id, bom.zddmc,bom.bmcl,jggy.gymc,ry.rymc,sb.sbmc,jggl.jgjs	FROM scglxt_t_gygc gygc,scglxt_t_bom bom,scglxt_t_jggy jggy,scglxt_t_jggl jggl, scglxt_t_ry ry, scglxt_t_sb sb 	where  gygc.bomid = bom.id and jggy.id = gygc.gyid  and jggl.gygcid = gygc.id and ry.id = jggl.jgryid and sb.id = jggl.sbid and jggl.sfjy='0' order by jgkssj";
		log.info("获取当前待检验的所有工作sql"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		json = "{\"data\":"+json+"}";
		Response.write(json);
	}
	
	public void editJgglJy(){
		
		String jgglId = Request.getParameter("id");
		String bfjs = Request.getParameter("v");
		String jyryid = "02";
		String sql = "update scglxt_t_jggl set bfjs = "+bfjs+",sfjy = '1',jyryid= '"+jyryid+"' where id = '"+jgglId+"'";
		
		String sql2 = "update scglxt_t_gygc a set yjgjs = yjgjs-"+bfjs+"+(select c.jgjs from scglxt_t_jggl c where c.id = '"+jgglId+"') ,bfjs = bfjs+"+bfjs+",sjjs=sjjs-("+bfjs+"+(select c.jgjs from scglxt_t_jggl c where c.id = '"+jgglId+"')) where id = (select gygcid from scglxt_t_jggl b where b.id = '"+jgglId+"' and a.id = b.gygcid)";
		
		try{
			log.info("检验人员更新加工管理表"+sql);
			this.selectDataService.execute(sql);
			log.info("检验人员更新工艺过程表"+sql2);
			this.selectDataService.execute(sql2);
			
		}catch(Exception e){
			Response.write("error");
			e.printStackTrace();
		}
		Response.write("success");
		
	}
	
	public void jgryKs(){
		
		String gygcid = Request.getParameter("gygcid");
		String ryid = Request.getParameter("jgryid");
		String id = "F"+RandomStringUtils.randomNumeric(39);
		String sql = "insert into scglxt_t_jggl (id,jgryid,jgkssj,gygcid) values ('"+id+"','"+ryid+"',now(),'"+gygcid+"')";
		
		
		try{
			
			this.selectDataService.execute(sql);
			
		}catch(Exception e){
			Response.write("error");
			e.printStackTrace();
		}
		Response.write("success");
		
	}
	
	public void getYksGyJgry(){
		
		
		String gygcid = Request.getParameter("gygcid");
		String sql = "SELECT jgryid id,ry.rymc mc FROM scglxt_t_jggl,scglxt_t_ry ry WHERE gygcid = '"+gygcid+"'  AND jgjssj IS NULL and jgryid = ry.id ";
		
		log.info("查询某工艺过程已经开始加工的人员:"+sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	public void jgryJs(){
		
		String ryid = Request.getParameter("jsjgry");
		String sbid = Request.getParameter("sbid");
		String wcjs = Request.getParameter("wcjs");
		String gygcid = Request.getParameter("gygcid");
		
		String sql = "update scglxt_t_jggl set jgjssj = now(),jgjs = "+wcjs+" ,sbid = '"+sbid+"' where jgryid = '"+ryid+"' and gygcid = '"+gygcid+"'";
		
		String sql2 = "update scglxt_t_gygc t set t.sjjs=sjjs+"+wcjs+" where id = '"+gygcid+"'";
		
		try{
			log.info("加工人员结束加工某产品"+sql);
			log.info("加工人员结束加工更新工艺过程表"+sql2);
			this.selectDataService.execute(sql);
			
			this.selectDataService.execute(sql2);
			
		}catch(Exception e){
			Response.write("error");
			e.printStackTrace();
		}
		Response.write("success");
		
	}
	
	/**
	 * 获得加工设备字典
	 */
	public void getJgSbInfo() {

		String sql = "SELECT id,sbmc FROM scpc.scglxt_t_sb";
		log.info("查询加工设备" + sql);
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		Response.write(json);
	}
	

	/**
	 * 排产管理修改计划开始时间
	 */
	public void updateJhkssj() {

		String bomid = Request.getParameter("bomid");
		String jhkssj = Request.getParameter("v");
		String sql = "update scglxt_t_bom set starttime = date_format('"+jhkssj+"','%Y-%m-%d') where id ='"+bomid+"'";
		log.info("调整开始时间" + sql);
		this.selectDataService.execute(sql);

		Response.write("sucess");
	}
}
