/**
 * @title	: 메뉴 vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: MenuVo.java
 * @author	: jnlee
 * @date	: 2017. 12. 13.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class MenuVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String menuId;
	private String appId;
	private String menuNm;
	private String useYn;
	private int menuOrder;
	private Date regDtm;
	private String menuParId;
	private String menuUrl;
	private String pageType;
	private String regId;
	
	private String path;
	private int lvl;
	private String sort;
	
	private String authMenuId;
	private String authId;
	private String userGroupId;
	
}
