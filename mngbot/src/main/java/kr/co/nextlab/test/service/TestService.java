package kr.co.nextlab.test.service;

import java.util.List;

import kr.co.nextlab.comm.model.PageList;
import kr.co.nextlab.test.model.TestCriteria;
import kr.co.nextlab.test.model.TestVo;

public interface TestService {
	
	public TestVo selectTestTran();
	public int intertTestTran(TestVo testVo);
	public int updateTestTran(TestVo testVo);
	
	public PageList<TestVo> selectPageList(TestCriteria criteria);
	
	public List<TestVo> selectList(TestCriteria criteria);
	
}