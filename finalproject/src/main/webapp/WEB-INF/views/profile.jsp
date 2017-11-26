<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags"%>  

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Course Management</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/materialize.css' />"/>
  <link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/custom-css.css' />"/>

  <!--  Scripts-->
  <script src="<c:url value="/static/js/jquery-2.1.1.min.js" />"></script>
  <script src="<c:url value="/static/js/materialize.js" />"></script>
  <script src="<c:url value="/static/js/menu.js" />"></script>
  
  <!-- Website Logo -->
  <link rel="icon" href="<c:url value="/static/images/default/logo.png"/>">
  
  <script type="text/javascript">

  $(document).ready(function(){
	  
	  
		//Window refresh
		if ($(window).width() <= 1111) {
	      $("#avatar-div").addClass('center');
	  }
		
		if ($(window).width() >= 1112) {
			$("#avatar-div").removeClass('center');
		}
	  
	  
	  $('#uploadAvatar').click(function(e){
		  	e.preventDefault();
		    $('#input-avatar').trigger('click');
	  });
	  $('#input-avatar').on("change", function() {
		    $('#form-avatar').submit();
	  });
	  
  });
  
  $(window).resize(function() {
	  if ($(window).width() <= 1111) {
		  $("#avatar-div").addClass('center');
	  }
	  else if ($(window).width() >= 1112) {
		  $("#avatar-div").removeClass('center');
		}
  });
				
  </script>	    		


