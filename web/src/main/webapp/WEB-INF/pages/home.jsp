<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="home.title"/></title>
    <meta name="menu" content="Home"/>
</head>
<body>

<content tag="pageHeader"><fmt:message key="home.heading"/></content>
<content tag="pageHeaderDescription"><fmt:message key="home.message"/></content>

<content tag="breadcrumb">
	<ol class="breadcrumb">
    	<i class="fa fa-dashboard"></i><li class="active">&nbsp;&nbsp;<fmt:message key="home.title"/></li>
    </ol>
</content>

<ul class="glassList">
    <li>
        <a href="<c:url value='/userform'/>"><fmt:message key="menu.user"/></a>
    </li>
    <li>
        <a href="<c:url value='/fileupload'/>"><fmt:message key="menu.selectFile"/></a>
    </li>
</ul>
</body>
