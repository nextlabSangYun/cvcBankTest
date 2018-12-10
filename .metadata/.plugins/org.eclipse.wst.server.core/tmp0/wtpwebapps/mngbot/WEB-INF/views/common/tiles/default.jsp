<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title><nl:property key="site.bot.name" /></title>
		<tiles:insertAttribute name="resource" />
	</head>
	<body>
		<c:choose>
			<c:when test="${param.win eq 'modal' || param.win eq 'popup'}">
				<tiles:insertAttribute name="body" />
			</c:when>
			<c:otherwise>
				<div class="wrap">
					<tiles:insertAttribute name="top" />
					<tiles:insertAttribute name="body" />
				</div>
			</c:otherwise>
		</c:choose>
	</body>
</html>