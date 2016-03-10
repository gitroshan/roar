<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="login.title"/></title>
    <meta name="menu" content="Login"/>
</head>
<body id="login" class="hold-transition login-page">

<div class="login-box">
      <div class="login-logo">
        <a href="<c:url value="/home"/>"><b><fmt:message key="webapp.name"/></b></a>
      </div><!-- /.login-logo -->
      <div id="loginBoxBody" class="login-box-body">
        <p class="login-box-msg"><fmt:message key="login.message"/></p>

	<form id="loginForm" action="<c:url value='/j_security_check'/>" method="post" autocomplete="off" onsubmit="return validateForm(this)">
          
          <c:if test="${param.error != null}">
			    <div id="loginFormError" class="callout callout-danger">
			    	<h4><i class="icon fa fa-ban"></i> <fmt:message key="page.warning"/></h4>
			        <p><fmt:message key="errors.password.mismatch"/></p>
			    </div>
		  </c:if>

		  <div id="loginFormErrorJs" class="callout callout-danger" style="display: none;"></div>
			  
		  <div id="j_username-form-group" class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="<fmt:message key="label.username"/>" name="j_username" id="j_username" tabindex="1">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div id="j_password-form-group" class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="<fmt:message key="label.password"/>" name="j_password" id="j_password" tabindex="2">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
          <c:if test="${appConfig['rememberMeEnabled']}">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label for="rememberMe">
                  <input type="checkbox" name="_spring_security_remember_me" id="rememberMe" tabindex="3"> <fmt:message key="login.rememberMe"/>
                </label>
              </div>
            </div><!-- /.col -->
           </c:if>
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat" name="login" tabindex="4"><fmt:message key='button.login'/></button>
            </div><!-- /.col -->
          </div>
        </form>
        
        <div class="social-auth-links text-center">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i><fmt:message key='login.facebook'/></a>
          <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i><fmt:message key='login.google'/></a>
        </div><!-- /.social-auth-links -->
		<br/>
        <p>
		    <fmt:message key="login.signup">
		        <fmt:param><c:url value="/signup"/></fmt:param>
		    </fmt:message>
		</p>
		<p><fmt:message key="login.passwordHint"/></p>

		<p><fmt:message key="updatePassword.requestRecoveryTokenLink"/></p>
        
        <c:set var="scripts" scope="request">
			<%@ include file="/scripts/login.js"%>
			<%@ include file="/scripts/components.js"%>
		</c:set>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

</body>