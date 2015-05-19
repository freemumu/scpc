package com.project.kcgl.action;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;

import com.project.base.ActionEnum;
import com.project.base.service.SelectDataService;
import com.project.commonModel.util.Request;
import com.project.commonModel.util.Response;
import com.project.util.JsonObjectUtil;
import com.project.util.WebUtils;
import com.project.xsgl.action.KhxxManagerAction;

public class KcglAction {
	private static Log log = org.apache.commons.logging.LogFactory.getLog(KhxxManagerAction.class);
	private SelectDataService selectDataService;
	public SelectDataService getSelectDataService() {
		return selectDataService;
	}
	public void setSelectDataService(SelectDataService selectDataService) {
		this.selectDataService = selectDataService;
	}
	/**
	 *   生产材料管理
	 * @response  : json 
	 */
	public void getTableData(){
		String limitStart = "";
		String limitEnd = "";
		String sql = "select id, clmc,clcz,clsl,cldj,cllx,ghs,mi,clxz,kd,gd,cd,clly from scglxt_t_cl " ; 
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		json = "{\"data\":"+json+"}";
		Response.write(json);
	}
 
 
	 /**
	  * 删除合同信息
	  */
	public void  deleteRow(){
		String id = Request.getParameter("id");
		String sql = "delete from scglxt_t_bom where id = '"+id+"'";
		try {
			selectDataService.execute(sql);
			Response.write("SUCCESS") ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Response.write("ERROR");
		}
		
	}
	/**
	 * 获取客户信息
	 */
	public void getDetailInfo(){
		String id = "1" ;
		String sql = " select id ,zddmc, zddcz,clxz,cldx,cltj,clje,jgsl,bmcl,date_format(starttime,'%Y-%m-%d') starttime, " +
				"date_format(endtime,'%Y-%m-%d') endtime,gs,blqk,date_format(blkssj,'%Y-%m-%d') blkssj," +
				"date_format(bljssj,'%Y-%m-%d') bljssj, clzt,cgry,cgsj,ddtz,rksj,bfjs,bhgjs from scglxt_t_bom where id = '"+id+"' ";
		List list = null ; 
		String json = null ;
		try {
			list = selectDataService.queryForList(sql);
			json = JsonObjectUtil.list2Json(list);
		} catch (Exception e) {
			json = "[]";
			e.printStackTrace();
		}
		Response.write(json);
		}
	/**
	 *  保存操作  ，提供新增或者更新update操作
	 */
	public void updateInfo(){
		String json = Request.getParameter("JSON");
		JSONObject JSON = JSONObject.fromObject(json);
		String ssht = JSON.getString("ssht");
		String xmname = JSON.getString("xmname");
		String ddlevel = JSON.getString("ddlevel");
		String jhdate = JSON.getString("jhdate");
		String planstarttime = JSON.getString("planstarttime");
		String planendtime = JSON.getString("planendtime");
		String realstarttime = JSON.getString("realstarttime");
		String realendtime = JSON.getString("realendtime");
		String zgs = JSON.getString("zgs");
		String dqjd = JSON.getString("dqjd");
		String tz = JSON.getString("tz");
		String remark = JSON.getString("remark");
		String xmlxr = JSON.getString("xmlxr");
		String xmfzr = JSON.getString("xmfzr");
		String ckzt = JSON.getString("ckzt");
		String ckdate = JSON.getString("ckdate");
		String flag = JSON.getString("flag") ;
		String sql = null;
		String id = WebUtils.getRandomId();
		if(flag !=null && flag.equals("ADD")){
			sql = "INSERT INTO `scglxt_t_bom` (`id`, `ssht`, `xmname`, `ddlevel`, `jhdate`, `planstarttime`, `planendtime`, `realstarttime`, `realendtime`, `zgs`, `dqjd`, `tz`, `remark`, `xmlxr`, `xmfzr`, `ckzt`, `ckdate`)" +
					" VALUES ('"+id+"', '"+ssht+"', '"+xmname+"', '"+ddlevel+"', date_format('"+jhdate+"','%Y-%m-%d'), date_format('"+planstarttime+"','%Y-%m-%d'), " +
					" date_format('"+planendtime+"','%Y-%m-%d') , date_format('"+realstarttime+"','%Y-%m-%d'), date_format('"+realendtime+"','%Y-%m-%d'), " +
					" '"+zgs+"', '"+dqjd+"', '"+tz+"', '"+remark+"', '"+xmlxr+"', '"+xmfzr+"', '"+ckzt+"',date_format('"+ckdate+"','%Y-%m-%d')); ";
		}else if(flag.equals("UPDATE")){
			id = "1";
			sql = " update  scglxt_t_bom set ssht='"+ssht+"' , xmname＝'"+xmname+"' ,ddlevel='"+ddlevel+"',jhdate=  date_format('"+jhdate+"','%Y-%m-%d') , " +
					" planstarttime=  date_format('"+planstarttime+"','%Y-%m-%d') , planstarttime=  date_format('"+planstarttime+"','%Y-%m-%d') ," +
					" planstarttime=  date_format('"+planstarttime+"','%Y-%m-%d') , planstarttime=  date_format('"+planstarttime+"','%Y-%m-%d') ," +
					" zgs = '"+zgs+",dqjd='"+dqjd+"',tz='"+remark+"',remark='"+remark+"',xmlxr='"+xmlxr+"',xmfzr='"+xmfzr+"' ,ckzt='"+ckzt+"'" +
					" ckrq=  date_format("+ckdate+",'%Y-%m-%d') " +
					"where id = '"+id+"' ";
		}
		try {
			selectDataService.execute(sql);
			Response.write(ActionEnum.SUCCESS.toString());
		} catch (Exception e) {
			Response.write(ActionEnum.ERROR.toString());
			e.printStackTrace();
		}
	}
	/**
	 *  工序编排数据 
	 *  根据一个自订单id查询此bom的工序编排数据
	 */
	public void getGxbpData(){
		String limitStart = "";
		String limitEnd = "";
		String sql = " ";
		List list = this.selectDataService.queryForList(sql);
		String json = JsonObjectUtil.list2Json(list);
		json = "{\"data\":"+json+"}";
		Response.write(json);		
	}
	/**
	 * 获取一个bom的工艺过程数据
	 */
	public void getGygcData(){
		String json ; 
		String sql = "select t2.bomid , t2.gyid ,t2.id , t2.gynr,t2.edgs,t2.stsj,t2.jhwcsj,t2.sjwcsj , t2.jyryid , t1.zddmc, t3.gymc "+ 
					" from scglxt_t_bom t1 ,  scglxt_t_gygc  t2 , scglxt_t_jggy  t3 "+ 
					" where t1.id = t2.bomid  and t2.gyid = t3.id ;  ";
		List list = this.selectDataService.queryForList(sql);
		if(list.size() >= 0 ){
			json = JsonObjectUtil.list2Json(list);
			json = "{\"data\":"+json+"}";
			Response.write(json);		
		}else{
			Response.write("") ; 
		}
	}
	/**
	 *  保存子订单的工序编排
	 */
	public void saveGxbpData(){
		String json = Request.getParameter("JSON");
		JSONObject JSON = JSONObject.fromObject(json);
		String bomid = JSON.getString("bomid");
		String sysb = JSON.getString("sysb") ;
		String gxnr = JSON.getString("gxnr");
		String edgs = JSON.getString("edgs");
		String stsj = JSON.getString("stsj");
		String serial =JSON.getString("serial");
		String id =  WebUtils.getRandomId() ;
		String sql = "insert into scglxt_t_gygc (bomid,id,sbid,gynr,edgs,stsj,serial) values ('"+bomid+"','"+id+"','"+sysb+"','"+gxnr+"','"+edgs+"','"+stsj+"','"+serial+"') ";
		try {
			this.selectDataService.execute(sql);
		} catch (Exception e) {
		}
	}
	/**
	 * 加在加工工艺json数据列表
	 */
	public void getJggyData(){
		String sql = "select id ,gymc name from scglxt_t_jggy ";
		String json = null ;
		List list = this.selectDataService.queryForList(sql);
		if(list.size() >= 0 ){
			json = JsonObjectUtil.list2Json(list);
//			json = "{\"data\":"+json+"}";
			Response.write(json);		
		}else{
			Response.write("error") ; 
		}
		
	}
	/**
	 * 查询相应bomid 的工艺过程排序
	 */
	public void loadBomGybpList(){
		String bomid = Request.getParameter("bomid");
		String sql = " select bomid ,gyid ,id ,gynr  ,edgs,serial    from   scglxt_t_gygc where bomid = '"+bomid+"'  order by serial asc ";
		String json = null ; 
		List list = this.selectDataService.queryForList(sql);
		if(list.size()>=0){
			json = JsonObjectUtil.list2Json(list);
			Response.write(json);
		}else {
			Response.write("error");
		}
	}
}
