<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="icon" href="<c:url value="/images/favicon.ico"/>"/>
    <title><decorator:title/> | <fmt:message key="webapp.name"/></title>
    <t:assets type="css"/>
    <t:assets type="js"/>
    
    <decorator:head/>
</head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/> >
    <c:set var="currentMenu" scope="request"><decorator:getProperty property="meta.menu"/></c:set>
    
    
        	<decorator:body/>
        


          
<%= (request.getAttribute("scripts") != null) ?  request.getAttribute("scripts") : "" %>    
</body>
</html>
