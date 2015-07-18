<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/topFile.jsp"%>
	<link href="${pageContext.request.contextPath}/stylesheets/plugins/select2/select2.css" media="all" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/select2/select2.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/scglxt/xsgl/editHtInfo.js"></script>
	 <div id='wrapper'>	
		<div class="row">
                <div class="col-sm-12">
                  <div class="box">
                    <div class="box-header">
						<button id="form_return" class="btn btn-success btn-sm">
							<i class="icon-add"></i> 返回
						</button>                    
                      <div class="title">
                         <div class="icon-edit"></div>
                        合同信息
                      </div>
                      <div class="actions">
                        <a class="btn box-remove btn-xs btn-link" href="#"><i class="icon-remove"></i>
                        </a>
                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                        </a>
                      </div>
                    </div>
                    <div class="box-content box-no-padding">
	                      <form id="form_htInfo" class='form form-horizontal ' method="post" style='margin-bottom: 0;'>
		                        <div class='form-group'>
		                          <label class='control-label col-sm-3 col-sm-3' for='form_khxx_mc'>合同名称</label>
		                          <div class='col-sm-4 controls'>
		                          <!-- data-rule-minlength='1' -->
		                            <input class='form-control' id='form_khxx_mc' info="fromInfo" name='form_khxx_mc'  placeholder='合同名称' type='text'>
		                          </div>
		                        </div>
		                        <div class='form-group'>
		                          <label class='control-label col-sm-3 col-sm-3' for='form_khxx_htbh'>合同编号</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_htbh'  info="fromInfo" name='form_khxx_htbh'  placeholder='合同编号' type='text'>
		                          </div>
		                        </div>
		                        <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_ywlx'>业务类型</label>
		                          <div class='col-sm-4 controls'>
<!-- 			                            <input class="form-control" id="form_khxx_ywlx" info="fromInfo" name="form_khxx_ywlx" type="text" placeholder='业务类型' 	/> -->
			                            <select id="form_khxx_ywlx" class='select2 form-control'>
                      					</select>
		                          </div>
		                        </div>
		                        <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_htje'>合同金额</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_htje'  info="fromInfo" name='form_khxx_htje' placeholder='合同金额' type='text'>
		                          </div>
		                        </div>
 		                        <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_qssj'>签署时间</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_qssj' style="cursor:pointer;" info="fromInfo" name='form_khxx_qssj' placeholder='签署时间' readonly type='text'>
		                          </div>
		                        </div>
 		                        <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_dqjd'>当前进度</label>
		                          <div class='col-sm-4 controls'>
<!-- 		                          	<select id='form_khxx_dqjd' class='form-control' info="fromInfo" name='form_khxx_dqjd'> -->
<!-- 		                          		<option value="预付款">预付款</option> -->
<!-- 		                          		<option value="中期结款">中期结款</option> -->
<!-- 		                          		<option value="后期结款">后期结款</option> -->
<!-- 		                          	</select> -->
		                            <input class='form-control'  id='form_khxx_dqjd'  readonly info="fromInfo" name='form_khxx_dqjd' placeholder='当前进度' type='text'>
		                          </div>
		                        </div>
 		                        <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_fkzt'>付款状态</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_fkzt' info="fromInfo" name='form_khxx_fkzt' placeholder='付款状态' type='text'>
		                          </div>
		                        </div>	
 		                        <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_jkbfb'>结款百分比</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_jkbfb'  readonly info="fromInfo" name='form_khxx_jkbfb' placeholder='结款百分比' type='text'>
		                          </div>
		                          <label>%</label>
		                        </div>		
            		            <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_jkje'>结款金额</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_jkje' info="fromInfo" name='form_khxx_jkje' placeholder='结款金额' type='text'>
		                          </div>
		                        </div>	
            		            <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_jscb'>成本</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_jscb'  readonly info="fromInfo"  name='form_khxx_jscb' placeholder='计算成本' type='text'>
		                          </div>
		                        </div>	
            		            <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_hkzh'>汇款账户</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_hkzh' info="fromInfo" name='form_khxx_hkzh' placeholder='汇款账户' type='text'>
		                          </div>
		                        </div>			                        		                        
            		            <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_jkje'>汇款开户行</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_hkkhh' info="fromInfo" name='form_khxx_hkkhh placeholder='汇款开户行' type='text'>
		                          </div>
		                        </div>	
            		            <div class='form-group'>
		                          <label class='control-label col-sm-3' for='form_khxx_remark'>备注</label>
		                          <div class='col-sm-4 controls'>
		                            <input class='form-control'  id='form_khxx_remark' info="fromInfo" name='form_khxx_remark' placeholder='备注' type='text'>
		                          </div>
		                        </div>			                        		                        
					             <div class='modal-footer'>
					                 <button class='btn btn-default' data-dismiss='modal' type='button'>
					                   	关闭
					                 </button>
					                 <input id="btn_save" class="btn btn-primary"  type="button" value="保存">
					                 <button id="btn_saving" class='btn btn-default'  style="display:none;" type='button'>
					                  <i class="icon-1x icon-spinner icon-spin"></i>
					                   	保存中...
					                 </button>
					             </div>				                        		
		                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>