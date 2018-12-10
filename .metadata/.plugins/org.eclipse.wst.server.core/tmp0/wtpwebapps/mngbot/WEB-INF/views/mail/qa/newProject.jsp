<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="780" style="border-collapse:collapse;">
	<tr>
		<td style="padding:0 25px;">
			<table cellpadding="0" cellspacing="0" width="100%" >
				<tr>
					<td style="padding:15px 0;border-bottom:2px solid #6570b0">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td><img src="<nl:property key="site.url" />:<nl:property key="site.port" />/images/common/img_email_logo.png" alt=""></td>
								<td align="right" style="font-size:13px;color:#999">${nowDate}</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="padding:35px;border:1px solid #ddd;border-top:0;">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td style="padding-bottom:10px;font-size:20px;color:#2f3e9e"><nl:property key="site.bot.name" /></td>
							</tr>
							<tr>
								<td style="padding-bottom:30px;border-bottom:1px dashed #ddd;font-size:30px;color:#333">새 프로젝트 구성원 등록 알림</td>
							</tr>
							<tr>
								<td style="padding:26px 0;font-size:14px;color:#666"><c:out value="${userNm}"/>님은 새 프로젝트 [<c:out value="${qaProjectVo.projectNm}"/>] 에 구성원으로 등록되었습니다.</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" width="100%" >
										<tr>
											<th style="padding:12px 18px;text-align:left;border:1px solid #dadada;border-left:0;width:114px;font-size:14px;color:#444;background:#f0f0f0">프로젝트이름</th>
											<td style="padding:12px 18px;text-align:left;border:solid #dadada;border-width:1px 0;font-size:14px;color:#666;"><c:out value="${qaProjectVo.projectNm}"/></td>
										</tr>
										<tr>
											<th style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;border-right:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">기간</th>
											<td style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;font-size:14px;color:#666;"><c:out value="${qaProjectVo.projectStDt}"/> ~ <c:out value="${qaProjectVo.projectEndDt}"/></td>
										</tr>
										<tr>
											<th style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;border-right:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">측정모델</th>
											<td style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;font-size:14px;color:#666;line-height:23px;">
												<c:forEach var="list" items="${qaProjectVo.modelList}" varStatus="num">
													<c:out value="${list.modelNm}"/>(<c:out value="${list.modelVer}"/>)
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;border-right:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">참여인력</th>
											<td style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;font-size:14px;color:#666;line-height:23px;">
												<c:forEach var="list" items="${qaProjectVo.partiList}" varStatus="num">
													<c:out value="${list.userNm}"/>(<c:out value="${list.userGroupNm}"/>)
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;border-right:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">비고</th>
											<td style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;font-size:14px;color:#666;line-height:23px;"><c:out value="${qaProjectVo.bigo}"/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="padding:23px 0;font-size:13px;color:#999">* 본 메일은 발신전용 메일로 회신되지 않습니다.</td>
				</tr>
			</table>
		</td>
	</tr>
</table>