<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
<title>用户登录</title>
<link rel="stylesheet"
	href="${staticServer}/assets/example/autocomplete/css/jquery.autocomplete.css" />
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>系统管理</li>
			<li>>用户登录管理</li>
		</ul>
	</div>
	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-cogs"></i>操作面板
			</div>
			<div class="tools">
				<a href="javascript:;" class="collapse"> </a>
			</div>
		</div>
		<div class="portlet-body">
			<div class="table-responsive">
				<table class="searchTable">
					<tr>
						<td>账号：</td>
						<td><input type="text" id="username"
							class="form-control input-small" placeholder=""
							value="${sysUserLoginSearchVO.username }" /></td>
						<td>登录IP：</td>
						<td><input type="text" id="loginIp"
							class="form-control input-small" placeholder=""
							value="${sysUserLoginSearchVO.loginIp }" /></td>
						<td>起止日期：</td>
						<td><input type="text" id="startDate"
							class="form-control input-small" placeholder=""
							value="${sysUserLoginSearchVO.startDate }"></td>
						<td>至</td>
						<td><input type="text" id="endDate"
							class="form-control input-small" placeholder=""
							value="${sysUserLoginSearchVO.endDate }"></td>
						<td>
							<button class="btn btn-primary" id="btnSearch">
								<i class="ace-icon fa fa-search"></i> 查询
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table id="simple-table"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width=40>#</th>
						<th width="100">用户姓名</th>
						<th width="100">账号</th>
						<th width="120">登录时间</th>
						<th width="120">登录IP</th>
						<th width="120">登录终端</th>
						<th width="120">浏览器类型</th>
						<th width="120">浏览器版本</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${list }" var="sysLog" varStatus="st">
						<tr>
							<td>${st.index+1 }</td>
							<td>${sysLog.realname }</td>
							<td>${sysLog.username }</td>
							<td><fmt:formatDate value="${sysLog.loginDate}"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td>${sysLog.loginIp }</td>
							<td><c:if test="${sysLog.terminal eq 0}">PC</c:if> <c:if
									test="${sysLog.terminal eq 1}">WAP</c:if> <c:if
									test="${sysLog.terminal eq 2}">ANDROID</c:if> <c:if
									test="${sysLog.terminal eq 3}">IOS</c:if></td>
							<td>${sysLog.explorerType }</td>
							<td>${sysLog.explorerVersion }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- /.span -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-xs-12">${ pageNavigate.pageModel}</div>
	</div>

</body>
<critc-script>
<script
	src="${staticServer}/assets/example/autocomplete/js/jquery.autocomplete.js"></script>
	 <script type="text/javascript">
        $(function () {
            $("#btnSearch").bind('click', searchUser);

            $('#startDate').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'Y-m-d'
            });
            $('#endDate').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'Y-m-d'
            });
        });

        // 查询方法
        var searchUser = function () {
            var url = "index.htm?";
            if ($("#username").val() != '')
                url += "&username=" + $("#username").val();
            if ($("#loginIp").val() != '')
                url += "&loginIp=" + $("#loginIp").val();
            if ($("#startDate").val() != '')
                url += "&startDate=" + $("#startDate").val();
            if ($("#endDate").val() != '')
                url += "&endDate=" + $("#endDate").val();
            window.location = encodeURI(url);
        }
        
        var names ; //定义数据  
        //开始函数  
        $(document).ready(function(){  
          $.ajax({  
            type:'POST',  
            contentType: "application/json",  
            url: "getAutoComplteList.htm",  
            dataType: "json",
            success:function(data){  
              names = data;  
              autocompleteFn(data);  
            }  
          });  
        });  
        
      //自动 补全方法  
        function autocompleteFn(names){  
          $("#username").autocomplete(names,{  
            minChars:0,  
            max: 10,  
            dataType:"json",  
            autoFill: true,  
            mustMatch: false,  
            matchContains: true,  
            scrollHeight: 220,  
            formatItem: function(data, i, total) {  
            	 return "<font style='color:black;font-size:14px'>"+data.username+"</font>";  
            },  
            formatMatch: function(data, i, total) {  
              return data.username;  
            },  
            formatResult: function(data) {  
              return data.username;  
            }  
          });  
        }  
    </script> </critc-script>