</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<!-- NAV TOP  -->
	<nav id="logo_nav" class="MDC-navbar-style MDC-shadow-0 hide-on-small-and-down">
    	<div class="nav-wrapper MDC-nav-margin">
    		<!--  NAV CONTAINER -->
      		<div class="row MDC-nav-top-container ">

        	<!-- Logo -->
        	<div class="col s12 m3 l2">
          		<div class="MDC-nav-logo-position">
          			<img src="<c:url value="/static/images/default/logo.png"/>" class="MDC-nav-logo-size"/>
          		</div>
        	</div>

        	<!-- Search -->
        	<div class="col s12 m7 l7">
          		<div class="MDC-nav-search-position">
            	<form>
              		<div class="input-field">
                		<input id="search" type="search" class="MDC-nav-search-focus" required>
                		<label class="label-icon" for="search"><i class="material-icons MDC-nav-search-focus">search</i></label>
                  		<i class="material-icons MDC-nav-search-focus">close</i>
              		</div>
            	</form>
          		</div>
        	</div>

        	<!-- Avatar -->
        	<div class="col s12 m2 l3">
          		<div class="MDC-nav-account-position">
	            	<!-- Dropdown Trigger -->
	            	<a class="dropdown-button " data-beloworigin="true"
	               		href='#' data-activates='account-dropdown'>
	               		<div class="MDC-nav-account-option-position hide-on-med-and-down">
	                		 <i class="material-icons MDC-icon-small MDC-color-grey-light">expand_more</i>
	               		</div>
	               		<span class="MDC-login-text MDC-nav-account-text-position 
	               					MDC-color-grey-light hide-on-med-and-down">
	                 	${user.username}
	               		</span>
	               		<img src="<c:url value="/static/images/avatar/${user.username}/${user.username}.png"/>"
	               				class="MDC-avatar-circle-small mdc-nav-avatar-position"/>
	            	</a>
	            	<!-- Dropdown Structure -->
	            	<ul id='account-dropdown' class='dropdown-content MDC-nav-account-dropdown-position'>
	              		<li><a id="profile" class="modal-trigger MDC-color-grey-dark-2 MDC-font-15" href="${contextPath}/profile">Profile</a></li>
	              		<li class="divider"></li>
	              		<li><a class="MDC-color-grey-dark-2 MDC-font-15" href="${contextPath}/logout">Logout</a></li>
	            	</ul>
          		</div>
        	</div>

			</div>
			<!--  NAV CONTAINER - END-->
		</div>
	</nav>
	<!-- NAV TOP - END -->
  	
  	<!-- NAV MENU  -->
  <div class="MDC-menu-fullWidth">
    <div class="MDC-shadow-bottom">
      <header class="MDC-shadow-bottom">
        <nav id="menu_nav" class="MDC-navbar-menu-size MDC-navbar-style MDC-shadow-0 MDC-nav-margin">
          <div class="nav-wrapper MDC-nav-margin MDC-left">
            <!-- MENU ROW -->
            <div class="row">
              <div class="col">
                <div class="MDC-nav-menu-container">

                  <ul id="nav-mobile" class="MDC-nav-menu-ul left left-align">
                    <a href="#" id="mobile-icon" onclick="openNav()" class="left MDC-padding-mobile-0
                    MDC-hover-none">
                      <i class="material-icons MDC-nav-tabs-icon MDC-color-grey-light">
                        menu
                      </i>
                    </a>
                    <li class="MDC-navbar-menu"><a class="active MDC-navbar-active" href="${contextPath}/dashboard">Dashboard</a></li>
                    <li class="MDC-navbar-menu"><a href="${contextPath}/projects">Projects</a></li>
                    <li class="MDC-navbar-menu"><a href="${contextPath}/task/myTasks">My Tasks</a></li>
                    <li class="MDC-navbar-menu"><a href="${contextPath}/notification">Notifications
                      </a>
                    </li>
                  </ul>
                  <div id="mySidenav" class="MDC-sidenav">
                    <a href="javascript:void(0)" class="MDC-closebtn" onclick="closeNav()">x</a>
                    <a href="${contextPath}/dashboard">Dashboard</a>
                    <a href="${contextPath}/projects">Projects</a>
                    <a href="${contextPath}/task/myTasks">My Tasks</a>
                    <a href="${contextPath}/notification">Notifications</a>
                    <a href="${contextPath}/profile">Profile</a>
                    <a href="${contextPath}/logout">Logout</a>
                  </div>

                </div>
              </div>
            </div>
            <!-- MENU ROW - END -->
          </div>
        </nav>
      </header>
    </div>
  </div>
  <!-- NAV MENU - END -->
	
  <!-- TITLE PAGE -->
  <div class="row  MDC-page-center MDC-page-container">
    <div class="col MDC-padding-0 left">
      <div class="MDC-page-title-size">
        <font class="MDC-h5-style MDC-color-grey-dark-2 MDC-display-inline ">Profile</font>
        <font class="MDC-h5-style MDC-color-grey-light-2 MDC-display-inline MDC-relative
                     MDC-news-counterBar-position">/
        </font>
        <font class="MDC-h5-style MDC-color-blue MDC-display-inline">${user.username}</font>
        
      </div>
    </div>
  </div>
  <!-- TITLE PAGE - END -->

  <div class="MDC-page-center MDC-page-container">
    <div class="row MDC-page-margin-top">

      <!-- AVATAR LEFT -->   
      <form id="form-avatar" method="POST" action="uploadFile" enctype="multipart/form-data">   
      <div id="avatar-div" class="col s12 m12 l3 MDC-padding-0 MDC-profile-margin-bottom">
        <a id="uploadAvatar" class="btn-floating btn waves-effect MDC-absolute
                                  MDC-profile-add-position right">
          <i class="material-icons">add</i>
        </a>
        <input id="input-avatar" name="file" type="file" hidden>
        <img src="<c:url value="/static/images/avatar/${user.username}/${user.username}.png"/>"
             class="MDC-image-circle-large MDC-shadow-default"/>
        
      </div>
	  </form>
	  
      <!-- FORM - BEGIN -->
      <form:form id="profile-form" method="POST" modelAttribute="user" class="form-horizontal">
      <div class="col s12 m12 l9 MDC-padding-0">
        <div class="MDC-card MDC-profile-card-container">
          
            <!-- FIRST NAME -->
            <div class="input-field col s12 m6 l6 MDC-margin-bottom8">
              	<form:input value="${user.firstName}" id="firstName" placeholder="" type="text" path="firstName" 
              			length="15" data-length="100" 
						class="MDC-border-grey-light MDC-font-15 MDC-color-grey-dark-2 MDC-font-weight-300"/>
				<label for="input_text">Name</label>
            </div>
            <!-- LAST NAME -->
            <div class="input-field col s12 m6 l6 MDC-margin-bottom8">
              	<form:input value="${user.lastName}" id="lastName"	placeholder=""	type="text"	path="lastName"  
              			data-length="100" class="MDC-border-grey-light MDC-font-15 MDC-color-grey-dark-2 MDC-font-weight-300"/>
              	<label for="lastName">Last Name</label>
            </div>
            <!-- EMAIL -->
            <div class="input-field col s12 m6 l6 MDC-margin-bottom8">
              <form:input value="${user.email}" id="email" placeholder="" type="email" path="email"
              			data-length="100" class="MDC-border-grey-light MDC-font-15 MDC-color-grey-dark-2 MDC-font-weight-300"/>
              <label for="email">Email</label>
            </div>
            <!-- USERNAME -->
            <div class="input-field col s12 m6 l6 MDC-margin-bottom8">
              <form:input value="${user.username}" id="username" placeholder="" type="text" path="username"  
              			data-length="100" class="MDC-border-grey-light MDC-font-15 MDC-color-grey-dark-2 MDC-font-weight-300"/>
              <label for="username">Username</label>
            </div>
            <!-- JOB DESCRIPTION -->
            <div class="input-field col s12 m6 l6 MDC-margin-bottom8">
              <form:input value="${user.jobDesc}" id="jobDesc" placeholder="" type="text" path="jobDesc"
              			data-length="50" class="MDC-border-grey-light MDC-font-15 MDC-color-grey-dark-2 MDC-font-weight-300"/>
              <label for="jobDesc">Job Description</label>
            </div>
            <!-- JOB DESCRIPTION -->
            <div class="input-field col s12 m6 l6 MDC-margin-bottom8">
              <form:input value="password" id="password" placeholder="" type="password" path="password"
              			data-length="20" class="MDC-border-grey-light MDC-font-15 MDC-color-grey-dark-2 MDC-font-weight-300"/>
              <label for="password">Password</label>
            </div>
        </div>
        <button id="salvar" type="submit" class="btn waves-effect waves-light
        blue MDC-form-text right" name="action">
          Salvar
        </button>
      </div>
      </form:form>
      <!-- FORM - END -->

    </div>
  </div>

</body>
</html>
