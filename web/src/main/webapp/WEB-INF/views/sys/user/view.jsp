<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>用户管理</title>
</head>
<critc-css>
    <link rel="stylesheet"
          href="${staticServer}/assets/cropper3.0/cropper.min.css"/>
    <link rel="stylesheet" href="${staticServer}/assets/cropper3.0/main.css"/>
    <link href="${staticServer}/assets/metronic4.7/pages/css/profile.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticServer }/assets/zTree3.5/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
</critc-css>
<body class="no-skin">

<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >个人信息
        </li>



    </ul>
</div>


<h1 class="page-title inline"> 个人信息
    ${sysUser.completion}%


</h1>


<div class="row  col-md-10 col-md-offset-1">
    <form id="userForm" name="userForm" class="form-horizontal "
          action="update.htm" method="post">
        <div class="tabbable-custom  nav-justified">
            <ul class="nav nav-tabs ">
                <li class="active" id="pt">
                    <a href="#tab_1_1" data-toggle="tab"> 基本信息 </a>
                </li>
                <li class="" id="yx">
                    <a href="#tab_1_2" data-toggle="tab"> 更多信息 </a>
                </li>
            </ul>
            <input type="hidden" name="tab" value="1" id="tab2">
            <%--<div class="portlet light bordered  col-md-12 col-md-offset-1">--%>
            <div class="tab-content ">

                <div class="tab-pane fade active in " id="tab_1_1">
                    <div class="row ">
                        <div class="col-md-7">
                            <input type="hidden" name="backUrl" value="${backUrl }">
                            <input type="hidden" name="id" id="id" value="${sysUser.id}">
                            <div class="form-group">
                                <label class="col-md-3 control-label">账号：</label>
                                <div class="col-md-9">
                                    <input id="username" type="text" name="username"
                                           class="form-control input-inline input-medium " readonly
                                           placeholder="" value="${sysUser.username}"
                                           style="border: hidden;background: none">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">真实姓名：</label>
                                <div class="col-md-9">
                                    <input id="realname" type="text" name="realname"
                                           class="form-control input-inline input-medium "
                                           placeholder="" value="${sysUser.realname}"><label
                                        id="realnameTip"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">姓名拼音：</label>
                                <div class="col-md-9">
                                    <input id="pinyin" type="text" name="pinyin"
                                           class="form-control input-inline input-medium"
                                           placeholder="" value="${sysUser.pinyin}"><label
                                        id="pinyinTip"></label>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom:-20px;">
                                <label class="col-md-3 control-label">性别：</label>
                                <div class="col-md-9 ">
                                    <div class="mt-radio-inline">
                                        <label class="mt-radio">
                                            <input type="radio" class="input-inline" name="gender"
                                                   id="male" value="男"/>男
                                            <span></span>
                                        </label>
                                        <label class="mt-radio">
                                            <input type="radio" class="input-inline" name="gender"
                                                   id="female"
                                                   value="女"/>女
                                            <span></span>
                                        </label>
                                    </div>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">手机：</label>
                                <div class="col-md-9">
                                    <input id="mobile" type="text" name="mobile"
                                           class="form-control input-inline input-medium"
                                           placeholder="" value="${sysUser.mobile}"/><label
                                        id="mobileTip"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">部门：</label>
                                <div class="col-md-9">
                                    <input type="hidden" id="departmentId" name="departmentId"
                                           class="form-control" value="${sysUser.departmentId}"/>
                                    <input id="departmentName" type="text" name="departmentName"
                                           class="form-control input-inline input-medium " readonly
                                           placeholder="" value="${sysUser.departmentName}"
                                           style="border: hidden;background: none">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">角色：</label>

                                <div class="col-md-9">
                                    <input type="hidden" id="roleId" name="roleId"
                                           class="form-control" value="${sysUser.roleId}"/>
                                    <input id="roleName" type="text" name="roleName"
                                           class="form-control input-inline input-medium " readonly
                                           placeholder="" value="${sysUser.roleName}"
                                           style="border: hidden;background: none">
                                </div>


                            </div>
                        </div>

                        <div class=" col-md-4">
                            <!-- PORTLET MAIN -->
                            <div class="portlet light   bg-inverse" style="width:200px;height:250px;margin:0 auto">
                                <!-- SIDEBAR USERPIC -->
                                <div class="row" style="width:90%;margin:0 auto">
                                    <input type="hidden" class="avatar" name="avatar" value="${sysUser.avatar}">
                                    <input type="hidden"  id="isHad" name="isHad" value="0">
                                    <img id="imgAvatar" src="${imageServer}${sysUser.avatar}"
                                         class="img-responsive" alt="">
                                </div>
                                <!-- END SIDEBAR USERPIC -->
                                <!-- SIDEBAR BUTTONS -->
                                <br/>
                                <div class="row" style="text-align:center">
                                    <button type="button"
                                            class="btn btn-circle blue btn-sm"
                                            id="btnEditAvatar">修改头像
                                    </button>

                                </div>
                                <br/>
                                <!-- END SIDEBAR BUTTONS -->
                            </div>
                        </div>

                    </div>

                </div>
                <%--<div class="portlet light bordered col-md-12  col-md-offset-1">--%>
                <div class="tab-pane fade active in" id="tab_1_2">

                    <div class="row ">

                        <input type="hidden" name="backUrl" value="${backUrl }"/>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">邮箱：</label>
                                <div class="col-md-8">
                                    <input id="email" type="text" name="email"
                                           class="form-control input-inline " style="width:90%"
                                           placeholder="" value="${sysUser.email}"><label
                                        id="emailTip"></label>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">职务：</label>
                                <div class="col-md-8 ">
                                    <form:select path="sysUser.jobTitle" name="jobTitle"
                                                 class="form-control input-inline" style="width:90%"
                                                 id="jobTitle">
                                        <option value="">请选择职务</option>
                                        <form:options items="${listJobTitle }" itemValue="name"
                                                      itemLabel="name"/>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">职称：</label>
                                <div class="col-md-8">
                                    <form:select path="sysUser.post" name="post"
                                                 class="form-control input-inline" style="width:90%"
                                                 id="post">
                                        <option value="">请选择职称</option>
                                        <form:options items="${listPost }" itemValue="name"
                                                      itemLabel="name"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">身份证号：</label>
                                <div class="col-md-8">
                                    <input id="idcard" type="text" name="idcard"
                                           class="form-control input-inline " style="width:90%"
                                           placeholder="" value="${sysUser.idcard}"><label
                                        id="idcardTip"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">政治面貌：</label>
                                <div class="col-md-8">
                                    <form:select path="sysUser.political" name="political"
                                                 class="form-control input-inline " style="width:90%"
                                                 id="political">
                                        <option value="">请选择政治面貌</option>
                                        <form:options items="${listPolitical}" itemValue="name"
                                                      itemLabel="name"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">民族：</label>
                                <div class="col-md-8">
                                    <form:select path="sysUser.nation" name="nation"
                                                 class="form-control input-inline " style="width:90%"
                                                 id="nation">
                                        <option value="">请选择民族</option>
                                        <form:options items="${listNation }" itemValue="name"
                                                      itemLabel="name"/>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">教育程度：</label>
                                <div class="col-md-8">
                                    <form:select path="sysUser.education" name="education "
                                                 class="form-control input-inline " style="width:90%"
                                                 id="education ">
                                        <option value="">请选择教育程度</option>
                                        <form:options items="${listEducation}" itemValue="name"
                                                      itemLabel="name"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">毕业院校：</label>
                                <div class="col-md-8">
                                    <input id="graduatedSchool" type="text" name="graduatedSchool"
                                           class="form-control input-inline " style="width:90%"
                                           placeholder="" value="${sysUser.graduatedSchool}"/><label
                                        id="graduatedSchoolTip"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">座机：</label>
                                <div class="col-md-8">
                                    <input id="telephone" type="text" name="telephone"
                                           class="form-control input-inline " style="width:90%"
                                           placeholder="" value="${sysUser.telephone}"><label
                                        id="telephoneTip"></label>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">专业：</label>
                                <div class="col-md-8">
                                    <input id="major" type="text" name="major"
                                           class="form-control input-inline " style="width:90%"
                                           placeholder="" value="${sysUser.major}"><label
                                        id="majorTip"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="col-md-4 control-label">排序：</label>
                                <div class="col-md-8">
                                    <input id="displayOrder" type="text" name="displayOrder"
                                           class="form-control input-inline " style="width:90%"
                                           placeholder="" value="${sysUser.displayOrder}">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

        </div>
        <div class="form-actions col-md-12">
            <div class="row">
                <div class=" col-md-offset-4 col-md-6">
                    <button  type="button" onclick="save()" save class="btn btn-primary"><i class="fa fa-save"/></i> 保存
                    </button>
                    <button type="button" class="btn default" onclick="history.back(-1)"><i
                            class="fa fa-undo"/></i>  取消
                    </button>
                </div>
            </div>
        </div>


    </form>

