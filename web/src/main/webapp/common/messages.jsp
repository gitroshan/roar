<%-- Error Messages --%>
<c:if test="${not empty errors}">
    <div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">&times;</button>
        <i class="icon fa fa-ban"></i>
        <c:forEach var="error" items="${errors}">
            <c:out value="${error}"/><br />
        </c:forEach>
    </div>
    <c:remove var="errors"/>
</c:if>

<%-- Success Messages --%>
<c:if test="${not empty successMessages}">
    <div class="alert alert-success alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">&times;</button>
        <i class="icon fa fa-check"></i>
        <c:forEach var="msg" items="${successMessages}">
            <c:out value="${msg}"/><br />
        </c:forEach>
    </div>
    <c:remove var="successMessages" scope="session"/>
</c:if>
