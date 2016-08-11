<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="activeUsers.title"/></title>
    <meta name="menu" content="AdminMenu"/>
    <meta name="currentPage" content="ActiveUsers"/>
</head>
<body id="activeUsers">

<content tag="pageHeader"><fmt:message key="activeUsers.heading"/></content>
<content tag="pageHeaderDescription"><fmt:message key="activeUsers.message"/></content>

<content tag="breadcrumb">
	<ol class="breadcrumb">
    	<li><a href="<c:url value="/home" />"><i class="fa fa-dashboard"></i><fmt:message key="home.title"/></a></li>
        <li class="active"><fmt:message key="home.activeUsers"/></li>
    </ol>
</content>

<div class="col-sm-10">


    <div id="actions" class="form-group">
        <a href="${ctx}/home" class="btn btn-primary">
            <i class="icon-ok icon-white"></i> <fmt:message key="button.done"/></a>
    </div>

    <display:table name="applicationScope.userNames" id="user" cellspacing="0" cellpadding="0"
                   defaultsort="1" class="table table-condensed table-striped table-hover" pagesize="50" requestURI="">
        <display:column property="username" escapeXml="true" style="width: 30%" titleKey="user.username"
                        sortable="true"/>
        <display:column titleKey="activeUsers.fullName" sortable="true">
            <c:out value="${user.firstName} ${user.lastName}" escapeXml="true"/>
            <c:if test="${not empty user.email}">
                <a href="mailto:<c:out value="${user.email}"/>">
                    <img src="<c:url value="/images/iconEmail.gif"/>"
                         alt="<fmt:message key="icon.email"/>" class="icon"/></a>
            </c:if>
        </display:column>

        <display:setProperty name="paging.banner.item_name" value="user"/>
        <display:setProperty name="paging.banner.items_name" value="users"/>
    </display:table>
</div>
</body>
