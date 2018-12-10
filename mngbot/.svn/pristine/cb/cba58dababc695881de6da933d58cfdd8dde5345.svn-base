/**
 * @title	: 구분값 options tag
 * @package	: kr.co.nextlab.tag
 * @file	: GubunOptionsTag.java
 * @author	: jnlee
 * @date	: 2017. 11. 14.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class GubunOptionsTag extends CustomOptionsTag{

	private static final long serialVersionUID = 1L;
	private String gubunKey;
	
	public String getGubunKey() {
		return gubunKey;
	}
	
	public void setGubunKey(String gubunKey) {
		this.gubunKey = gubunKey;
		setItems(GubunTagNote.getGubunList(gubunKey));
	}
	
	public void setItems(Object items) {
		setItemValue("key");
		setItemLabel("value");
		super.setItems(items);
	}
	
}
