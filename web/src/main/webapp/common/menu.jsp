<%@ include file="/common/taglibs.jsp"%>
<security:authentication property="principal" var="principal" />
<li>
	<a href="<c:url value="/home"/>"> 
		<i class="fa fa-dashboard"></i>
		<span>
			<fmt:message key="home.title"/>
		</span> 
	</a>
</li>
<li>
	<a href="<c:url value="/userform"/>"> 
		<i class="fa fa-pencil-square-o"></i>
		<span>
			<fmt:message key="menu.user"/>
		</span> 
	</a>
</li>
<c:if test="${principal.authorities == '[ROLE_ADMIN]' }">
<c:choose>
	<c:when test="${currentMenu == 'AdminMenu'}"><li class="active treeview"></c:when>
	<c:otherwise><li class="treeview"></c:otherwise>
</c:choose>

	<a href="#"> 
		<i class="fa fa-user-secret"></i>
		<span>
			<fmt:message key="menu.admin"/>
		</span> 
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<c:choose>
			<c:when test="${currentPage == 'ViewUsers'}"><li class="active"></c:when>
			<c:otherwise><li></c:otherwise>
		</c:choose>
		
			<a href="<c:url value="/admin/users"/>">
				<i class="fa fa-users"></i> 
				<fmt:message key="menu.admin.users"/>
			</a>
		</li>
		<c:choose>
			<c:when test="${currentPage == 'ActiveUsers'}"><li class="active"></c:when>
			<c:otherwise><li></c:otherwise>
		</c:choose>
			<a href="<c:url value="/admin/activeUsers"/>">
				<i class="fa fa-user"></i>
				<fmt:message key="home.activeUsers"/>
			</a>
		</li>
		<c:choose>
			<c:when test="${currentPage == 'ReloadContext'}"><li class="active"></c:when>
			<c:otherwise><li></c:otherwise>
		</c:choose>
			<a href="<c:url value="/admin/reload"/>">
				<i class="fa fa-refresh"></i>
				<fmt:message key="menu.admin.reload"/>
			</a>
		</li>
		<c:choose>
			<c:when test="${currentPage == 'FileUpload'}"><li class="active"></c:when>
			<c:otherwise><li></c:otherwise>
		</c:choose>
			<a href="<c:url value="/fileupload"/>">
				<i class="fa fa-upload"></i>
				<fmt:message key="menu.selectFile"/>
			</a>
		</li>
	</ul>
</li>
</c:if>
