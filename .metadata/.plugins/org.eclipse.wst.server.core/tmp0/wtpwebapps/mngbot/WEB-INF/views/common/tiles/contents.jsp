<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title><nl:property key="site.bot.name" /></title>
		<tiles:insertAttribute name="resource" />
	</head>
	<body>
		<tiles:insertAttribute name="body" />
	</body>
</html>