<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>系统说明</title>
    
    <script type="text/javascript" charset="utf-8" src="${staticServer}/assets/example/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${staticServer}/assets/example/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${staticServer}/assets/example/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

<body>
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >系统管理
        </li>
        <li>
            >系统说明
        </li>
    </ul>
</div>
<h1 class="page-title"> 系统说明
    <small>>>修改系统说明</small>
</h1>
<div class="row">
    <div class="col-md-12">
        <form id="sysReleaseForm" name="sysReleaseForm" class="form-horizontal" action="update.htm" method="post">
            <input type="hidden" name="id" value="${sysRelease.id }">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-3 control-label">系统名称：</label>
                    <div class="col-md-9">
                        <input id="name" maxlength="25" name="name" type="text" 
                               class="form-control input-inline  input-xlarge"
                               placeholder=""
                               value="${sysRelease.name}"> <label
                            id="nameTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">版本号：</label>
                    <div class="col-md-9">
                        <input id="version" maxlength="10" type="text" name="version" class="form-control input-inline  input-xlarge"
                               placeholder=""
                               value="${sysRelease.version}"><label
                            id="versionTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">发布日期：</label>
                    <div class="col-md-9">
                        <input id="releaseDate" maxlength="10" type="text" name="releaseDate" class="form-control input-inline  input-xlarge"
                               placeholder=""
                               value="${sysRelease.releaseDate}"><label id="releaseDateTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">发布人：</label>
                    <div class="col-md-9">
                        <input id="releaseBy" maxlength="10" type="text" name="releaseBy" class="form-control input-inline  input-xlarge"
                               placeholder=""
                               value="${sysRelease.releaseBy}"><label id="releaseByTip"></label>
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="col-md-3 control-label">发布内容：</label>
                    <div class="col-md-9">
                        <script id="editor" type="text/plain" style="height:260px"></script>
                        <input id="content" type="hidden" name="content" value="">
                        <input id="releaseContent" type="hidden" name="releaseContent" class="form-control input-inline  input-xlarge"
                               placeholder=""
                               value="${sysRelease.releaseContent}"><label id="releaseContentTip"></label>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-save"/></i> 保存</button>
                        <button type="button" class="btn default" onclick="history.back(-1)"><i
                                class="fa fa-undo"/></i>  取消
                        </button>
                    </div>
                </div>
            </div>

        </form>

    </div>
</div>
<critc-script>
    <script type="text/javascript">
    $(document).ready(function () {
    	
    	var ue = UE.getEditor('editor',{
    		autoHeightEnabled: false,         //显示滚动条
			 enableAutoSave: false,       //取消自动保存
			 autoFloatEnabled: false,      //是否保持toolbar的位置不动,默认true
			 elementPathEnabled:false ,    //显示元素路径
			 initialFrameWidth: null,
			 wordCount:false
	    });
    	
    	
    	$('#releaseDate').datetimepicker({
            lang: 'ch',
            timepicker: false,
            format: 'Y-m-d'
        });
    	
    	//编辑器初始化完成再赋值  
    	ue.ready(function() {
    		$.ajax({
  				  url: "readFile.htm",
  				  data: {path:$("#releaseContent").val()},
  				  success: function(data){
  					  ue.setContent(data);
  				  } 
			    });
    		
    	     
        });  
    	
    	
        $("#sysReleaseForm").validate({
            debug: true,
            errorElement: "label",
            errorClass: "valiError",
            errorPlacement: function (error, element) {
                error.appendTo($("#" + element.attr('id') + "Tip"));
            },
            rules: {
            	name: {
                    required: true,
                    maxlength: 25
                },
                
                version: {
                    required: true,
                    maxlength: 10,
                    remote: {
                        url: "checkVersionExist.htm", //后台处理程序
                        type: "post", //数据发送方式
                        data: { //要传递的数据
                        	    preName:"${sysRelease.name}",
                                preVersion:"${sysRelease.version}",
                        	    name: function () {
                                   return $("#name").val();
                                },
                        	    version: function () {
                                   return $("#version").val();
                                },
                            
                        },
                        dataFilter: function (json,type) {
                        	var data = JSON.parse(json);
                        	if(data.result == 0){  //与修改前相同
                        		return true;
                        	}else if(data.result == 1){  //数据库中不存在
                        		return true;
                        	}else{                  //数据库中存在
                        		return false;
                        	}
                        },
                        
                    } 
                    
                },
                 
                releaseDate: {
                    required: true,
                    maxlength: 10
                   
                }, 
            	
            	
                releaseBy: {
                	required: true,
                    maxlength: 10
                },
                
                
            },
            messages: {
            	version: {
                    remote: "该版本号已存在！"
                },
            },
            submitHandler: function (form) {
            	$("#content").val(ue.getContent());
                form.submit();
            }
        });
    });
    </script>
</critc-script>
</body>