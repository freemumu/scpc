<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/include/topFile.jsp" %>
<link href="${pageContext.request.contextPath}/stylesheets/plugins/select2/select2.css" media="all" rel="stylesheet"
      type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/select2/select2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/scglxt/jsgl/editBomInfo.js"></script>
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
                        Bom表
                    </div>
                    <div class="actions">
                        <a class="btn box-remove btn-xs btn-link" href="#"><i class="icon-remove"></i>
                        </a>
                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                        </a>
                    </div>
                </div>
                <div class="box-content box-no-padding">
                    <form id="form_bomInfo" class='form form-horizontal ' method="post" style='margin-bottom: 0;'>

                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3' for='form_bomInfo_zzdmc'>bom(子订单名称)</label>

                            <div class='col-sm-4 controls'>
                                <!-- data-rule-minlength='1' -->
                                <input class='form-control' id='form_bomInfo_zzdmc' info="bomInfo" name='zddmc'
                                       placeholder='子订单名称' type='text'>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3' for='form_bomInfo_ssdd'>所属订单</label>
                            <div class='col-sm-4 controls'>
                                <!-- data-rule-minlength='1' -->
                                <select class='form-control select2' id='form_bomInfo_ssdd' info="bomInfo" name='ssdd' >
                                    <option value="">
                                        -请选择-
                                    </option>
                                    <option value="1">
                                        项目8888
                                    </option>
                                    <option value="20150208214351018">
                                        项目3
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3' for='form_bomInfo_zddcz'>材质</label>
                            <div class='col-sm-4 controls'>
                                <select class='form-control select2 ' id='form_bomInfo_zddcz' info="fromInfo"
                                        name='zddcz'>
                                </select>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3' for='form_bomInfo_clxz'>材料形状</label>
                            <div class='col-sm-4 controls'>
                                <%--<input class='form-control' id='form_bomInfo_clxz' info="fromInfo"
                                       name='clxz' placeholder=' ' type='text'>--%>
                                <select class='form-control select2' id='form_bomInfo_clxz' name='clxz'>
                                    <option>
                                        -请选择-
                                    </option>
                                    <option value="1">
                                        圆柱体
                                    </option>
                                    <option value="2">
                                        长方体
                                    </option>
                                    <option value="3">
                                        其他
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3' for='form_bomInfo_cldx'>材料大小</label>
                           <%-- <div class='col-sm-4 controls' style="  ">
                                <input class='form-control' id='form_bomInfo_cldx' info="fromInfo"
                                       name='cldx' placeholder=' ' type='text' >
                            </div>--%>
                            <div class="row " id="form_bomInfo_cldx_jx" >
                                    <label>长度(cm)</label>
                                        <input  class="width:80px" type="text" name="length" class=" " placeholder="">
                                <label>宽度(cm)</label><input   class="width:80px" type="text"  name="width" class="form-control" placeholder="">
                                <label>高度(cm)</label><input   class="width:80px" type="text" name="height" class="form-control " placeholder="">

                            <%--<div class="col-sm-1">
                                    <label>宽度</label><input type="text"  name="width" class="form-control" placeholder="">
                                </div>
                                <div class="col-sm-1">
                                    <label>高度</label><input type="text" name="height" class="form-control " placeholder="">
                                </div>

                                <div class="col-sm-1">
                                    <button class="btn btn-info btn-default">计算</button>
                                </div>--%>
                            </div>
                           <%-- <div class="row" id="form_bomInfo_cldx_yx">
                                <div class="col-sm-1">
                                    <label>直径</label><input type="text" class="form-control" placeholder="">
                                </div>
                                <div class="col-sm-1">
                                    <label>高度</label><input type="text" class="form-control" placeholder="">
                                </div>
                            </div>--%>
                        </div>


                        <%--<div class="form-inline">
                              <div class="form-group">
                                  <label for="form_bomInfo_cldx_cd">长</label>
                                  <input type="text" class="form-control" id="form_bomInfo_cldx_cd" placeholder="长度">
                              </div>
                              <div class="form-group">
                                  <label for="form_bomInfo_cldx_cd">宽</label>
                                  <input type="text" class="form-control" id="form_bomInfo_cldx_kd" placeholder="长度">
                              </div>
                              <div class="form-group">
                                  <label for="form_bomInfo_cldx_cd">高</label>
                                  <input type="text" class="form-control" id="form_bomInfo_cldx_gd" placeholder="长度">
                              </div>
                          </div>--%>

                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3'>材料体积</label>

                            <div class='col-sm-4 controls'>
                                <input class='form-control' id='form_bomInfo_cltj' info="fromInfo"
                                       name='cltj' placeholder=' ' type='text'>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3'>材料金额</label>

                            <div class='col-sm-4 controls'>
                                <input class='form-control' id='form_bomInfo_clje' info="fromInfo"
                                       name='clje' placeholder=' ' type='text'>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3'>加工数量</label>

                            <div class='col-sm-4 controls'>
                                <input class='form-control' id='form_bomInfo_jgsl' info="fromInfo"
                                       name='jgsl' placeholder=' ' type='text'>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3'>表面处理</label>

                            <div class='col-sm-4 controls'>
                                <input class='form-control' id='form_bomInfo_bmcl' info="fromInfo"
                                       name='bmcl' placeholder=' ' type='text'>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3'>自订单开始时间</label>

                            <div class='col-sm-4 controls'>
                                <input class="form-control" id="form_bomInfo_starttime" info="fromInfo"
                                       name="starttime" type="text" placeholder='自订单开始时间'/>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3'>自订单结束时间</label>

                            <div class='col-sm-4 controls'>
                                <input class="form-control" id="form_bomInfo_endtime" info="fromInfo"
                                       name="endtime" type="text" placeholder='自订单结束时间'/>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label class='control-label col-sm-3 col-sm-3'>当前备料情况</label>

                            <div class='col-sm-4 controls'>
                                <select class="form-control" id="form_bomInfo_blqk" info="fromInfo"
                                        name="blqk">
                                    <option value="">-请选择-</option>
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                        </div>





                        <div class='modal-footer'>
                            <button class='btn btn-default' data-dismiss='modal' type='button'>
                                关闭
                            </button>
                            <input id="btn_save" class="btn btn-primary" type="button" value="保存">
                            <button id="btn_saving" class='btn btn-default' style="display:none;" type='button'>
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