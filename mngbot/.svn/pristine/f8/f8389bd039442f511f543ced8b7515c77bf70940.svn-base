<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set value="${list[0]}" var="info"/>
<c:set value="${list[1]}" var="currCh"/>
<c:set value="${list[2]}" var="currUi"/>
<c:set value="${list[3]}" var="compCh"/>
<c:set value="${list[4]}" var="compUi"/>
<body style="margin:0">
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
									<td style="padding-bottom:10px;font-size:20px;color:#2f3e9e">Management Bot</td>
								</tr>
								<tr>
									<td style="padding-bottom:30px;border-bottom:1px dashed #ddd;font-size:30px;color:#333">성능평가 결과 </td>
								</tr>
								<tr>
									<td style="padding:26px 0;font-size:14px;color:#666">
									<c:choose>
										<c:when test="${!empty currCh && !empty currUi}">
											<c:out value="${currUi.modelNm}"/>(<c:out value="${currUi.modelVer}"/>)
										</c:when>
										<c:otherwise>
											<c:if test="${empty currCh}">
												<c:out value="${currUi.modelNm}"/>(<c:out value="${currUi.modelVer}"/>)
											</c:if>
											<c:if test="${empty currUi}">
												<c:out value="${currCh.modelNm}"/>(<c:out value="${currCh.modelVer}"/>)
											</c:if>
										</c:otherwise>
									</c:choose>
									 성능평가 결과가 전달 되었습니다.
									</td>
								</tr>
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" width="100%" >
											<tr>
												<th style="padding:12px 18px;text-align:left;border:1px solid #dadada;border-left:0;width:114px;font-size:14px;color:#444;background:#f0f0f0">발신인</th>
												<td style="padding:12px 18px;text-align:left;border:solid #dadada;border-width:1px 0;font-size:14px;color:#666;"><c:out value="${info.sendUserNm}"/>(<c:out value="${info.sendUserGroupNm}"/>)</td>
											</tr>
											<tr>
												<th style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;border-right:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">코멘트</th>
												<td style="padding:12px 18px;text-align:left;border-bottom:1px solid #dadada;font-size:14px;color:#666;"><c:out value="${info.comment}"/></td>
											</tr>
										</table>
									</td>
								</tr>
								
								
								
								
								
								<c:if test="${info.performYn eq 'N'}">
									<c:if test="${!empty currCh && !empty compCh}">
										<tr>
											<td style="padding:28px 0 16px;">
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td style="font-size:16px;line-height:22pxcolor:#333">채널변경측정 결과</td>
														<td style="text-align:right;font-size:13px;color:#999">단위:ms</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" width="100%">
													<thead>
														<tr>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">버전</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">측정횟수</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 1px;text-align:center;font-size:14px;color:#777">${currCh.modelVer}</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totCnt}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totMin}" pattern="#,###"/><br>
																<span <c:if test="${currCh.totMin - compCh.totMin > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currCh.totMin - compCh.totMin <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currCh.totMin - compCh.totMin > 0}">+</c:if><fmt:formatNumber value="${currCh.totMin - compCh.totMin}" pattern="#,###"/>)
																	
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totMax}" pattern="#,###"/><br>
																<span <c:if test="${currCh.totMax - compCh.totMax > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currCh.totMax - compCh.totMax <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currCh.totMax - compCh.totMax > 0}">+</c:if><fmt:formatNumber value="${currCh.totMax - compCh.totMax}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totAvg}" pattern="#,###"/><br>
																<span <c:if test="${currCh.totAvg - compCh.totAvg > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currCh.totAvg - compCh.totAvg <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currCh.totAvg - compCh.totAvg > 0}">+</c:if><fmt:formatNumber value="${currCh.totAvg - compCh.totAvg}" pattern="#,###"/>)
																</span>
															</td>
														</tr>
														
														<tr>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 1px;text-align:center;font-size:14px;color:#777">${compCh.modelVer}</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compCh.totCnt}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compCh.totMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compCh.totMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compCh.totAvg}" pattern="#,###"/></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</c:if>
								</c:if>
								
								<c:if test="${info.performYn eq 'Y'}">
									<c:if test="${!empty currCh}">
										<tr>
											<td style="padding:28px 0 16px;">
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td style="font-size:16px;line-height:22pxcolor:#333">채널변경측정 결과</td>
														<td style="text-align:right;font-size:13px;color:#999">단위:ms</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" width="100%">
													<thead>
														<tr>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">버전</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">측정횟수</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:20%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 1px;text-align:center;font-size:14px;color:#777">${currCh.modelVer}</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totCnt}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currCh.totAvg}" pattern="#,###"/></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</c:if>
								</c:if>
								
								
								
								
								
								<c:if test="${info.performYn eq 'N'}">
									<c:if test="${!empty currUi && !empty compUi}">
										<tr>
											<td style="padding:28px 0 16px;">
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td style="font-size:16px;line-height:22pxcolor:#333">UI 반응시간 측정 결과</td>
														<td style="text-align:right;font-size:13px;color:#999">단위:ms</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" width="100%">
													<thead>
														<tr>
															<th rowspan="2" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">버전</th>
															<th rowspan="2" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">측정<br>횟수</th>
															<th colspan="3" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">매칭</th>
															<th colspan="3" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">커서</th>
															<th colspan="3" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">변화율</th>
														</tr>
														<tr>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 1px;text-align:center;font-size:14px;color:#777">${currUi.modelVer}</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.totCnt}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.matchTimeMin}" pattern="#,###"/><br>
																<span <c:if test="${currUi.matchTimeMin - compUi.matchTimeMin > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.matchTimeMin - compUi.matchTimeMin <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.matchTimeMin - compUi.matchTimeMin > 0}">+</c:if><fmt:formatNumber value="${currUi.matchTimeMin - compUi.matchTimeMin}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.matchTimeMax}" pattern="#,###"/><br>
																<span <c:if test="${currUi.matchTimeMax - compUi.matchTimeMax > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.matchTimeMax - compUi.matchTimeMax <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.matchTimeMax - compUi.matchTimeMax > 0}">+</c:if><fmt:formatNumber value="${currUi.matchTimeMax - compUi.matchTimeMax}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.matchTimeAvg}" pattern="#,###"/><br>
																<span <c:if test="${currUi.matchTimeAvg - compUi.matchTimeAvg > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.matchTimeAvg - compUi.matchTimeAvg <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.matchTimeAvg - compUi.matchTimeAvg > 0}">+</c:if><fmt:formatNumber value="${currUi.matchTimeAvg - compUi.matchTimeAvg}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.reactTimeMin}" pattern="#,###"/><br>
																<span <c:if test="${currUi.reactTimeMin - compUi.reactTimeMin > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.reactTimeMin - compUi.reactTimeMin <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.reactTimeMin - compUi.reactTimeMin > 0}">+</c:if><fmt:formatNumber value="${currUi.reactTimeMin - compUi.reactTimeMin}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.reactTimeMax}" pattern="#,###"/><br>
																<span <c:if test="${currUi.reactTimeMax - compUi.reactTimeMax > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.reactTimeMax - compUi.reactTimeMax <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.reactTimeMax - compUi.reactTimeMax > 0}">+</c:if><fmt:formatNumber value="${currUi.reactTimeMax - compUi.reactTimeMax}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.reactTimeAvg}" pattern="#,###"/><br>
																<span <c:if test="${currUi.reactTimeAvg - compUi.reactTimeAvg > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.reactTimeAvg - compUi.reactTimeAvg <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.reactTimeAvg - compUi.reactTimeAvg > 0}">+</c:if><fmt:formatNumber value="${currUi.reactTimeAvg - compUi.reactTimeAvg}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.diffTimeMin}" pattern="#,###"/><br>
																<span <c:if test="${currUi.diffTimeMin - compUi.diffTimeMin > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.diffTimeMin - compUi.diffTimeMin <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.diffTimeMin - compUi.diffTimeMin > 0}">+</c:if><fmt:formatNumber value="${currUi.diffTimeMin - compUi.diffTimeMin}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.diffTimeMax}" pattern="#,###"/><br>
																<span <c:if test="${currUi.diffTimeMax - compUi.diffTimeMax > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.diffTimeMax - compUi.diffTimeMax <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.diffTimeMax - compUi.diffTimeMax > 0}">+</c:if><fmt:formatNumber value="${currUi.diffTimeMax - compUi.diffTimeMax}" pattern="#,###"/>)
																</span>
															</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.diffTimeAvg}" pattern="#,###"/><br>
																<span <c:if test="${currUi.diffTimeAvg - compUi.diffTimeAvg > 0}">style="display:block;color:#ec1b1b;font-size:11px;"</c:if> <c:if test="${currUi.diffTimeAvg - compUi.diffTimeAvg <= 0}">style="display:block;color:#2f3e9e;font-size:11px;"</c:if> >
																	(<c:if test="${currUi.diffTimeAvg - compUi.diffTimeAvg > 0}">+</c:if><fmt:formatNumber value="${currUi.diffTimeAvg - compUi.diffTimeAvg}" pattern="#,###"/>)
																</span>
															</td>
														</tr>
														
														<tr>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 1px;text-align:center;font-size:14px;color:#777">${compUi.modelVer}</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.totCnt}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.matchTimeMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.matchTimeMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.matchTimeAvg}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.reactTimeMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.reactTimeMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.reactTimeAvg}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.diffTimeMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.diffTimeMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${compUi.diffTimeAvg}" pattern="#,###"/></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</c:if>
								</c:if>
								
								<c:if test="${info.performYn eq 'Y'}">
									<c:if test="${!empty currUi}">
										<tr>
											<td style="padding:28px 0 16px;">
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td style="font-size:16px;line-height:22pxcolor:#333">UI 반응시간 측정 결과</td>
														<td style="text-align:right;font-size:13px;color:#999">단위:ms</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" width="100%">
													<thead>
														<tr>
															<th rowspan="2" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;font-size:14px;color:#444;background:#f0f0f0">버전</th>
															<th rowspan="2" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">측정<br>횟수</th>
															<th colspan="3" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">매칭</th>
															<th colspan="3" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">커서</th>
															<th colspan="3" style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;font-size:14px;color:#444;background:#f0f0f0">변화율</th>
														</tr>
														<tr>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최소값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">최대값</th>
															<th style="width:9%;padding:8px 5px;text-align:center;border:1px solid #dadada;border-left:0;border-top:0;font-size:14px;color:#444;background:#f0f0f0">평균</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 1px;text-align:center;font-size:14px;color:#777">${currUi.modelVer}</td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.totCnt}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.matchTimeMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.matchTimeMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.matchTimeAvg}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.reactTimeMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.reactTimeMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.reactTimeAvg}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.diffTimeMin}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.diffTimeMax}" pattern="#,###"/></td>
															<td style="padding:10px 0;border:solid #dadada;border-width:0 1px 1px 0;text-align:center;font-size:14px;color:#777"><fmt:formatNumber value="${currUi.diffTimeAvg}" pattern="#,###"/></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</c:if>
								</c:if>
								
								
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
</body>
</html>

