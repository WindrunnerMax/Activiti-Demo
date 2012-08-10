<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<head>
	<%@ include file="/common/global.jsp"%>
	<title>待办任务列表</title>
	<%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/include-base-styles.jsp" %>
    <%@ include file="/common/include-jquery-ui-theme.jsp" %>
    <link href="${ctx }/js/common/plugins/jui/extends/timepicker/jquery-ui-timepicker-addon.css" type="text/css" rel="stylesheet" />
    <link href="${ctx }/js/common/plugins/qtip/jquery.qtip.min.css" type="text/css" rel="stylesheet" />
    <%@ include file="/common/include-custom-styles.jsp" %>
    
    <script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/extends/timepicker/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/jui/extends/i18n/jquery-ui-date_time-picker-zh-CN.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/qtip/jquery.qtip.pack.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/html/jquery.outerhtml.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/blockui/jquery.blockUI.js" type="text/javascript"></script>
	<script src="${ctx }/js/module/activiti/workflow.js" type="text/javascript"></script>
</head>

<body>
	
	<table>
		<tr>
			<th>任务ID</th>
			<th>任务Key</th>
			<th>任务名称</th>
			<th>流程定义ID</th>
			<th>流程实例ID</th>
			<th>优先级</th>
			<th>任务创建日期</th>
			<th>任务逾期日</th>
			<th>任务描述</th>
			<th>任务所属人</th>
			<th>操作</th>
		</tr>
		
		<c:forEach items="${tasks }" var="task">
		<tr>
			<td>${task.id }</td>
			<td>${task.taskDefinitionKey }</td>
			<td>${task.name }</td>
			<td>${task.processDefinitionId }</td>
			<td>${task.processInstanceId }</td>
			<td>${task.priority }</td>
			<td>${task.createTime }</td>
			<td>${task.dueDate }</td>
			<td>${task.description }</td>
			<td>${task.owner }</td>
			<td>
				<c:if test="${empty task.assignee }">
					<a class="claim" href="${ctx }/form/dynamic/task/claim/${task.id}">签收</a>
				</c:if>
				<c:if test="${not empty task.assignee }">
					<%-- 此处用tkey记录当前节点的名称 --%>
					<a class="handle" tkey='${task.taskDefinitionKey }' tname='${task.name }' href="#">办理</a>
				</c:if>
			</td>
		</tr>		
		</c:forEach>
	</table>
	
</body>
</html>