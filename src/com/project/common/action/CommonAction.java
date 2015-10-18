package com.project.common.action;

import com.project.base.service.SelectDataService;
import com.project.commonModel.util.Request;
import com.project.commonModel.util.Response;
import com.project.util.JsonObjectUtil;
import org.apache.commons.logging.Log;
import java.util.List;

/**
 * Created by Founder on 2015/10/18.
 */
public class CommonAction {
    private static Log log = org.apache.commons.logging.LogFactory.getLog(CommonAction.class);
    private SelectDataService selectDataService;
    public SelectDataService getSelectDataService() {
        return selectDataService;
    }
    public void setSelectDataService(SelectDataService selectDataService) {
        this.selectDataService = selectDataService;
    }

    /**
     * 查询数据字典列表
     */
    public void loadSjzdList(){
        String pid =  Request.getParameter("pid") ;
        String sql = "select  id ,mc  from scglxt_tyzd where id like '"+pid+"_%' order by mc ";
        List list = this.selectDataService.queryForList(sql);
        String json = JsonObjectUtil.list2Json(list);
        Response.write(json);
    }


}
