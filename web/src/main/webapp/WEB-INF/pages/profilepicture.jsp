<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="update.profile.picture.title"/></title>
    <meta name="menu" content="UserMenu"/>
    <meta name="currentPage" content="ProfilePicture"/>
</head>

<content tag="pageHeader"><fmt:message key="update.profile.picture.heading"/></content>
<content tag="pageHeaderDescription"><fmt:message key="update.profile.picture.message"/></content>

<content tag="breadcrumb">
	<ol class="breadcrumb">
    	<li><a href="<c:url value="/home" />"><i class="fa fa-dashboard"></i><fmt:message key="home.title"/></a></li>
        <li class="active"><fmt:message key="update.profile.picture.title"/></li>
    </ol>
</content>

<div class="col-sm-7">
    <spring:bind path="profilePicture.*">
        <c:if test="${not empty status.errorMessages}">
        <div class="alert alert-danger alert-dismissable">
        	<button aria-hidden="true" data-dismiss="alert" class="close" type="button">&times;</button>
        	<i class="icon fa fa-ban"></i>
<!--             <a href="#" data-dismiss="alert" class="close">&times;</a> -->
            <c:forEach var="error" items="${status.errorMessages}">
                <c:out value="${error}" escapeXml="false"/><br />
            </c:forEach>
        </div>
        </c:if>
    </spring:bind>

    <form:form commandName="profilePicture" method="post" action="profilepicture" enctype="multipart/form-data" 
    	onsubmit="return validateFileUpload(this)" id="profilepictureForm" cssClass="well">
        <spring:bind path="profilePicture.picture">
        <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
        </spring:bind>
            <input type="file" name="picture" id="picture"/>
        </div>
        <div class="form-group">
            <button type="submit" name="upload" class="btn btn-primary" onclick="bCancel=false">
                <i class="icon-upload icon-white"></i> <fmt:message key="button.upload"/>
            </button>
            <button type="submit" name="cancel" class="btn btn-default" onclick="bCancel=true">
                <i class="icon-remove"></i> <fmt:message key="button.cancel"/>
            </button>
        </div>
    </form:form>
</div>
