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
  <script src="<c:url value="/static/js/Chart.js" />"></script>
  <script src="<c:url value="/static/js/menu.js" />"></script>
  
  <!-- Website Logo -->
  <link rel="icon" href="<c:url value="/static/images/default/logo.png"/>">

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
	              		<li><a class="MDC-color-grey-dark-2 MDC-font-15" href="#!">Report a Problem</a></li>
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
                    <li class="MDC-navbar-menu"><a href="#!">My Tasks</a></li>
                    <li class="MDC-navbar-menu"><a href="${contextPath}/notification">Notifications
                      </a>
                    </li>
                  </ul>
                  <div id="mySidenav" class="MDC-sidenav">
                    <a href="javascript:void(0)" class="MDC-closebtn" onclick="closeNav()">x</a>
                    <a href="#">About</a>
                    <a href="#">Services</a>
                    <a href="#">Clients</a>
                    <a href="#">Contact</a>
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
        <font class="MDC-h5-style MDC-color-grey-dark-2 MDC-display-inline">Dashboard</font>
        <font class="MDC-h5-style MDC-color-grey-light-2 MDC-display-inline MDC-relative
                     MDC-news-counterBar-position">/
        </font>
        <font class="MDC-h5-style MDC-color-blue MDC-display-inline">${user.username}</font>
        <i class="material-icons MDC-icon-small MDC-color-blue
                  MDC-news-expand-icon-position MDC-relative">expand_more</i>

      </div>
    </div>
  </div>
  <!-- TITLE PAGE - END -->

  <!-- RESUME CONTAINER -->
  <div class="MDC-page-center MDC-page-container">
    <!-- RESUME CONTENT -->
    <div class="row MDC-page-margin-top">
      <div class="col l12 MDC-padding-0 MDC-margin-right40">
        <div class="MDC-card MDC-dashboard-card-size">
          <div class="MDC-card-news-container">

            <!-- All Courses -->
            <div class="col l3">
              <div class="row center">
                <font class="MDC-font-22 MDC-color-grey-dark-2">
                  All Tasks
                </font>
              </div>
              <div class="row center">
                <font class="MDC-font-60 MDC-font-bold MDC-color-grey">
                  25
                </font>
              </div>
            </div>

            <!-- Completed Courses -->
            <div class="col l3">
              <div class="row center">
                <font class="MDC-font-22 MDC-color-grey-dark-2">
                  Completed
                </font>
              </div>
              <div class="row center">
                <font class="MDC-font-60 MDC-font-bold MDC-color-grey ">
                  18
                </font>
                <div class="progress MDC-progressBar-50 MDC-margin-0 MDC-top15 MDC-background-grey-light">
                  <div class="determinate" style="width: 70%"></div>
                </div>
              </div>
            </div>

            <!-- Missing Courses -->
            <div class="col l3">
              <div class="row center">
                <font class="MDC-font-22 MDC-color-grey-dark-2">
                  On Going
                </font>
              </div>
              <div class="row center">
                <font class="MDC-font-60 MDC-font-bold MDC-color-grey ">
                  14
                </font>
                <div class="progress MDC-progressBar-50 MDC-margin-0 MDC-top15 MDC-background-grey-light">
                  <div class="determinate yellow darken-2" style="width: 40%"></div>
                </div>
              </div>
            </div>

            <!-- Overdue Courses -->
            <div class="col l3">
              <div class="row center">
                <font class="MDC-font-22 MDC-color-grey-dark-2">
                  Overdue
                </font>
              </div>
              <div class="row center">
                <font class="MDC-font-60 MDC-font-bold MDC-color-grey ">
                  7
                </font>
                <div class="progress MDC-progressBar-50 MDC-margin-0 MDC-top15 MDC-background-grey-light">
                  <div class="determinate red darken-1" style="width: 20%"></div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
    <!-- RESUME CONTENT - END -->

    <!-- Graphics -->
    <div class="row">
      <div class="col l9 MDC-padding-0 MDC-margin-right40">
        <div class="MDC-card MDC-dashboardGraphics-card-size">
          <div class="MDC-card-news-container">

            <div>
                <canvas class="MDC-margin-top20" id="chartjs-0" width="100" height="320"></canvas>
            </div>
            <script>
            new Chart(document.getElementById("chartjs-0"), {
              type: 'line',
              data: {
                labels: ["Janeiro", "Fevereiro", "Mar�o", "Abril", "Maio"],
                datasets: [
                  {
                    label: "Tasks Completed",
                    borderColor: "#2196F3",
                    data: [15,9,30,32,21],
                    fill: false,
                    lineTension: 0.2
                  },
                  {
                    label: "Tasks Ovedue",
                    borderColor: "#e53935",
                    data: [2,6,2,8,14],
                    fill: false,
                    lineTension: 0.2
                  },
                  {
                    label: "Tasks On Going",
                    borderColor: "#fbc02d",
                    data: [9,2,7,17,19],
                    fill: false,
                    lineTension: 0.2
                  }  
                ]
              },
              "options":{
                "legend": {
                  display: false
                },
                "responsive": true,
                "maintainAspectRatio": false,
                "scales": {
                  "xAxes": [{
                            "gridLines": {
                              display:true
                            }
                  }],
                  "yAxes": [{
                            "gridLines": {
                              display:true
                            }
                            }]
                  }
              }
            });

            </script>

          </div>
        </div>
      </div>

      <!-- Courses -->
      <div class="col MDC-padding-0 right">
        <div class="MDC-card MDC-course-card-size">

          <!-- Task Title -->
          <div class="row center MDC-margin-top10">
            <font class="truncate MDC-font-15 MDC-color-grey-dark-2 MDC-font-h1">
                Task Category
              </font>
          </div>

          <!-- Image -->
          <a href="#">
            <div class="row center MDC-margin-top20">

              <div class="MDC-margin-right20 MDC-margin-left20">
                  <canvas class="MDC-margin-top20 center" id="chartjs-doughnut" width="10" height="10"></canvas>
              </div>
              <script>
              new Chart(document.getElementById("chartjs-doughnut"), {
                type: 'doughnut',
                data: {
                  labels: ["Documentation", "Programming", "Test"],
                  datasets: [ {
                    data: [
                      40,
                      20,
                      10
                    ],
                    backgroundColor: [
                    "#2196F3",
                    "#2196F3",
                    "#2196F3",
                    ],
                    label: ""
                  }]
                },
                "options":{
                  "legend": {
                    display: false,
                    position: "bottom"
                  },
                  animation: {
                  animateScale: true,
                  animateRotate: true
                  }
                }
              });

              </script>
              <!--
              <img src="images/temp/man-profile-circle-4.png"
                class="MDC-avatar-circle-large MDC-shadow-default"/> -->
            </div>
          </a>

          <!-- Task Description -->
          <div class="row center MDC-margin-bottom-10">
            <font class="truncate MDC-font-16-2 MDC-color-grey MDC-font-h1
                        MDC-uppercase-none">
               Overview
            </font>
          </div>

        <!-- CARD END -->
        </div>
      </div>
      <!-- Courses END -->


    </div>


  </div>
  <!-- RESUME CONTAINER - END -->

</body>
</html>