</div>
<div class="row" id="crop-avatar">
    <!-- Cropping modal -->
    <div class="modal fade" id="avatar-modal" aria-hidden="false"
         aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form class="avatar-form" id="avatar-form"
                      action="${dynamicServer}/sys/user/uploadAvatar.htm"
                      enctype="multipart/form-data" method="post" accept="image/*">
                    <div class="modal-header">
                        <button type="button" class="close" onclick="javascript:closeAvatar();">&times;</button>
                        <h4 class="modal-title" id="avatar-modal-label">修改头像</h4>
                    </div>
                    <div class="modal-body">
                        <div class="avatar-body">
                            <!-- Upload image and data -->
                            <div class="avatar-upload">
                                <input type="hidden" class="avatar-src" name="avatar_src">
                                <input type="hidden" class="avatar-data" name="avatar_data">
                                <input type="hidden" name="userId" value="0">
                                <label for="avatarInput" class="btn btn-primary">选择图片</label> <input
                                    type="file" class="avatar-input" id="avatarInput"
                                    name="avatar_file" style="display: none;" accept="image/*">
                            </div>

                            <!-- Crop and preview -->
                            <div class="row">
                                <div class="col-md-9">
                                    <div  id="preview"  class="avatar-wrapper"></div>
                                </div>
                                <div class="col-md-3">
                                    <div class="avatar-preview preview-lg"></div>
                                    <div class="avatar-preview preview-md"></div>
                                    <div class="avatar-preview preview-sm"></div>
                                </div>
                            </div>

                            <div class="row avatar-btns">
                                <div class="col-md-6">

                                    <button type="submit"  onclick="confirm()" class="btn btn-primary avatar-save">
                                        <i class="fa fa-save"/></i> 保存
                                    </button>
                                    <button type="button" class="btn btn-default"
                                            onclick="javascript:closeAvatar();">
                                        <i class="fa fa-undo"/></i> 取消

                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- /.modal -->
    <!-- Loading state -->
    <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
