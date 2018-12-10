<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="780" style="border-collapse:collapse;">
	<tr>
		<td style="padding:0 25px;">
			<table  cellpadding="0" cellspacing="0" width="100%" >
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
								<td style="padding-bottom:30px;border-bottom:1px dashed #ddd;font-size:30px;color:#333"><nl:property key="site.bot.name" /> 임시 비밀번호 발행</td>
							</tr>
							<tr>
								<td style="padding:26px 0;font-size:14px;color:#666"><nl:property key="site.bot.name" />의 아이디 ${userVo.id} 대상으로 다음과 같이 임시 비밀번호가 발행되었습니다.</td>
							</tr>
							<tr>
								<td style="padding:26px 0;text-align:center;font-size:14px;color:#444;background:#f0f0f0">임시 패스워드 : ${userVo.tempPwd } </td>
							</tr>
							<tr>
								<td style="padding:23px 0;font-size:14px;line-height:22px;color:#666">이 비밀번호로 로그인한 후 반드시 비밀번호를 변경하여 주십시오<br>감사합니다.</td>
							</tr>
							<tr>
								<td style="font-size:14px;color:#666">Management Bot Team</td>
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