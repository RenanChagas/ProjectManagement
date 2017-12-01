<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags"%>  

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Project Management</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/materialize.css' />"/>
  <link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/custom-css.css' />"/>

  <!--  Scripts-->
  <script src="<c:url value="/static/js/jquery-2.1.1.min.js" />"></script>
  <script src="<c:url value="/static/js/materialize.js" />"></script>
  
  <!-- Website Logo -->
  <link rel="icon" href="<c:url value="/static/images/default/logo.png"/>">

</head>
<body>

  <!-- Background image -->
	<div class="MDC-login-background"></div>

  <!-- Login Box -->
  <div class="MDC-center-container">
      <div class="MDC-container-signup ">

     
      <!-- Form -->
      <c:url var="loginUrl" value="/signup" />
      <form:form id="createUser" method="POST" modelAttribute="newUser" class="form-horizontal">
      
      	<!-- full name -->
        <div class="col s12">
        	<div class="input-field invalid MDC-color-grey-dark-2">
          	<div class="material-icons MDC-login-icon-position prefix">fingerprint</div>
            <form:input path="lastName" type="text" id="lastName" name="lastName" placeholder="Full name" 
              class="MDC-form-text MDC-color-grey-dark-2 MDC-font-15 MDC-font-weight-300"/>
        	</div>
        </div>
          
        <!-- Username-->
        <div class="col s12">
          <div class="input-field invalid MDC-color-grey-dark-2 ">
            <div class="material-icons MDC-login-icon-position prefix">account_circle</div>
            <form:input path="username" type="text" id="username" name="username" placeholder="Username" class="validate MDC-form-text 
            	MDC-color-grey-dark-2 MDC-font-15 MDC-font-weight-300 "/>
          </div>
        </div>
        <!-- Password -->
        <div class="col s12">
          <div class="input-field invalid MDC-color-grey-dark-2">
            <div class="material-icons MDC-login-icon-position prefix">lock_outline</div>
            <form:input path="password" type="password" id="password" name="password" placeholder="Password" class="validate MDC-form-text 
            	MDC-color-grey-dark-2 MDC-font-15 MDC-font-weight-300"/>
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          </div>
        </div>
        <!-- Username-->
        <div class="col s12">
          <div class="input-field invalid MDC-color-grey-dark-2 ">
            <div class="material-icons MDC-login-icon-position prefix">email</div>
            <form:input path="email" type="email" id="email" name="email" placeholder="Email" class="validate MDC-form-text 
            	MDC-color-grey-dark-2 MDC-font-15 MDC-font-weight-300"/>
          </div>
        </div>
        <!-- Submit -->
        <!-- Login Button -->
        <div class="col s12">
          <div class="MDC-center-image">
          	<button id="signup" class="btn btn-large waves-effect waves-light blue MDC-form-text" type="submit" name="action">
               Create Account
               <i class="material-icons right">done</i>
            </button>
          </div>
        </div>
      </form:form>
      
    </div>
  </div>
  <!-- Login Box - END -->

</body>
</html>
