/**
 * @title	: 시퀀스 모델
 * @package	: kr.co.nextlab.comm.model
 * @file	: Sequence.java
 * @author	: sist818
 * @date	: 2017. 12. 4.
 * @desc	: 
 */
package kr.co.nextlab.comm.model;

import lombok.Data;

@Data
public class SequenceVo {
	
    /**
     * 시퀀스 아이디(crt_num_id)
     */
    private String sequenceId;

    /**
     * 일련번호길이(num_len)
     */
    private int length;

    /**
     * 시퀀스이름(crt_num_name)
     */
    private String sequenceName;

    /**
     * 시퀀스키(crt_num_key)
     */
    private String sequenceKey;

    /**
     * 다음번호(next)
     */
    private long next;
    
    public String next() {
        return String.format("%0" + this.length + "d", this.next);
    }

    public void increase() {
        this.next++;
    }

}
