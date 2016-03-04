/**
 * 订单信息模块类
 */
package com.project.jsgl.action;

import java.util.List;

import com.project.util.Constants;
import com.project.util.StringUtil;
import net.sf.json.JSONObject;

import oracle.jdbc.driver.Const;
import org.apache.commons.logging.Log;

import com.project.base.ActionEnum;
import com.project.base.service.SelectDataService;
import com.project.commonModel.util.Request;
import com.project.commonModel.util.Response;
import com.project.util.JsonObjectUtil;
import com.project.util.WebUtils;
import com.project.xsgl.action.KhxxManagerAction;

public class GxInfoManagerAction {
	private static Log log = org.apache.commons.logging.LogFactory.getLog(KhxxManagerAction.class);
	private SelectDataService selectDataService;
	public SelectDataService getSelectDataService() {
		return selectDataService;
	}
	public void setSelectDataService(SelectDataService selectDataService) {
		this.selectDataService = selectDataService;
	}
	/**
	 * 获取合同信息数据
	 * @response  : json 
	 */
	public void getTableData(){
		String limitStart = "";
		String limitEnd = "";
		String sql = " select  id , gymc,gydh,fzbz ,sfwx from  scglxt_t_jggy ";
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
		String sql = "delete from scglxt_t_jggy where id = '"+id+"'";
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
		String id = Request.getParameter("id");
		String sql = " select  id , gymc,gydh,fzbz ,sfwx from  scglxt_t_jggy   where id = '"+id+"' ";
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
		String gxmc = JSON.getString("gxmc");
		String fzbz = JSON.getString("fzbz");
		String sfwx = JSON.getString("sfwx");
		String flag = JSON.getString("flag") ;
		String sql = null;
//		String id = WebUtils.getRandomId();
		String id = StringUtil.returnNotEmpty(JSON.getString("id"));

		if(flag !=null && flag.equals("ADD")){
			sql = "insert into scglxt_t_jggy (gymc,fzbz,sfwx) values( '"+gxmc+"','"+fzbz+"','"+sfwx+"')";
		}else if(flag.equals("UPDATE")){
			sql = "update scglxt_t_jggy  set gymc='"+gxmc+"' ,  fzbz = '"+fzbz+"'  , sfwx = '"+sfwx+"'  where id = '"+id+"' ";
		}
		try {
			selectDataService.execute(sql);
			Response.write(Constants.UPDATE_SUCCESS);
		} catch (Exception e) {
			Response.write(Constants.UPDATE_ERROR);
			e.printStackTrace();
		}
	}
	
	
}
