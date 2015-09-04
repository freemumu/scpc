package com.project.xsgl.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.struts2.ServletActionContext;

import com.project.base.ActionEnum;
import com.project.base.service.SelectDataService;
import com.project.commonModel.util.Request;
import com.project.commonModel.util.Response;
import com.project.util.JsonObjectUtil;
import com.project.util.WebUtils;

/**
 * 合同管理类
 *
 * @author apple
 */
public class HtInfoManagerAction {
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
     *
     * @response : json
     */
    public void getTableData() {
        String khid = Request.getParameter("khid");
        String sql = "select t1.id ,t1.mc,t1.htbh , t1.ywlx ,t1.htje,date_format(qssj,'%Y-%m-%d') qssj,t1.dqjd,t1.fkzt,t1.jkbfb,jkje,jscb,t1.hkzh,t1.hkkhh,t1.remark ,t2.id khid" +
                " from scglxt_t_ht  t1 left join scglxt_t_kh t2 on t1.khid = t2.id  where 1=1 ";
        if (khid != null && !khid.equals("")) {
            sql += " and  t1.khid = '" + khid + "'";
        }
        List list = this.selectDataService.queryForList(sql);
        String json = JsonObjectUtil.list2Json(list);
        json = "{\"data\":" + json + "}";
        Response.write(json);
    }

    public void getTableDataTest() {
        String limitStart = "";
        String limitEnd = "";
//		String sql ="select id ,mc,htbh , ywlx ,htje,date_format(qssj,'%Y-%m-%d') qssj,dqjd,fkzt,jkbfb,jkje,jscb,hkzh,hkkhh,remark from xsgl_hetong_info ";
        String sql = "select id ,ssht, xmname , ddlevel,date_format(jhdate,'%Y-%m-%d') jhdate ,date_format(planstarttime,'%Y-%m-%d') planstarttime," +
                " date_format(planendtime,'%Y-%m-%d') planendtime,date_format(realstarttime,'%Y-%m-%d') realstarttime,date_format(realendtime,'%Y-%m-%d') realendtime, " +
                " zgs,dqjd,tz,remark,xmlxr,xmfzr,ckzt,date_format(ckdate,'%Y-%m-%d') ckdate from xsgl_ddgl_info  ";
        List list = this.selectDataService.queryForList(sql);
        String json = JsonObjectUtil.list2Json(list);
        json = "{\"data\":" + json + "}";
        Response.write(json);
    }

    /**
     * 增加客户信息
     */
    public void addUserInfo() {
        String JSON = Request.getParameter("JSON");
        String id = WebUtils.getRandomId();
        JSONObject json = JSONObject.fromObject(JSON);
        String mc = json.getString("mc");
        String lx = json.getString("lx");
        String dw = json.getString("dw");
        String gx = json.getString("gx");
        ;
        String iscj = json.getString("iscj");
        String remark = json.getString("remark");
        String msg = null;
        String sql = "insert into scglxt_t_kh(id,mc,lx,dw,dz,gx,iscj,remark) values(" + id + ",'1','1','1','1','1','1','1')";
        try {
            selectDataService.execute(sql);
            //	msg = ActionEnum.SUCCESS.toString();
            msg = "SUCCESS";
            log.info("insert " + sql);
        } catch (Exception e) {
            msg = "ERROR";
            log.info("错误的sql " + sql);
            e.printStackTrace();
        }
        Response.write(msg);
    }

    /**
     * 删除合同信息
     */
    public void deleteRow() {
        String id = Request.getParameter("id");
        String sql = "delete from scglxt_t_ht where id = '" + id + "'";
        try {
            selectDataService.execute(sql);
            Response.write("SUCCESS");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            Response.write("ERROR");
        }

    }

    /**
     * 获取客户信息
     */
    public void getDetailInfo() {
        String id = Request.getParameter("id");
        String sql = " select id ,mc,htbh , ywlx ,htje,date_format(qssj,'%Y-%m-%d')  qssj,dqjd,fkzt,jkbfb,jkje,jscb,hkzh,hkkhh,remark from scglxt_t_ht where id = '" + id + "'";
        List list = null;
        String json = null;
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
     * 加载业务类型列表
     */
    public void loadYwlxList() {
        String sql = "select  id ,mc  from scglxt_tyzd where id like '31%' order by mc ";
        List list = this.selectDataService.queryForList(sql);
        String json = JsonObjectUtil.list2Json(list);
        Response.write(json);
    }

    /**
     * 保存操作  ，提供新增或者更新update操作
     */
    public void updateInfo() {
        String json = Request.getParameter("JSON");
        JSONObject JSON = JSONObject.fromObject(json);

        String mc = JSON.getString("mc");
        String htbh = JSON.getString("htbh");
        String ywlx = JSON.getString("ywlx");
        String htje = JSON.getString("htje");
        String qssj = JSON.getString("qssj");
        String dqjd = JSON.getString("dqjd");
        String fkzt = JSON.getString("fkzt");

        String jkbfb = JSON.getString("jkbfb");


        String jkje = JSON.getString("jkje");
        jkbfb = String.valueOf((double)Long.parseLong(jkje)/Long.parseLong(htje)*100);
        String jscb = JSON.getString("jscb");
        String hkzh = JSON.getString("hkzh");
        String hkkhh = JSON.getString("hkkhh");
        String remark = JSON.getString("remark");
        String flag = JSON.getString("flag");
        String sql = null;
        String id = null;
        if (flag != null && flag.equals("ADD")) {
            id = WebUtils.getRandomId();
            sql = " insert into scglxt_t_ht (`id`, `mc`, `htbh`, `ywlx`, `htje`, `qssj`, `dqjd`, `fkzt`, `jkbfb`, `jkje`, `jscb`, `hkzh`, `hkkhh`,`remark`) VALUES ('" + id + "', '" + mc + "', '" + htbh + "', '" + ywlx + "', '" + htje + "',  DATE_FORMAT( '2012-02-02', '%Y-%m-%d') , '" + dqjd + "', '" + fkzt + "', '" + jkbfb + "',  '" + jkje + "', '" + jscb + "','" + hkzh + "','" + hkkhh + "','" + remark + "' );";
        } else if (flag.equals("UPDATE")) {
            id = JSON.getString("id");
            sql = " update scglxt_t_ht set mc = '" + mc + "' , htbh = '" + htbh + "', ywlx = '" + ywlx + "' , htje = '" + htje + "',qssj = DATE_FORMAT('" + qssj + "','%Y-%m-%d'),dqjd='" + dqjd + "', " +
                    "fkzt = '" + fkzt + "' , jkbfb='" + jkbfb + "' ,jkje='" + jkje + "', jscb='" + jscb + "' ,hkzh='" + hkzh + "' , hkkhh='" + hkkhh + "', remark='" + remark + "'   " +
                    "WHERE id = '" + id + "'";
        }
        try {
            selectDataService.execute(sql);
            Response.write(ActionEnum.SUCCESS.toString());
        } catch (Exception e) {
            Response.write(ActionEnum.ERROR.toString());
            e.printStackTrace();
        }
    }


}
