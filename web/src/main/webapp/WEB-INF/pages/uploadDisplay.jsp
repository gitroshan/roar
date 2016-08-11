<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="display.title"/></title>
    <meta name="menu" content="AdminMenu"/>
    <meta name="currentPage" content="FileUpload"/>
</head>

<content tag="pageHeader"><fmt:message key="display.heading"/></content>
<content tag="pageHeaderDescription">Below is a list of attributes that were gathered in FileUploadController.java.</content>

<content tag="breadcrumb">
	<ol class="breadcrumb">
    	<li><a href="<c:url value="/home" />"><i class="fa fa-dashboard"></i><fmt:message key="home.title"/></a></li>
        <li class="active"><fmt:message key="display.heading"/></li>
    </ol>
</content>

<div class="col-sm-10">


    <table class="table-striped" cellpadding="5">
        <tr>
            <th>Friendly Name:</th>
            <td><c:out value="${friendlyName}"/></td>
        </tr>
        <tr>
            <th>Filename:</th>
            <td><c:out value="${fileName}"/></td>
        </tr>
        <tr>
            <th>File content type:</th>
            <td><c:out value="${contentType}"/></td>
        </tr>
        <tr>
            <th>File size:</th>
            <td><c:out value="${size}"/></td>
        </tr>
        <tr>
            <th class="tallCell">File Location:</th>
            <td>The file has been written to: <br />
                <a href="<c:out value="${link}"/>"><c:out value="${location}" escapeXml="false"/></a>
            </td>
        </tr>
    </table>
    <div id="actions" class="form-group">
        <a class="btn btn-primary" href="home" >
            <i class="icon-ok icon-white"></i>
            <fmt:message key="button.done"/>
        </a>
        <a class="btn btn-default" href="fileupload" >
            <i class="icon-upload"></i>
            Upload Another
        </a>
    </div>
</div>


