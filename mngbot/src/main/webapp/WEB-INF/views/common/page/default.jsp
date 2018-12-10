<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${!empty pagingVo }">
	<c:if test="${pagingVo.totRows > 0}">
		<c:if test="${pagingInfo.prevPage > 0 }">
			<a href="${pagingInfo.url}${pagingInfo.separator}${pagingInfo.pageParam}=${pagingInfo.prevPage}${pagingInfo.paramString}">[이전]</a>
		</c:if>
		<c:forEach items="${pagingInfo.pages}" var="page" >
			<c:if test="${pagingVo.page != page}">
				<a href="${pagingInfo.url}${pagingInfo.separator}${pagingInfo.pageParam}=${page}${pagingInfo.paramString}">${page}</a>
			</c:if>
			<c:if test="${pagingVo.page == page}">
				${page}
			</c:if>
		</c:forEach>
		<c:if test="${pagingInfo.nextPage <=  pagingVo.totPage}">
			<a href="${pagingInfo.url}${pagingInfo.separator}${pagingInfo.pageParam}=${pagingInfo.nextPage}${pagingInfo.paramString}">[다음]</a>
		</c:if>
	</c:if>
</c:if>
