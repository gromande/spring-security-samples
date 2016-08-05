<?xml version="1.0" encoding="UTF-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page"
	xmlns:c="http://java.sun.com/jsp/jstl/core" version="2.0">

<jsp:directive.page import="org.springframework.security.core.userdetails.UserDetails"/>
<jsp:directive.page import="org.springframework.security.core.context.SecurityContextHolder"/>
<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" />
<jsp:output omit-xml-declaration="true" />
<jsp:output doctype-root-element="HTML"
	doctype-system="about:legacy-compat" />
<html lang="en">
<head>
<title>Profile</title>
<c:url var="faviconUrl" value="/resources/img/favicon.ico" />
<link rel="icon" type="image/x-icon" href="${faviconUrl}" />
<c:url var="bootstrapUrl" value="/resources/css/bootstrap.css" />
<link href="${bootstrapUrl}" rel="stylesheet"></link>
<c:url var="bootstrapResponsiveUrl"
	value="/resources/css/bootstrap-responsive.css" />
<link href="${bootstrapResponsiveUrl}" rel="stylesheet"></link>


</head>

<body>
	<div class="container">
		<h1>User Profile</h1>
		<div>
			<p>
				Username: <b><c:out value="${pageContext.request.remoteUser}" /></b>
			</p>
		</div>

		<div>
			<c:url var="logoutUrl" value="/logout" />
			<form class="form-inline" action="${logoutUrl}" method="post">
				<input type="submit" value="Log out" /> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
	</html>
</jsp:root>