</div>
<div class="modal fade" id="departmentList" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">选择部门</h4>
            </div>
            <div class="modal-body">
                <ul id="tree" class="ztree" style="width: 560px; overflow: auto;"></ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="javascript:getSelected();">确认</button>
                <button type="button" class="btn " data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="dialog-viewLogin" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width:1000px;height:500px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">登录历史</h4>
            </div>
            <div class="modal-body">
                <table id="loginHis" class="display" cellspacing="0" width="800">
                    <thead>
                    <tr>
                        <th width=40>#</th>
                        <th width=140>登录时间</th>
                        <th width="120">登录IP</th>
                        <th>终端</th>
                        <th>浏览器类型</th>
                        <th>浏览器版本</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" id="closeLoginTable" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>

<critc-script>
    <script
            src="${staticServer}/assets/cropper3.0/cropper.min.js"></script>
    <script
            src="${staticServer}/assets/cropper3.0/main.js"></script>
    <script src="${staticServer }/assets/zTree3.5/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $("#btnEditAvatar").bind('click', showAvatar);
            $("#realname").bind('change',getpinyin);
            $("input[name='gender']").each(function () {
                if ($(this).val() == '${sysUser.gender}') {
                    $(this).attr("checked", true);
                }
            });

            if ($("#isHad").val()=="0" && ${sysUser.avatar eq null}) {

                if (${sysUser.gender eq '女'}) {
                    document.getElementById('imgAvatar').src = "${imageServer}/sys/user/avatar/female.jpg";
                } else {
                    document.getElementById('imgAvatar').src = "${imageServer}/sys/user/avatar/male.jpg";
                }
                $("input[name='gender']").bind('change', function () {
                        if ($("input[name='gender']:checked").val() == "女")
                            document.getElementById('imgAvatar').src = "${imageServer}/sys/user/avatar/female.jpg"
                        else
                            document.getElementById('imgAvatar').src = "${imageServer}/sys/user/avatar/male.jpg"
                    }
                );
            }

            init();

        });
        function getpinyin(){
            var  realname = $("#realname").val();
            $.ajax({
                type: 'POST',
                url: 'getPinYin.htm',
                dataType: 'json',
                data:{
                    realname:realname
                },
                success: function (result) {
                    if (result["success"]) {
                        $('#pinyin').val(result.pinyin);


                    }
                }

            });

        }
        function init() {
            $("#tab_1_1").addClass("active in");
            $("#tab_1_2").removeClass("active in");
            $("#pt").addClass("active");
            $("#yx").removeClass("active");

        }
        function closeAvatar() {
            $('#avatar-form')[0].reset();
            $('#avatar-modal').modal('hide');
        }
        function showAvatar() {
            $('#avatar-modal').modal('show');
        }

        var zTree;
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: ""
                }
            }
        };
        var zNodes = [${ztree}];
        jQuery(document).ready(function () {
            var t = $("#tree");
            t = $.fn.zTree.init(t, setting, zNodes);
            var zTree = $.fn.zTree.getZTreeObj("tree");
        });

        function getSelected() {
            var treeObj = $.fn.zTree.getZTreeObj("tree");
            var nodes = treeObj.getSelectedNodes();
            if (nodes.length > 0) {
                $("#departmentId").val(nodes[0].id);
                $("#departmentName").val(nodes[0].name);
                $('#departmentList').modal('hide');
            }
            else return;

        }
        function showAvatar() {
            $('#avatar-modal').modal('show');
        }
        function showSelTree() {
            $('#departmentList').modal('show');
        }
        jQuery.validator.addMethod("isIdCardNo", function (value, element) {
            var regex = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
            return this.optional(element) || regex.test(value);
        }, "请正确输入您的身份证号码");
        $(document).ready(function () {
            $("#userForm").validate({
                //debug : true,
                errorElement: "label",
                errorClass: "valiError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                    realname: {
                        required: true,
                        maxlength: 20
                    },
                    mobile: {
                        mobile: true,
                        required: true,
                        maxlength: 11,

                    },
                    roleId: {
                        required: true
                    },
                    email: {
                        maxlength: 30,
                        email: true,
                    },
                    idcard: {
                        isIdCardNo: true
                    }
                },
                messages: {
                    username: {
                        remote: "账号已存在！"
                    },
                    mobile: {
                        remote: "此手机号已注册过账号！"
                    },
                    idcard: {
                        idcard: "请输入正确的身份证号"
                    }
                },
//                methods: {
//                    idcard: function (value, element) {
//                        return
//                        /^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)/.test(element.defaultValue)
//                    },

                submitHandler: function (form) {
                    form.submit();
                }
                // }
            });
        });
        //登录记录
        var viewLoginHis = function (id, title) {
            $('#dialog-viewLogin').modal('show')
            $('#loginHis').DataTable().ajax.reload();
        }
        $(function () {
            //提示信息
            var lang = {
                //"sProcessing": "处理中...",
                "sLengthMenu": "每页 _MENU_ 项",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
                "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页",
                    "sJump": "跳转"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            };

            //初始化表格
            var table = $("#loginHis").dataTable({
                scrollY: '50vh',
                scrollCollapse: true,
                language: lang,  //提示信息
                autoWidth: false,  //禁用自动调整列宽
                stripeClasses: ["odd", "even"],  //为奇偶行加上样式，兼容不支持CSS伪类的场合
                processing: true,  //隐藏加载提示,自行处理
                serverSide: true,  //启用服务器端分页
                searching: false,  //禁用原生搜索
                orderMulti: false,  //启用多列排序
                ordering: false,
                bLengthChange: false,   //去掉每页显示多少条数据方法
                pageLength: 20,//每页多少条记录
                order: [],  //取消默认排序查询,否则复选框一列会出现小箭头
                renderer: "bootstrap",  //渲染样式：Bootstrap和jquery-ui
                pagingType: "bootstrap_full_number",  //分页样式：simple,simple_numbers,full,full_numbers
                ajax: function (data, callback, settings) {
                    //封装请求参数
                    var param = {};
                    param.pageSize = 20;//页面显示记录条数，在页面显示每页显示多少项的时候
                    param.start = data.start;//开始的记录序号
                    param.pageIndex = (data.start / data.length) + 1;//当前页码
                    param.userId = ${sysUser.id};
                    $.ajax({
                        type: "GET",
                        url: "searchUserLogin.htm",
                        cache: false,  //禁用缓存
                        data: param,  //传入组装的参数
                        dataType: "json",
                        success: function (result) {
                            //setTimeout仅为测试延迟效果
                            setTimeout(function () {
                                //封装返回数据
                                var returnData = {};
                                returnData.draw = data.draw;//这里直接自行返回了draw计数器,应该由后台返回
                                returnData.recordsTotal = result.total;//返回数据全部记录
                                returnData.recordsFiltered = result.total;//后台不实现过滤功能，每次查询均视作全部结果
                                returnData.data = result.data;//返回的数据列表
                                //调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染
                                //此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
                                callback(returnData);
                            }, 200);
                        }
                    });
                },
                //列表表头字段
                columns: [
                    {
                        "data": "index", "render": function (data, type, row, meta) {
                        var startIndex = meta.settings._iDisplayStart;
                        return startIndex + meta.row + 1;
                    }
                    },
                    {"data": "loginDate"},
                    {"data": "loginIp"},
                    {"data": "terminal"},
                    {"data": "explorerType"},
                    {"data": "explorerVersion"}
                ]
            }).api();
            //此处需调用api()方法,否则返回的是JQuery对象而不是DataTables的API对象
        });

        var imgurl;

        function confirm() {
            var dataURL = $("#preview > img").cropper("getCroppedCanvas");

            imgurl = dataURL.toDataURL("image/png", 0.3);
            $("#imgAvatar").attr("src", imgurl);
            $("#isHad").val("1");
            imgurl= convertBase64UrlToBlob(imgurl);
            $('#avatar-modal').modal('hide');

        }
        //保存用户信息
        function save() {
            var form=document.getElementById("userForm");
            var data = new FormData(form);
            data.append("file", imgurl);
            $.ajax({
                type: "POST",
                url: '${dynamicServer}/sys/user/update.htm',
                data: data,
                dataType : "json",
                processData:false,
                contentType : false,
                success: function (data) {
                    window.location.href=data.msgText+"&backUrl=${backUrl}"+"";
                }
            });
        }
        function convertBase64UrlToBlob(urlData){

            var bytes=window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte

            //处理异常,将ascii码小于0的转换为大于0
            var ab = new ArrayBuffer(bytes.length);
            var ia = new Uint8Array(ab);
            for (var i = 0; i < bytes.length; i++) {
                ia[i] = bytes.charCodeAt(i);
            }

            return new Blob( [ab] , {type : 'image/png'});
        }

    </script>
</critc-script>