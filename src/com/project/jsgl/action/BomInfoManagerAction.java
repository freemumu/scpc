/**
 * 订单信息模块类
 * 此类包括了 bom 表相关的操作信息 ， bom 订单  工艺工程 相关的操作逻辑将都关联到此类中。
 * config：
 */
package com.project.jsgl.action;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.commons.logging.Log;

import com.project.base.ActionEnum;
import com.project.base.service.SelectDataService;
import com.project.commonModel.util.Request;
import com.project.commonModel.util.Response;
import com.project.util.JsonObjectUtil;
import com.project.util.WebUtils;
import com.project.xsgl.action.KhxxManagerAction;

public class BomInfoManagerAction {
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
        String limitStart = "";
        String limitEnd = "";
        String ssdd = Request.getParameter("ssdd");
        String cggl = Request.getParameter("cggl");

        String sql = "select id ,zddmc, zddcz,clxz,cldx,cltj,clje,jgsl,bmcl,date_format(starttime,'%Y-%m-%d') starttime, " +
                "date_format(endtime,'%Y-%m-%d') endtime,gs,blqk,date_format(blkssj,'%Y-%m-%d') blkssj," +
                "date_format(bljssj,'%Y-%m-%d') bljssj, clzt, if(clzt='0','未采购','已采购')  clztformat ,cgry,cgsj,ddtz, date_format(rksj,'%Y-%m-%d') rksj,bfjs,bhgjs ,gxnr " +
                " from scglxt_t_bom  where 1=1 ";
        if (ssdd != null && !ssdd.equals("") && !ssdd.equals("null")) {
            sql = sql + "and ssdd = '" + ssdd + "'";
        }
        if (cggl != null && cggl.equals("true")) {
            sql += " ";
        }
        sql += " order by id desc ";
        List list = this.selectDataService.queryForList(sql);
        String json = JsonObjectUtil.list2Json(list);
        json = "{\"data\":" + json + "}";
        Response.write(json);
    }

    /**
     * 删除合同信息
     */
    public void deleteRow() {
        String id = Request.getParameter("id");
        String sql = "delete from scglxt_t_bom where id = '" + id + "'";
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
     * 更改采购状态
     */
    public void changeStatusClzt() {
        String id = Request.getParameter("id");
        String sql = "update scglxt_t_bom set clzt ='1' where id = '" + id + "'";
        try {
            selectDataService.execute(sql);
            Response.write("SUCCESS");

        } catch (Exception e) {
            e.printStackTrace();
            Response.write("ERROR");
        }
    }

    /**
     * 更新备料情况 更新备料结束时间
     */
    public void updateBlzk() {
        String id = Request.getParameter("id");
        String sql = "update scglxt_t_bom set blqk ='1' , bfjs = 0 , bhgjs = 0 ,bljssj =  date_format(now(),'%Y-%m-%d %H:%i:%s') , starttime =date_format(now(),'%Y-%m-%d %H:%i:%s')     where id = '" + id + "'";
        try {
            selectDataService.execute(sql);
            Response.write("SUCCESS");

        } catch (Exception e) {
            e.printStackTrace();
            Response.write("ERROR");
        }
    }

    /**
     * 获取客户信息
     */
    public void getDetailInfo() {
        String id = Request.getParameter("id");
        String sql = " select id ,zddmc, zddcz,clxz,cldx,cltj,clje,jgsl,bmcl,date_format(starttime,'%Y-%m-%d') starttime, " +
                "date_format(endtime,'%Y-%m-%d') endtime,gs,blqk,date_format(blkssj,'%Y-%m-%d') blkssj," +
                "date_format(bljssj,'%Y-%m-%d') bljssj, clzt,cgry,cgsj,ddtz,rksj,bfjs,bhgjs from scglxt_t_bom where id = '" + id + "' ";
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
     * 保存操作  ，提供新增或者更新update操作
     */
    public void updateInfo() {
//		String json = Request.getParameter("JSON");
//		JSONObject JSON = JSONObject.fromObject(json);
        String flag = Request.getParameter("flag");
        String sql = null;
        String randomId = WebUtils.getRandomId();
        String zddmc = Request.getParameter("zddmc");
        String zddcz = Request.getParameter("zddcz");
        String clxz = Request.getParameter("clxz");
        String cldx = Request.getParameter("cldx");
        String cltj = Request.getParameter("cltj");
        String clje = Request.getParameter("clje");
        String jgsl = Request.getParameter("jgsl");
        String bmcl = Request.getParameter("bmcl");
        String starttime = Request.getParameter("starttime");
        String endtime = Request.getParameter("endtime");
        String gs = Request.getParameter("gs");
        String ssdd = Request.getParameter("ssdd");
        String id = Request.getParameter("id");

        if (flag != null && flag.equals("ADD")) {
            sql = "INSERT INTO `scpc`.`scglxt_t_bom`" +
                    " (`zddmc`, `zddcz`, `clxz`, `cldx`, `cltj`, `clje`, `jgsl`, `bmcl`, `starttime`, `endtime`," +
                    " `gs`, `blqk`, `blkssj`, `ssdd`)" +
                    " VALUES ('" + zddmc + "', '" + zddcz + "', '" + clxz + "', '" + cldx + "', '" + cltj + "', '" + clje + "', '" + jgsl + "', '" + bmcl + "', ' date_format('" + starttime + "','%Y-%m-%d')', ' date_format('" + endtime + "','%Y-%m-%d')', '" + gs + "', '', '', '" + ssdd + "');";
        } else if (flag.equals("UPDATE")) {
            sql = "update scglxt_t_bom  " +
                    "set zddmc = '" + zddmc + "', zddcz = '" + zddcz + "' , clxz = '" + clxz + "' , cldx = '" + cldx + "' ,cltj ='" + cltj + "' , clje ='" + clje + "' ,bmcl='" + bmcl + "'," +
                    "starttime = date_format('" + starttime + "','%Y-%m-%d'),endtime = date_format('" + endtime + "','%Y-%m-%d')  ," +
                    "gs='" + gs + "'  " +
                    "where  id = '" + id + "'";

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
     * 工序编排数据
     * 根据一个自订单id查询此bom的工序编排数据
     */
    public void getGxbpData() {
        String limitStart = "";
        String limitEnd = "";
        String sql = " ";
        List list = this.selectDataService.queryForList(sql);
        String json = JsonObjectUtil.list2Json(list);
        json = "{\"data\":" + json + "}";
        Response.write(json);
    }

    /**
     * 获取一个bom的工艺过程数据
     */
    public void getGygcData() {
        String json;
        String sql = "select t2.bomid , t2.gyid ,t2.id , t2.gynr,t2.edgs,t2.stsj,t2.jhwcsj,t2.sjwcsj , t2.jyryid , t1.zddmc, t3.gymc " +
                " from scglxt_t_bom t1 ,  scglxt_t_gygc  t2 , scglxt_t_jggy  t3 " +
                " where t1.id = t2.bomid  and t2.gyid = t3.id ;  ";
        List list = this.selectDataService.queryForList(sql);
        if (list.size() >= 0) {
            json = JsonObjectUtil.list2Json(list);
            json = "{\"data\":" + json + "}";
            Response.write(json);
        } else {
            Response.write("");
        }
    }

    /**
     * 保存子订单的工序编排
     */
    public void saveGxbpData() {
        String json = Request.getParameter("JSON");
        JSONObject JSON = JSONObject.fromObject(json);
        String bomid = JSON.getString("bomid");
        String sysb = JSON.getString("sysb");
        String gxnr = JSON.getString("gxnr");
        String edgs = JSON.getString("edgs");
        String stsj = JSON.getString("stsj");
        String serial = JSON.getString("serial");
        String id = WebUtils.getRandomId();
//		String sql = "insert into scglxt_t_gygc (bomid,id,sbid,gynr,edgs,stsj,serial) values ('"+bomid+"','"+id+"','"+sysb+"','"+gxnr+"','"+edgs+"','"+stsj+"','"+serial+"') ";
        String sql = "insert into scglxt_t_gygc (bomid,id,sbid,gynr,edgs,serial) values ('" + bomid + "','" + id + "','" + sysb + "','" + gxnr + "','" + edgs + "','" + serial + "') ";
        try {
            log.info(sql);
            this.selectDataService.execute(sql);
            updateBomGynrByGxbp(bomid);
            Response.write(ActionEnum.SUCCESS.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除工序编排
     */
    public void deleteGxbpData() {
        String bomid = Request.getParameter("bomid");
        if (bomid == null || bomid.equals("")) {
            return;
        }
        String sql = "delete from scglxt_t_gygc where bomid = '" + bomid + "'";
        try {
            this.selectDataService.execute(sql);
        } catch (Exception e) {
        }
    }

    public void updateStrattime() {
        String sql = "update scglxt_t_gygc set starttime = curtime()";
        try {
            this.selectDataService.execute(sql);
            Response.write("success");
        } catch (Exception e) {
            Response.write("error");
        }
    }

    public void updateEndtime() {
        String sql = "update scglxt_t_gygc set endtime = curtime()";
        try {
            this.selectDataService.execute(sql);
        } catch (Exception e) {
        }

    }

    /**
     * 根据工序编排更新bom的工艺内容
     */
    public void updateBomGynrByGxbp(String bomid) {
        if (bomid == null || bomid.equals("")) {
            return;
        }
        List list = null;
        String gygcSql = "select gynr ,edgs from scglxt_t_gygc where bomid = '" + bomid + "' order by serial ";
        String gynr = "";
        String sql = "";
//		int ojb = getBomInfoByBomid(bomid) ;

        try {
            list = this.selectDataService.queryForList(gygcSql);
            if (list.size() > 0) {
                for (int i = 0; i < list.size(); i++) {
                    ListOrderedMap lom = (ListOrderedMap) list.get(i);
                    gynr += lom.get("gynr").toString() + "(" + lom.get("edgs").toString() + ")-";
                }
                gynr = gynr.substring(0, gynr.length() - 1);
            }
            sql = "update  scglxt_t_bom set gxnr =  '" + gynr + "' where id = '" + bomid + "'";
            this.selectDataService.execute(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getBomInfoByBomid(String bomid) {
        List list = null;
        int jgsl = 0;
        String sql = "select jgsl from scglxt_t_bom where id = '" + bomid + "'";
        try {
            list = this.selectDataService.queryForList(sql);
            jgsl = Integer.valueOf(list.get(0).toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jgsl;
    }

    /**
     * 加在加工工艺json数据列表
     */
    public void getJggyData() {
//		String sql = "select id ,gymc name from scglxt_t_jggy ";
        String sql = "select id  , sbmc name   from scglxt_t_sb  order by sbmc  ";
        String json = null;
        List list = this.selectDataService.queryForList(sql);
        if (list.size() >= 0) {
            json = JsonObjectUtil.list2Json(list);
//			json = "{\"data\":"+json+"}";
            Response.write(json);
        } else {
            Response.write("error");
        }

    }


    public void getGxnrData() {
        String sql = " select  id , gymc name ,gydh,fzbz ,sfwx from  scglxt_t_jggy ";
        String json = null;
        List list = this.selectDataService.queryForList(sql);
        if (list.size() >= 0) {
            json = JsonObjectUtil.list2Json(list);
            Response.write(json);
        } else {
            Response.write("error");
        }

    }

    public void calculateTimeLength() {
        String ssdd = Request.getParameter("ssdd");
        String sql = "select t2.bomid, sum(t1.jgsl*t2.edgs),t2.gynr from scglxt_t_bom t1 ,scglxt_t_gygc t2 where t2.bomid = t1.id and  t1.ssdd  =   " + ssdd +
                "group by t2.gynr";
        String json = null;
        List list = this.selectDataService.queryForList(sql);
        if (list.size() >= 0) {
            json = JsonObjectUtil.list2Json(list);
            Response.write(json);
        } else {
            Response.write("error");
        }
    }

    /**
     * 查询相应bomid 的工艺过程排序
     */
    public void loadBomGybpList() {
        String bomid = Request.getParameter("bomid");
        String sql = " select bomid ,gyid ,id ,gynr  ,edgs,serial ,zysx    from   scglxt_t_gygc where bomid = '" + bomid + "'  order by serial asc ";
        String json = null;
        List list = this.selectDataService.queryForList(sql);
        if (list.size() >= 0) {
            json = JsonObjectUtil.list2Json(list);
            Response.write(json);
        } else {
            Response.write("error");
        }
    }

    public void loadSsddList() {
        String sql = "select id , xmname mc  from  scglxt_t_dd ";
        List list = this.selectDataService.queryForList(sql);
        String json = null;
        if (list.size() >= 0) {
            json = JsonObjectUtil.list2Json(list);
            Response.write(json);
        } else {
            Response.write("error");
        }
    }


    public void loadClInfoJson() {
        String sql = "select  id ,clmc ,clsl ,clcz ,cldj,cllx , mi, clxz,kd,gd,cd,clly  from  scglxt_t_cl ";
        List list = this.selectDataService.queryForList(sql);
        String json = null;
        if (list.size() >= 0) {
            json = JsonObjectUtil.list2Json(list);
            Response.write(json);
        } else {
            Response.write("error");
        }
    }

}