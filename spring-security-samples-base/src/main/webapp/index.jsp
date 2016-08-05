<?xml version="1.0" encoding="UTF-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page"
	xmlns:c="http://java.sun.com/jsp/jstl/core" version="2.0">

	<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" />
	<jsp:output omit-xml-declaration="true" />
	<jsp:output doctype-root-element="HTML"
		doctype-system="about:legacy-compat" />
	<html lang="en">
<head>
<title>Snoop</title>
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
		<h1>Secure This</h1>
		<div>
			<p>
				Remote User: <b><c:out value="${pageContext.request.remoteUser}" /></b>
			</p>
			<p>
				Principal Name: <b><c:out
						value="${pageContext.request.userPrincipal.name}" /></b>
			</p>
            <p>Roles:</p>
            <ul>
			<c:if test="${not empty pageContext.request.userPrincipal}">
				<c:if test="${pageContext.request.isUserInRole('USER')}">
					<li>User has <strong>USER</strong> role</li>
				</c:if>
				<c:if test="${pageContext.request.isUserInRole('ADMIN')}">
					<li>User has <strong>ADMIN</strong> role</li>
				</c:if>
				<c:if test="${pageContext.request.isUserInRole('ENGINEERING')}">
                    <li>User has <strong>ENGINEERING</strong> role</li>
                </c:if>
			</c:if>
            </ul>
		</div>

		<div>
			<p>Request Headers:</p>
			<ul>
				<c:forEach var="reqHeader" items="${header}">
					<li><strong><c:out value="${reqHeader.key}" /></strong>: <c:out
							value="${reqHeader.value}" /></li>
				</c:forEach>
			</ul>
		</div>

		<div>
			<p>Request Cookies:</p>
			<ul>
				<c:forEach var="reqCookie" items="${cookie}">
					<li><strong><c:out value="${reqCookie.key}" /></strong>: <c:out
							value="value=${reqCookie.value.value}; domain=${reqCookie.value.domain}; 
							path=${reqCookie.value.path}; maxAge=${reqCookie.value.maxAge}; 
							secure=${reqCookie.value.secure}, http-only=${reqCookie.value.httpOnly}" /></li>
				</c:forEach>
			</ul>
		</div>

		<div>
			<p>Request Parameters:</p>
			<ul>
				<c:forEach var="reqParam" items="${param}">
					<li><strong><c:out value="${reqParam.key}" /></strong>: <c:out
							value="${reqParam.value}" /></li>
				</c:forEach>
			</ul>
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
