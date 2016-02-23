<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="signup.title"/></title>
</head>

<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
        	<a href="../../index2.html"><b>Admin</b>LTE</a>
      	</div>
      	<div class="register-box-body">
      		<p class="login-box-msg">Register a new membership</p>
      		<form:form commandName="user" method="post" action="signup" id="signupForm" autocomplete="off" onsubmit="return validateSignup(this)">
      		
      		
    
          <div class="form-group has-feedback">
          	<form:input cssClass="form-control" path="username" id="username" autofocus="true" placeholder="Username"/>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
          	<form:password cssClass="form-control" path="password" id="password" showPassword="true" placeholder="Password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
          	<form:input cssClass="form-control" path="passwordHint" id="passwordHint" placeholder="Password Hint"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
          	<form:input cssClass="form-control" path="firstName" id="firstName" maxlength="50" placeholder="First Name"/>
            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
          	<form:input cssClass="form-control" path="lastName" id="lastName" maxlength="50" placeholder="Last Name"/>
            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
          	<form:input cssClass="form-control" path="email" id="email" placeholder="Email"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <form:input cssClass="form-control" path="phoneNumber" id="phoneNumber" placeholder="Phone Number"/>
            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox"> I agree to the <a href="#">terms</a>
                </label>
              </div>
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
            </div><!-- /.col -->
          </div>
        </form:form>
         <div class="social-auth-links text-center">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using Facebook</a>
          <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using Google+</a>
        </div>
        
      	<a href="<c:url value="/login"/>" class="text-center">I already have a membership</a>
      </div><!-- /.form-box -->
    </div><!-- /.register-box -->
</body>



<c:set var="scripts" scope="request">
<v:javascript formName="signup" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value="/scripts/validator.jsp"/>"></script>
<%@ include file="/scripts/components.js"%>
</c:set>

